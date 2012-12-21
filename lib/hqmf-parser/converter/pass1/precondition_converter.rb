module HQMF
  # Class for converting an HQMF 1.0 representation to an HQMF 2.0 representation
  class PreconditionConverter
    
    def self.parse_preconditions(source,data_criteria_converter)

      # preconditions = []
      # source.each do |precondition|
      #   preconditions << HQMF::PreconditionConverter.parse_precondition(precondition,data_criteria_converter)
      # end
      # 
      # preconditions
      
      parse_and_merge_preconditions(source,data_criteria_converter)
    end
   
    # converts a precondtion to a hqmf model
    def self.parse_precondition(precondition,data_criteria_converter)
      
      # grab child preconditions, and parse recursively
      preconditions = parse_and_merge_preconditions(precondition[:preconditions],data_criteria_converter) if precondition[:preconditions] || []
      
      preconditions_from_restrictions = HQMF::PreconditionExtractor.extract_preconditions_from_restrictions(precondition[:restrictions], data_criteria_converter)
      
      # driv preconditions are preconditions that are the children of an expression
      driv_preconditions = []
      preconditions_from_restrictions.delete_if {|element| driv_preconditions << element if element.is_a? HQMF::Converter::SimpleRestriction and element.operator.type == 'DRIV'}
      
      apply_restrictions_to_comparisons(preconditions, preconditions_from_restrictions) unless preconditions_from_restrictions.empty?

      conjunction_code = convert_logical_conjunction(precondition[:conjunction])

      if (precondition[:expression])
        # this is for things like COUNT
        type = precondition[:expression][:type]
        operator = HQMF::Converter::SimpleOperator.new(HQMF::Converter::SimpleOperator.find_category(type), type, HQMF::Converter::SimpleOperator.parse_value(precondition[:expression][:value]))
        children = []
        if driv_preconditions and !driv_preconditions.empty?
          children = driv_preconditions.map(&:preconditions).flatten
        end
        
        reference = nil
        # take the conjunction code from the parent precondition
        
        restriction = HQMF::Converter::SimpleRestriction.new(operator, nil, children)
        
        comparison_precondition = HQMF::Converter::SimplePrecondition.new(nil,[restriction],reference,conjunction_code, false)
        comparison_precondition.klass = HQMF::Converter::SimplePrecondition::COMPARISON
        comparison_precondition.subset_comparison = true
        preconditions << comparison_precondition
      end
      
      reference = nil
      
      negation = precondition[:negation]
      
      
      if (precondition[:comparison])
        preconditions ||= []
        comparison_precondition = HQMF::PreconditionExtractor.convert_comparison_to_precondition(precondition[:comparison],data_criteria_converter)
        preconditions << comparison_precondition
      end


      if (precondition[:subset])
        # this is for things like FIRST on preconditions
        type = precondition[:subset]
        operator = HQMF::Converter::SimpleOperator.new(HQMF::Converter::SimpleOperator.find_category(type), type, nil)
        children = preconditions
        
        reference = nil
        # take the conjunction code from the parent precondition
        
        restriction = HQMF::Converter::SimpleRestriction.new(operator, nil, children)
        
        comparison_precondition = HQMF::Converter::SimplePrecondition.new(nil,[restriction],reference,conjunction_code, false)
        comparison_precondition.klass = HQMF::Converter::SimplePrecondition::COMPARISON
        preconditions = [comparison_precondition]
      end

      
      HQMF::Converter::SimplePrecondition.new(nil,preconditions,reference,conjunction_code, negation)
      
    end

    def self.get_comparison_preconditions(preconditions)
      comparisons = []
      preconditions.each do |precondition|
        if (precondition.comparison? and !precondition.subset_comparison)
          comparisons << precondition
        elsif(precondition.has_preconditions?)
          comparisons.concat(get_comparison_preconditions(precondition.preconditions))
        else
          raise "precondition with no comparison or children... not valid"
        end
      end
      comparisons
    end

    def self.apply_restrictions_to_comparisons(preconditions, restrictions)
      comparisons = get_comparison_preconditions(preconditions)
      raise "no comparisons to apply restriction to" if comparisons.empty?
      comparisons.each do |comparison|
        comparison.preconditions.concat(restrictions)
      end
    end
    
    private 
    
    
    def self.parse_and_merge_preconditions(source,data_criteria_converter)
      return [] unless source and source.size > 0
      preconditions_by_conjunction = {}
      source.each do |precondition|
        parsed = HQMF::PreconditionConverter.parse_precondition(precondition,data_criteria_converter)
        preconditions_by_conjunction[parsed.conjunction_code] ||= []
        preconditions_by_conjunction[parsed.conjunction_code]  << parsed
      end
      
      merge_precondtion_conjunction_groups(preconditions_by_conjunction)
    end
    
    def self.merge_precondtion_conjunction_groups(preconditions_by_conjunction)
      joined = []
      preconditions_by_conjunction.each do |conjunction_code, preconditions|
        sub_conditions = []
        negated_conditions = []
        preconditions.each do |precondition|
          unless (precondition.negation)
            sub_conditions.concat precondition.preconditions if precondition.preconditions
          else
            negated_conditions.concat precondition.preconditions if precondition.preconditions
          end
        end
        
        if (!sub_conditions.empty?)
          # if we have negated conditions, add them to a new precondition with an inverted conjunction on a negated precondition
          # the reason we invert the conjunction is because we are turning 
          # AND: NOT X
          # AND: NOT Y
          # into 
          # NOT: X OR Y
          # (i.e, demorgan's law)
          if (!negated_conditions.empty?)
            inverted_conjunction_code = HQMF::Precondition::INVERSIONS[conjunction_code]
            sub_conditions << HQMF::Converter::SimplePrecondition.new(nil,negated_conditions,nil,inverted_conjunction_code, true)
          end
          joined << HQMF::Converter::SimplePrecondition.new(nil,sub_conditions,nil,conjunction_code, false)
        elsif (!negated_conditions.empty?)
          # invert conjunction based on demorgan's law
          inverted_conjunction_code = HQMF::Precondition::INVERSIONS[conjunction_code]
          joined << HQMF::Converter::SimplePrecondition.new(nil,negated_conditions,nil,inverted_conjunction_code, true)
        end
        
      end
      joined
    end
    
    def self.convert_logical_conjunction(code)
      case code
        when 'OR'
          HQMF::Precondition::AT_LEAST_ONE_TRUE
        when 'AND'
          HQMF::Precondition::ALL_TRUE
        else
          raise "unsupported logical conjunction code conversion: #{code}"
      end
      
    end
    
   
  end  
end
