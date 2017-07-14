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
      # Pulling these 5 variables out via destructuring
      @source_data_criteria,
        @source_data_criteria_root,
        @source_data_criteria_extension,
        @specific_occurrence,
        @specific_occurrence_const = obtain_specific_and_source.extract_specific_occurrences_and_source_data_criteria
      extract_definition_from_template_or_type
      post_processing
    end
  end
end
