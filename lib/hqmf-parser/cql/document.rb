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
      pop_helper = HQMF2::DocumentPopulationHelper.new(@entry, @doc, self, @id_generator, @reference_ids)
      @populations, @population_criteria = pop_helper.extract_populations_and_criteria

      # Extract CQL population mappings
      extract_populations_cql_map
    end

    # Generates this classes hqmf-model equivalent.
    def to_model
      dcs = all_data_criteria.collect(&:to_model)
      pcs = all_population_criteria.collect(&:to_model)
      sdc = source_data_criteria.collect(&:to_model)
      HQMF::Document.new(@id, @id, @hqmf_set_id, @hqmf_version_number, @cms_id,
                         title, description, pcs, dcs, sdc,
                         @attributes, @measure_period, @populations,
                         populations_cql_map=@populations_cql_map)
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

    # Extracts the mappings between actual HQMF populations and their
    # corresponding CQL define statements.
    def extract_populations_cql_map
      @populations_cql_map = {}
      @doc.xpath("//cda:populationCriteriaSection/cda:component[@typeCode='COMP']", HQMF2::Document::NAMESPACES).each do |population_def|
        {
          HQMF::PopulationCriteria::IPP => 'initialPopulationCriteria',
          HQMF::PopulationCriteria::DENOM => 'denominatorCriteria',
          HQMF::PopulationCriteria::NUMER => 'numeratorCriteria',
          HQMF::PopulationCriteria::NUMEX => 'numeratorExclusionCriteria',
          HQMF::PopulationCriteria::DENEXCEP => 'denominatorExceptionCriteria',
          HQMF::PopulationCriteria::DENEX => 'denominatorExclusionCriteria',
          HQMF::PopulationCriteria::MSRPOPL => 'measurePopulationCriteria',
          HQMF::PopulationCriteria::MSRPOPLEX => 'measurePopulationExclusionCriteria'
        }.each_pair do |criteria_id, criteria_element_name|
          criteria_def = population_def.at_xpath("cda:#{criteria_element_name}", HQMF2::Document::NAMESPACES)
          if criteria_def
            cql_statement = criteria_def.at_xpath("*/*/cda:id", HQMF2::Document::NAMESPACES).attribute('extension').to_s.match(/"([^"]*)"/)
            if @populations_cql_map[criteria_id].nil?
              @populations_cql_map[criteria_id] = []
            end
            cql_statement = cql_statement.to_s.delete('\\"')
            unless @populations_cql_map[criteria_id].include? cql_statement
              @populations_cql_map[criteria_id].push(cql_statement)
            end
          end
        end
      end
    end
  end
end
