module HQMF2CQL
  # Handles generation of populations for the main document
  class DocumentPopulationHelper < HQMF2::DocumentPopulationHelper
    include HQMF2::Utilities

    def extract_populations
      @populations_cql_map = extract_populations_cql_map
      extract_populations_and_criteria
      # Return via destructuring
      [@populations, @population_criteria, @populations_cql_map, @observations]
    end

    # Extracts potential measure observations from the CQL based HQMF.
    # This function needs to return a boolean so that it will continue to work with 
    # HQMF2::DocumentPopulationHelper::extract_populations_and_criteria
    # This function is being overridden because in CQL the observations are no longer data criteria in the HQMF.
    def extract_observations
      @observations = []

      # Look for observations in the measureObservationSection of the CQL based HQMF document, and if they exist extract the name of the CQL statement that calculates the observation. This is the name of the "define function" statement in the CQL.
      # In addition to the function name we also need to retreive the parameter for the function.
      observation_section = @doc.xpath('/cda:QualityMeasureDocument/cda:component/cda:measureObservationSection',
                                       HQMF2::Document::NAMESPACES)
      unless observation_section.empty?
        observation_section.each do |entry|
          # Need to add population criteria for observations
          criteria_id = 'OBSERV'
          criteria = HQMF2::PopulationCriteria.new(entry.xpath('cda:definition'), @document, @id_generator)
          criteria.type = 'OBSERV'
          if @ids_by_hqmf_id["#{criteria.hqmf_id}"]
            criteria.create_human_readable_id(@ids_by_hqmf_id[criteria.hqmf_id])
          else
            criteria.create_human_readable_id(population_id_with_counter(criteria_id))
            @ids_by_hqmf_id["#{criteria.hqmf_id}"] = criteria.id
          end
          @population_criteria << criteria

          # Extract CQL function specific details
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

    # Generate the stratifications of populations, if any exist
    # for CQL, adds 'population_index' and 'stratification_index'
    def handle_stratifications(population_def, number_of_populations, population, id_def, population_index)
      # handle stratifications (EP137, EP155)
      stratifier_criteria_xpath = "cda:component/cda:stratifierCriteria[not(cda:component/cda:measureAttribute/cda:code[@code  = 'SDE'])]/.."
      population_def.xpath(stratifier_criteria_xpath, HQMF2::Document::NAMESPACES)
        .each_with_index do |criteria_def, criteria_def_index|
        # Skip this Stratification if any precondition doesn't contain any preconditions
        next unless HQMF2::PopulationCriteria.new(criteria_def, @document, @id_generator)
                    .preconditions.all? { |prcn| prcn.preconditions.length > 0 }
        index = number_of_populations + ((population_index - 1) * criteria_def.xpath('./*/cda:precondition').length) +
                criteria_def_index
        criteria_id = HQMF::PopulationCriteria::STRAT
        stratified_population = population.dup
        stratified_population['stratification'] = criteria_def.at_xpath('./*/cda:id/@root').try(:value) ||
                                                  "#{criteria_id}-#{criteria_def_index}"
        build_population_criteria(criteria_def, criteria_id, stratified_population)

        stratified_population['id'] = id_def ? "#{id_def.value} - Stratification #{criteria_def_index + 1}" : "Population#{index}"
        title_def = population_def.at_xpath('cda:title/@value', HQMF2::Document::NAMESPACES)
        stratified_population['title'] = title_def ? "#{title_def.value} - Stratification #{criteria_def_index + 1}" : "Population #{index}"
        stratified_population['population_index'] = population_index
        stratified_population['stratification_index'] = criteria_def_index
        @stratifications << stratified_population
      end
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
          HQMF::PopulationCriteria::MSRPOPLEX => 'measurePopulationExclusionCriteria',
          HQMF::PopulationCriteria::STRAT => 'stratifierCriteria'
        }.each_pair do |criteria_id, criteria_element_name|
          criteria_def = population_def.at_xpath("cda:#{criteria_element_name}", HQMF2::Document::NAMESPACES)
          if criteria_def
            # Ignore Supplemental Data Elements
            next if HQMF::PopulationCriteria::STRAT == criteria_id &&
                !criteria_def.xpath("cda:component[@typeCode='COMP']/cda:measureAttribute/cda:code[@code='SDE']").empty?
            cql_statement = criteria_def.at_xpath("*/*/cda:id", HQMF2::Document::NAMESPACES).attribute('extension').to_s.match(/"([^"]*)"/)
            if populations_cql_map[criteria_id].nil?
              populations_cql_map[criteria_id] = []
            end
            cql_statement = cql_statement.to_s.delete('\\"')
            populations_cql_map[criteria_id].push cql_statement
          end
        end
      end
      populations_cql_map
    end

    # Extracts the name of the main cql library from the Population Criteria Section.
    def extract_main_library
      population_criteria_sections = @doc.xpath("//cda:populationCriteriaSection/cda:component[@typeCode='COMP']", HQMF2::Document::NAMESPACES)
      criteria_section = population_criteria_sections.at_xpath("cda:initialPopulationCriteria", HQMF2::Document::NAMESPACES)
      if criteria_section
        # Example: the full name for the population criteria section is "BonnieNesting01.\"Initial Population\""
        # The regex returns everything before the "."  (BonnieNesting01), which is the file name of the cql measure
        cql_main_library_name = criteria_section.at_xpath("*/*/cda:id", HQMF2::Document::NAMESPACES).attribute('extension').to_s.match(/[^.]*/).to_s
      else
        nil
      end
    end

    # Returns the population descriptions and criteria found in this document
    def extract_populations_and_criteria
      has_observation = extract_observations
      document_populations = get_document_populations
      number_of_populations = document_populations.length
      document_populations.each_with_index do |population_def, population_index|
        population = {}
        handle_base_populations(population_def, population)

        id_def = get_id_def(population_def)
        add_id_to_population(population_def, id_def, population, population_index)
        add_title_to_population(population_def, population)
        add_observ_to_population(has_observation, population)

        add_supplemental_data_elements_to_population(population_def, population)

        @populations << population
        handle_stratifications(population_def, number_of_populations, population, id_def, population_index)
      end

      # Push in the stratification populations after the unstratified populations
      @populations.concat(@stratifications)
      [@populations, @population_criteria]
    end

    def add_supplemental_data_elements_to_population(population_def, population)
      begin
        supplemental_data_elements_def = population_def.xpath('cda:component/cql-ext:supplementalDataElement')
      rescue Nokogiri::XML::XPath::SyntaxError
        # Older fixtures without SDEs don't have the cql-ext namespace
        return
      end

      supplemental_data_elements = []
      supplemental_data_elements_def.each do |sde_def|
        cql_definition_name = sde_def.at_xpath('cda:precondition/cda:criteriaReference/cda:id').attribute('extension').to_s.match(/"([^"]*)"/)[1]
        supplemental_data_elements << cql_definition_name
      end
      population['supplemental_data_elements'] = supplemental_data_elements
    end
  end
end
