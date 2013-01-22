module HQMF
  # Class representing an HQMF document
  class DataCriteriaConverter

    attr_reader :v1_data_criteria_by_id, :v2_data_criteria, :v2_data_criteria_to_delete, :measure_period_criteria, :measure_period_v1_keys, :specific_occurrences

    def initialize(doc, measure_period)
      @doc = doc
      @v1_data_criteria_by_id = {}
      @v2_data_criteria = []
      @v2_data_criteria_to_delete = {}
      @specific_occurrences = {}
      @measure_period = measure_period
      parse()
    end

    def final_v2_data_criteria
      @v2_data_criteria.delete_if {|criteria| @v2_data_criteria_to_delete[criteria.id] }
    end

    # duplicates a data criteria.  This is important because we may be modifying source data criteria like patient characteristic birthdate to add restrictions
    # the restrictions added may be different for the numerator, denominator, different IPP_1, IPP_2, etc.
    def duplicate_data_criteria(data_criteria, parent_id)
      
      if (data_criteria.is_a? HQMF::Converter::SimpleDataCriteria and data_criteria.precondition_id == parent_id)
        new_data_criteria = data_criteria
      else
        new_data_criteria = HQMF::Converter::SimpleDataCriteria.from_data_criteria(data_criteria)
        new_data_criteria.assign_precondition(parent_id)
        @v2_data_criteria << new_data_criteria
        # we want to delete the original for data criteria that have been duplicated
        @v2_data_criteria_to_delete[data_criteria.id] = true if !@v2_data_criteria_to_delete.keys.include? data_criteria.id
      end
      
      new_data_criteria
    end
    
    # make sure that if a data criteria is used as a target, that it is not deleted by someone else.
    # this is required for birthdate in NQF0106
    def validate_not_deleted(target)
      @v2_data_criteria_to_delete[target] = false
    end
    
    # grouping data criteria are used to allow a single reference off of a temporal reference or subset operator
    # grouping data criteria can reference either regular data criteria as children, or other grouping data criteria
    def create_group_data_criteria(preconditions, type, value, parent_id, id, standard_category, qds_data_type)
      extract_group_data_criteria_tree(HQMF::DataCriteria::UNION,preconditions, type, parent_id)
    end
    
    def build_group_data_criteria(children, section, parent_id, derivation_operator)

      criteria_ids = children.map(&:id)
      # make sure nobody else is going to delete the criteria we've grouped
      criteria_ids.each {|target| validate_not_deleted(target)}

      id = "#{parent_id}_#{section}_#{HQMF::Counter.instance.next}"
      title = "#{id}"
      description = ""
      definition = 'derived'
      _display_name,_code_list_id,_status,_value,_field_values,_effective_time,_inline_code_list,_negation_code_list_id, = nil
      _negation = false
      
      group_criteria = HQMF::DataCriteria.new(id, title, _display_name, description, _code_list_id, criteria_ids, derivation_operator, definition, _status,
                                              _value, _field_values, _effective_time, _inline_code_list,_negation,_negation_code_list_id,nil,nil,nil,nil)
      
      @v2_data_criteria << group_criteria
      
      group_criteria
      
    end

    # pull the children data criteria out of a set of preconditions
    def extract_group_data_criteria_tree(conjunction, preconditions, type, parent_id)
      
      children = []
      preconditions.each do |precondition|
        if (precondition.comparison?) 
          if (precondition.reference.id == HQMF::Document::MEASURE_PERIOD_ID)
            children << measure_period_criteria
          else
            children << v2_data_criteria_by_id[precondition.reference.id]
          end
        else
          converted_conjunction = convert_grouping_conjunction(precondition.conjunction_code) 
          children << extract_group_data_criteria_tree(converted_conjunction, precondition.preconditions, type, parent_id)
        end
      end
      
      # if we have just one child element, just return it.  An AND or OR of a single item is not useful.
      if (children.size > 1)
        build_group_data_criteria(children, type, parent_id, conjunction)
      else
        children.first
      end
      
    end
    
    def convert_grouping_conjunction(conjunction)
      case conjunction
      when HQMF::Precondition::AT_LEAST_ONE_TRUE
        HQMF::DataCriteria::UNION
      when HQMF::Precondition::ALL_TRUE
        HQMF::DataCriteria::XPRODUCT
      else
        'unknown'
      end
    end
    
    # pull the children data criteria out of a set of preconditions
    def self.extract_data_criteria(preconditions, data_criteria_converter)
      flattened = []
      preconditions.each do |precondition|
        if (precondition.comparison?) 
          if (precondition.reference.id == HQMF::Document::MEASURE_PERIOD_ID)
            flattened << data_criteria_converter.measure_period_criteria
          else
            flattened << data_criteria_converter.v2_data_criteria_by_id[precondition.reference.id]
          end
        else
          flattened.concat(extract_data_criteria(precondition.preconditions,data_criteria_converter))
        end
      end
      flattened
    end
    
    def v2_data_criteria_by_id
      criteria_by_id = {}
      @v2_data_criteria.each do |criteria|
        criteria_by_id[criteria.id] = criteria
      end
      criteria_by_id
    end
    
    private 

    def parse()
      @doc[:data_criteria].each do |key,criteria|
        parsed_criteria = HQMF::DataCriteriaConverter.convert(key, criteria)
        @v2_data_criteria << parsed_criteria
        @v1_data_criteria_by_id[criteria[:id]] = parsed_criteria
        @specific_occurrences[parsed_criteria.id] = criteria[:derived_from] != nil
      end
      create_measure_period_v1_data_criteria(@doc,@measure_period,@v1_data_criteria_by_id)
    end

    def self.convert(key, criteria)
 
      # @param [String] id
      # @param [String] title
      # @param [String] standard_category
      # @param [String] qds_data_type
      # @param [String] subset_code
      # @param [String] code_list_id
      # @param [String] property
      # @param [String] type
      # @param [String] status
      # @param [boolean] negation
      # @param [String] negation_code_list_id
      # @param [Value|Range|Coded] value
      # @param [Range] effective_time
      # @param [Hash<String,String>] inline_code_list
      
      id = convert_key(key)
      title = criteria[:title]
      title = title.match(/.*:\s+(.+)/)[1]
      description = criteria[:description]
      code_list_id = criteria[:code_list_id]
      definition = criteria[:definition]
      status = criteria[:status]
      negation = criteria[:negation]
      negation_code_list_id = criteria[:negation_code_list_id]
      specific_occurrence = criteria[:specific_occurrence]
      specific_occurrence_const = nil
      
      # specific occurrences do not properly set the description, so we want to add the definition and status
      if (specific_occurrence)
        statusText = ", #{status.titleize}" if status
        description = "#{definition.titleize}#{statusText}: #{description}" 
        specific_occurrence_const = (description.gsub(/\W/,' ').split.collect {|word| word.strip.upcase }).join '_'
      end
      
      value = nil # value is filled out by backfill_patient_characteristics for things like gender and by REFR restrictions
      effective_time = nil # filled out by temporal reference code
      temporal_references = # filled out by operator code
      subset_operators = nil # filled out by operator code
      children_criteria = nil # filled out by operator and temporal reference code
      derivation_operator = nil # filled out by operator and temporal reference code
      negation_code_list_id = nil # filled out by RSON restrictions
      field_values = nil # field values are filled out by SUBJ and REFR restrictions
      inline_code_list = nil # inline code list is only used in HQMF V2, so we can just pass in nil
      display_name=nil
      
      # transfers should be modeled as a field.  The code_list_id of the transfer data criteria is cleared and the oid is added to a transfer field
      # The definition of the data criteria is still transfer, but it is marked as an encounter using the patient api funciton.
      if ['transfer_to', 'transfer_from'].include? definition
        field_values ||= {}
        field_values[definition.upcase] = HQMF::Coded.for_code_list(code_list_id, title)
        code_list_id = nil
      end
      
      HQMF::DataCriteria.new(id, title, display_name, description, code_list_id, children_criteria, derivation_operator, definition, status, 
                             value, field_values, effective_time, inline_code_list, negation, negation_code_list_id, temporal_references, subset_operators,specific_occurrence,specific_occurrence_const)
 
    end
    
    
    # this method creates V1 data criteria for the measurement period.  These data criteria can be
    # referenced properly within the restrictions
    def create_measure_period_v1_data_criteria(doc,measure_period,v1_data_criteria_by_id)

      attributes = doc[:attributes]
      attributes.keys.each {|key| attributes[key.to_s] = attributes[key]}
      
      measure_period_key = attributes['MEASUREMENT_PERIOD'][:id]
      measure_start_key = attributes['MEASUREMENT_START_DATE'][:id]
      measure_end_key = attributes['MEASUREMENT_END_DATE'][:id]
      
      @measure_period_v1_keys = {measure_start: measure_start_key, measure_end: measure_end_key, measure_period: measure_period_key}
      
      type = 'variable'
      code_list_id,negation_code_list_id,property,status,field_values,effective_time,inline_code_list,children_criteria,derivation_operator,temporal_references,subset_operators=nil
      
      #####
      ##
      ######### SET MEASURE PERIOD
      ##
      #####
      
      measure_period_id = HQMF::Document::MEASURE_PERIOD_ID
      value = measure_period
      measure_criteria = HQMF::DataCriteria.new(measure_period_id,measure_period_id,nil,measure_period_id,code_list_id,children_criteria,derivation_operator,measure_period_id,status,
                                                value,field_values,effective_time,inline_code_list, false, nil, temporal_references,subset_operators,nil,nil)
      
      # set the measure period data criteria for all measure period keys
      v1_data_criteria_by_id[measure_period_key] = measure_criteria
      v1_data_criteria_by_id[measure_start_key] = measure_criteria
      v1_data_criteria_by_id[measure_end_key] = measure_criteria
      @measure_period_criteria = measure_criteria
      
    end

    
    def self.title_from_description(title, description)
      title.gsub(/^#{Regexp.escape(description).gsub('\\ ',':?,?\\ ')}:\s*/i,'')
    end

    def self.convert_key(key)
      key.to_s.downcase.gsub('_', ' ').split(' ').map {|w| w.capitalize }.join('')
    end 
    
  end
end
