module HQMF
  
  # preconditions can be in several places.
  #
  # precondition -> preconditions
  # restriction -> preconditions
  #
  # also, restrictions can be on the following, which can then have preconditions
  #   restrictions
  #   comparisons
  #   preconditions
  #
  class PreconditionExtractor
   
   
    def self.extract_preconditions_from_restrictions(restrictions,data_criteria_converter)
      return [] unless restrictions
      preconditions = []
      restrictions.each do |restriction|
        preconditions.concat(extract_preconditions_from_restriction(restriction,data_criteria_converter))
      end
      preconditions      
    end
    
    # get all the preconditions for a restriction
    # we need to iterate down 
    #   restriction.preconditions
    #   restriction.comparison
    #   restriction.restriction
    def self.extract_preconditions_from_restriction(restriction,data_criteria_converter)
      target_id=nil
      if restriction[:target_id] and data_criteria_converter.v1_data_criteria_by_id[restriction[:target_id]]
        target_id = data_criteria_converter.v1_data_criteria_by_id[restriction[:target_id]].id
      elsif restriction[:target_id]
        puts "\tPrecondition Data Criteria MISSING: #{restriction[:target_id]}"
      end
      type = restriction[:type]
      if (restriction[:negation]) 
        inverted = HQMF::TemporalReference::INVERSION[type] 
        if (inverted)
          type = inverted
        else
          puts "\tdon't know how to invert #{type}"
        end
      end
      
      # if we reference the measurement period, then we want to check if the reference is to the start or end of the measurement period
      # if we SBS of the END of the measurement period, we want to convert that to SBE of the measurement period
      if target_id == HQMF::Document::MEASURE_PERIOD_ID
        references_start = {'SBS'=>'SBE','SAS'=>'SAE','EBS'=>'EBE','EAS'=>'EAE'}
        references_end = {'EBE'=>'EBS','EAE'=>'EAS','SBE'=>'SBS','SAE'=>'SAS'}
        if data_criteria_converter.measure_period_v1_keys[:measure_start] == restriction[:target_id] and references_end[type]
          # before or after the END of the measurement period START.  Convert to before or after the START of the measurement period.
          # SAE of MPS => SAS of MP
          type = references_end[type]
        elsif data_criteria_converter.measure_period_v1_keys[:measure_end] == restriction[:target_id] and references_start[type]
          # before or after the START of the measurement period END.  Convert to before or after the END of the measurement period.
          # SBS of MPE => SBE of MP
          type = references_start[type]
        end
      end
      
      value = nil
      if (restriction[:range])
        value = HQMF::Range.from_json(JSON.parse(restriction[:range].to_json)) if (restriction[:range])
      elsif(restriction[:value])
        value = HQMF::Converter::SimpleOperator.parse_value(restriction[:value])
      end
      field = restriction[:field]
      field_code = restriction[:field_code]
      field_time = restriction[:field_time]
      operator = HQMF::Converter::SimpleOperator.new(HQMF::Converter::SimpleOperator.find_category(type), type, value, field, field_code, field_time)
      
      # get the precondtions off of the restriction
      children = HQMF::PreconditionConverter.parse_and_merge_preconditions(restriction[:preconditions],data_criteria_converter) if restriction[:preconditions]
      
      if restriction[:comparison]
        children ||= []
        # check comparison and convert it to a precondition
        comparison = convert_comparison_to_precondition(restriction[:comparison], data_criteria_converter)
        children << comparison
      end
      
      # check restrictions
      restrictions = extract_preconditions_from_restrictions(restriction[:restrictions], data_criteria_converter) if restriction[:restrictions]
      if (children)
        HQMF::PreconditionConverter.apply_restrictions_to_comparisons(children, restrictions) unless restrictions.nil? or restrictions.empty?
      end
      
      
      container = nil
      # check if there is an expression on the restriction
      if (restriction[:expression])
        # this is for things like TIMEDIFF
        type = restriction[:expression][:type]
        exp_operator = HQMF::Converter::SimpleOperator.new(HQMF::Converter::SimpleOperator.find_category(type), type, HQMF::Converter::SimpleOperator.parse_value(restriction[:expression][:value]))
        preconditions = []
        
        driv_preconditions = []
        restrictions.each {|element| driv_preconditions << element if element.is_a? HQMF::Converter::SimpleRestriction and element.operator.type == 'DRIV'}
        
        if driv_preconditions and !driv_preconditions.empty?
          preconditions = driv_preconditions.map(&:preconditions).flatten
        end
      
        reference = nil
        conjunction_code = nil
        
        comparison_precondition = HQMF::Converter::SimplePrecondition.new(nil,[HQMF::Converter::SimpleRestriction.new(exp_operator, nil, preconditions)],reference,conjunction_code, false)
        comparison_precondition.klass = HQMF::Converter::SimplePrecondition::COMPARISON

        comparison_precondition.subset_comparison = true
        container = HQMF::Converter::SimpleRestriction.new(operator, nil, [comparison_precondition])
      
      # check if there is a subset on the restriction
      elsif restriction[:subset]
        # if we have a subset, we want to create a Comparison Precondition for the subset and have it be the child of the operator on the restriction.
        # the reason for this is that we want the order of operations to be SBS the FIRST of a data criteria, rather than FIRST of SBS of a data criteria
        
        subset_type = restriction[:subset]
        subset_operator = HQMF::Converter::SimpleOperator.new(HQMF::Converter::SimpleOperator.find_category(subset_type), subset_type, nil)
        
        reference = nil
        conjunction_code = nil
        
        restriction = HQMF::Converter::SimpleRestriction.new(subset_operator, target_id)
        restriction.preconditions = children
        
        comparison_precondition = HQMF::Converter::SimplePrecondition.new(nil, [restriction], reference, conjunction_code, false)
        comparison_precondition.klass = HQMF::Converter::SimplePrecondition::COMPARISON
        
        container = HQMF::Converter::SimpleRestriction.new(operator, nil, [comparison_precondition])
      else
        container = HQMF::Converter::SimpleRestriction.new(operator, target_id)
        container.preconditions = children
      end
      
      [container]
    end


    # we want the comparisons to be converted to the leaf preconditions
    def self.convert_comparison_to_precondition(comparison, data_criteria_converter)

      data_criteria = data_criteria_converter.v1_data_criteria_by_id[comparison[:data_criteria_id]]
      reference = HQMF::Reference.new(data_criteria.id)
