module HQMF2CQL
  # Represents a data criteria specification
  class DataCriteria < HQMF2::DataCriteria
    include HQMF2CQL::DataCriteriaPostProcessing, HQMF2CQL::DataCriteriaTypeAndDefinitionExtraction

    # Create a new instance based on the supplied HQMF entry
    # @param [Nokogiri::XML::Element] entry the parsed HQMF entry
    def initialize(entry, data_criteria_references = {}, occurrences_map = {})
      @entry = entry
      @data_criteria_references = data_criteria_references
      @occurrences_map = occurrences_map
      basic_setup
      @variable = HQMF2::DataCriteriaMethods.extract_variable(@local_variable_name, @id)
      @field_values = HQMF2::DataCriteriaMethods.extract_field_values(@entry, @negation)
      @description = extract_description
      obtain_specific_and_source = HQMF2::SpecificOccurrenceAndSource.new(@entry, @id, @local_variable_name,
                                                                          @data_criteria_references, @occurrences_map)
      # Pulling these 5 variables out via destructing
      @source_data_criteria,
        @source_data_criteria_root,
        @source_data_criteria_extension,
        @specific_occurrence,
        @specific_occurrence_const = obtain_specific_and_source.extract_specific_occurrences_and_source_data_criteria
      extract_definition_from_template_or_type
      post_processing
    end

    def clone
      other = HQMF2CQL::DataCriteria.new(@entry, @data_criteria_references, @occurrences_map)
      other.instance_variable_set(:@id, @id)
      other.instance_variable_set(:@original_id, @original_id)
      other.instance_variable_set(:@property, @property)
      other.instance_variable_set(:@type, @type)
      other.instance_variable_set(:@status, @status)
      other.instance_variable_set(:@code_list_id, @code_list_id)
      other.instance_variable_set(:@value, @value)
      other.instance_variable_set(:@effective_time, @effective_time)
      other.instance_variable_set(:@section, @section)
      other.instance_variable_set(:@temporal_references, @temporal_references)
      other.instance_variable_set(:@subset_operators, @subset_operators)
      other.instance_variable_set(:@children_criteria, @children_criteria)
      other.instance_variable_set(:@derivation_operator, @derivation_operator)
      other.instance_variable_set(:@negation, @negation)
      other.instance_variable_set(:@negation_code_list_id, @negation_code_list_id)
      other.instance_variable_set(:@description, @description)
      other.instance_variable_set(:@field_values, @field_values)
      other.instance_variable_set(:@source_data_criteria, @source_data_criteria)
      other.instance_variable_set(:@specific_occurrence_const, @specific_occurrence_const)
      other.instance_variable_set(:@specific_occurrence, @specific_occurrence)
      other.instance_variable_set(:@comments, @comments)
      other.instance_variable_set(:@is_derived_specific_occurrence_variable, @is_derived_specific_occurrence_variable)
      other.instance_variable_set(:@entry, @entry)
      other.instance_variable_set(:@definition, @definition)
      other.instance_variable_set(:@variable, @variable)
      other.instance_variable_set(:@local_variable_name, @local_variable_name)
      other
    end
  end
end
