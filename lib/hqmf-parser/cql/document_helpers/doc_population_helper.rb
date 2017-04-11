module HQMF2CQL
  # Handles generation of populations for the main document
  class DocumentPopulationHelper < HQMF2::DocumentPopulationHelper
    include HQMF2::Utilities

    def extract_populations
      @populations_cql_map = extract_populations_cql_map
      extract_populations_and_criteria
      # Return
      [@populations, @population_criteria, @populations_cql_map, @observations]
    end

    # Extracts potential measure observations from the CQL based HQMF.
    # This function needs to return a boolean so that it will continue to work with 
    #   HQMF2::DocumentPopulationHelper::extract_populations_and_criteria
    # This function is being overridden because in CQL the observations are no longer data criteria in the HQMF.
    def extract_observations
      @observations = []

      # Look for observations in the measureObservationSection of the CQL based HQMF document, and if they exist extract the name of the CQL statement that calculates the observation. This is the name of the "define function" statement in the CQL.
      # In addition to the function name we also need to retreive the parameter for the function.
      observation_section = @doc.xpath('/cda:QualityMeasureDocument/cda:component/cda:measureObservationSection',
                                       HQMF2::Document::NAMESPACES)

      unless observation_section.empty?
        observation_section.each do |entry|
          cql_define_function = {}
          # The at_xpath(...).values returns an array of a single element.
          # The match returns an array and since we don't want the double quotes we take the second element
          cql_define_function[:function_name] = entry.at_xpath("*/cda:measureObservationDefinition/cda:value/cda:expression").values.first.match('\\"([A-Za-z0-9 ]+)\\"')[1]
          cql_define_function[:parameter] = entry.at_xpath("*/cda:measureObservationDefinition/cda:component/cda:criteriaReference/cda:id").attributes['extension'].value.match('\\"([A-Za-z0-9 ]+)\\"')[1]
          @observations << cql_define_function
        end
      end
      !@observations.empty?
    end

    # Extracts the mappings between actual HQMF populations and their
    # corresponding CQL define statements.
    def extract_populations_cql_map
      populations_cql_map = {}
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
            if populations_cql_map[criteria_id].nil?
              populations_cql_map[criteria_id] = []
            end
            cql_statement = cql_statement.to_s.delete('\\"')
            unless populations_cql_map[criteria_id].include? cql_statement
              populations_cql_map[criteria_id].push(cql_statement)
            end
          end
        end
      end
      populations_cql_map
    end
  end
end