#      conjunction_code = "#{data_criteria.type.to_s.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }}Reference"
      conjunction_code = nil

      preconditions = []
      if comparison[:restrictions]
         # check for preconditions on restrictions
         preconditions = extract_preconditions_from_restrictions(comparison[:restrictions], data_criteria_converter) 
      end
      
      precondition = HQMF::Converter::SimplePrecondition.new(nil,preconditions,reference,conjunction_code, false)
      precondition.klass = HQMF::Converter::SimplePrecondition::COMPARISON
      
      if (comparison[:subset])
        # create a restriction for a comparison subset... this is for things like first, second, etc.
        type = comparison[:subset]
        operator = HQMF::Converter::SimpleOperator.new(HQMF::Converter::SimpleOperator.find_category(type), type, nil)
        restriction = HQMF::Converter::SimpleRestriction.new(operator, reference.id, nil)
        precondition.preconditions ||= []
        precondition.preconditions << restriction
      end

      precondition
    end
    
    # flatten a tree of preconditions into an array... if we are doing something like a count, we just want the flat list
    def self.flatten_v2_preconditions(preconditions)
      flattened = []
      preconditions.each do |precondition|
        if (precondition.reference and precondition.has_preconditions?)
          raise "don't know how to handle a condition with a reference that has preconditions" if (precondition.reference and precondition.has_preconditions?)
        end
        if (precondition.reference) 
          flattened << precondition
        else
          flattened.concat(flatten_v2_preconditions(precondition.preconditions))
        end
      end
      flattened
    end
    
  end  
end
