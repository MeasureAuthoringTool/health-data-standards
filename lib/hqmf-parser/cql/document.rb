module HQMF2CQL

  # Class representing a HQMF v2 document that uses CQL for measure logic.
  class Document < HQMF2::Document

    # Create a new HQMF2CQL::Document instance by parsing the given HQMF contents.
    def initialize(hqmf_contents, use_default_measure_period = true)
      # Set up basic measure values
      setup_default_values(hqmf_contents, use_default_measure_period)

      # Extract data criteria
      extract_criteria

      # Extract the population criteria and population collections
      pop_helper = HQMF2CQL::DocumentPopulationHelper.new(@entry, @doc, self, @id_generator, @reference_ids)
      # @populations_cql_map and @observations are needed by the frontend
      @populations, @population_criteria, @populations_cql_map, @observations = pop_helper.extract_populations
      @cql_measure_library = pop_helper.extract_main_library
    end

    # Generates this classes hqmf-model equivalent.
    def to_model
      dcs = all_data_criteria.compact.collect(&:to_model)
      sdc = source_data_criteria.compact.collect(&:to_model)
      pcs = all_population_criteria.compact.collect(&:to_model)
      HQMF::Document.new(@id, @id, @hqmf_set_id, @hqmf_version_number, @cms_id,
                         title, description, pcs, dcs, sdc,
                         @attributes, @measure_period, @populations,
                         populations_cql_map=@populations_cql_map, cql_measure_library=@cql_measure_library, observations=@observations)
    end

    # Extracts data criteria from the HQMF document.
    def extract_criteria
      # Grab each data criteria entry from the HQMF
      extracted_data_criteria = []
      @doc.xpath('cda:QualityMeasureDocument/cda:component/cda:dataCriteriaSection/cda:entry', NAMESPACES).each do |entry|
        extracted_data_criteria << entry
        dc = HQMF2CQL::DataCriteria.new(entry) # Create new data criteria
        sdc = dc.clone # Clone data criteria
        sdc.id += '_source' # Make it a source

        @data_criteria << dc
        @source_data_criteria << sdc
      end
      make_positive_entry
    end

    # This method is needed for situations when there is a only
    # a negated version of a data criteria.  Bonnie will only
    # show the affirmative version of data criteria.  This method
    # will create an affirmative version of a data criteria when there
    # is only the negative one in the HQMF.
    def make_positive_entry
      negated_criteria = []
      data_criteria_index_lookup = []
      # Find the criteria that are negated
      # At the same time build a hash of all criteria and their code_list_id, definition, status, and negation status
      @data_criteria.each_with_index do |criterion, source_index|
        negated_criteria << criterion if criterion.negation
        data_criteria_index_lookup << [criterion.code_list_id, criterion.definition, criterion.status, criterion.negation]
      end

      negated_criteria.each do |criterion|
        # Check if there is a criterion with the same OID, definition and status BUT that isn't negated
        unless data_criteria_index_lookup.include?([criterion.code_list_id, criterion.definition, criterion.status, false])
          spoofed_positive_instance = criterion.clone
          spoofed_positive_instance.make_criterion_positive
          @data_criteria << spoofed_positive_instance
          sdc = spoofed_positive_instance.clone
          sdc.id += '_source'
          @source_data_criteria << sdc
        end
      end

    end
  end
end
