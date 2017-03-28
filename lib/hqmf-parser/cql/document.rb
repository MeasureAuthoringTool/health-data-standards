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
    end

    # Generates this classes hqmf-model equivalent.
    def to_model
      dcs = all_data_criteria.collect(&:to_model)
      sdc = source_data_criteria.collect(&:to_model)
      pcs = all_population_criteria.collect(&:to_model)
      HQMF::Document.new(@id, @id, @hqmf_set_id, @hqmf_version_number, @cms_id,
                         title, description, pcs, dcs, sdc,
                         @attributes, @measure_period, @populations,
                         populations_cql_map=@populations_cql_map, observations=@observations)
    end

    # Extracts data criteria from the HQMF document.
    def extract_criteria
      # Grab each data criteria entry from the HQMF
      extracted_data_criteria = []
      @doc.xpath('cda:QualityMeasureDocument/cda:component/cda:dataCriteriaSection/cda:entry', NAMESPACES).each do |entry|
        extracted_data_criteria << entry
        dc = HQMF2::DataCriteria.new(entry) # Create new data criteria
        sdc = dc.clone # Clone data criteria
        sdc.id += '_source' # Make it a source

        @data_criteria << dc
        @source_data_criteria << sdc
      end
    end

  end
end
