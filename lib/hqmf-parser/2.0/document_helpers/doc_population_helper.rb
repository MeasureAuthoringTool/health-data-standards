module HQMF2
  # Handles generation of populations for the main document
  class DocumentPopulationHelper
    include HQMF2::Utilities

    def initialize(entry, doc, document, id_generator, reference_ids = {})
      @entry = entry
      @doc = doc
      remove_population_preconditions(@doc)
      @document = document
      @id_generator = id_generator
      @reference_ids = reference_ids
      @populations = []
      @population_criteria = []
      @stratifications = []
      @ids_by_hqmf_id = {}
      @population_counters = {}
    end

    # If a precondition references a population, remove it
    def remove_population_preconditions(doc)
      # population sections
      pop_ids = doc.xpath("//cda:populationCriteriaSection/cda:component[@typeCode='COMP']/*/cda:id",
                          HQMF2::Document::NAMESPACES)
      # find the population entries and get their ids
      pop_ids.each do |p_id|
        doc.xpath("//cda:precondition[./cda:criteriaReference/cda:id[@extension='#{p_id['extension']}' and @root='#{p_id['root']}']]",
                  HQMF2::Document::NAMESPACES).remove
      end
    end

    # Returns the population descriptions and criteria found in this document
    def extract_populations_and_criteria
      has_observation = extract_observations
      document_populations = @doc.xpath('cda:QualityMeasureDocument/cda:component/cda:populationCriteriaSection',
                                        HQMF2::Document::NAMESPACES)
      # Sort the populations based on the id/extension, since the populations may be out of order; there doesn't seem to
      # be any other way that order is indicated in the HQMF
      document_populations = document_populations.sort_by do |pop|
        pop.at_xpath('cda:id/@extension', HQMF2::Document::NAMESPACES).try(:value)
      end
      number_of_populations = document_populations.length
      document_populations.each_with_index do |population_def, population_index|
        population = {}
        handle_base_populations(population_def, population)

        id_def = population_def.at_xpath('cda:id/@extension', HQMF2::Document::NAMESPACES)
        population['id'] = id_def ? id_def.value : "Population#{population_index}"
        title_def = population_def.at_xpath('cda:title/@value', HQMF2::Document::NAMESPACES)
        population['title'] = title_def ? title_def.value : "Population #{population_index}"

        population['OBSERV'] = 'OBSERV' if has_observation
        @populations << population

        handle_stratifications(population_def, number_of_populations, population, id_def, population_index)
      end

      # Push in the stratification populations after the unstratified populations
      @populations.concat(@stratifications)
      [@populations, @population_criteria]
    end

    # Extracts the measure observations, will return true if one exists
    def extract_observations
      has_observation = false
      # look for observation data in separate section but create a population for it if it exists
      observation_section = @doc.xpath('/cda:QualityMeasureDocument/cda:component/cda:measureObservationSection',
                                       HQMF2::Document::NAMESPACES)
      unless observation_section.empty?
        observation_section.xpath('cda:definition', HQMF2::Document::NAMESPACES).each do |criteria_def|
          criteria_id = 'OBSERV'
          criteria = PopulationCriteria.new(criteria_def, @document, @id_generator)
          criteria.type = 'OBSERV'
          # This section constructs a human readable id.  The first IPP will be IPP, the second will be IPP_1, etc.
          # This allows the populations to be more readable.  The alternative would be to have the hqmf ids in the
          # populations, which would work, but is difficult to read the populations.
          if @ids_by_hqmf_id["#{criteria.hqmf_id}"]
            criteria.create_human_readable_id(@ids_by_hqmf_id[criteria.hqmf_id])
          else
            criteria.create_human_readable_id(population_id_with_counter(criteria_id))
            @ids_by_hqmf_id["#{criteria.hqmf_id}"] = criteria.id
          end

          @population_criteria << criteria
          has_observation = true
        end
      end
      has_observation
    end

    # Builds populations based an a predfined set of expected populations
    def handle_base_populations(population_def, population)
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
        criteria_def = population_def.at_xpath("cda:component[cda:#{criteria_element_name}]", HQMF2::Document::NAMESPACES)
        if criteria_def
          build_population_criteria(criteria_def, criteria_id, population)
        end
      end
    end

    # Generate the stratifications of populations, if any exist
    def handle_stratifications(population_def, number_of_populations, population, id_def, population_index)
      # handle stratifications (EP137, EP155)
      stratifier_criteria_xpath = "cda:component/cda:stratifierCriteria[not(cda:component/cda:measureAttribute/cda:code[@code  = 'SDE'])]/.."
      population_def.xpath(stratifier_criteria_xpath, HQMF2::Document::NAMESPACES)
        .each_with_index do |criteria_def, criteria_def_index|
        # Skip this Stratification if any precondition doesn't contain any preconditions
        next unless PopulationCriteria.new(criteria_def, @document, @id_generator)
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
        @stratifications << stratified_population
      end
    end

    # Method to generate the criteria defining a population
    def build_population_criteria(criteria_def, criteria_id, population)
      criteria = PopulationCriteria.new(criteria_def, @document, @id_generator)

      # check to see if we have an identical population criteria.
      # this can happen since the hqmf 2.0 will export a DENOM, NUMER, etc for each population, even if identical.
      # if we have identical, just re-use it rather than creating DENOM_1, NUMER_1, etc.
      identical = @population_criteria.select { |pc| pc.to_model.hqmf_id == criteria.to_model.hqmf_id }

      @reference_ids.concat(criteria.to_model.referenced_data_criteria)

      if identical.empty?
        # this section constructs a human readable id.  The first IPP will be IPP, the second will be IPP_1, etc.
        # This allows the populations to be more readable.  The alternative would be to have the hqmf ids in the
        # populations, which would work, but is difficult to read the populations.
        if @ids_by_hqmf_id["#{criteria.hqmf_id}-#{population['stratification']}"]
          criteria.create_human_readable_id(@ids_by_hqmf_id["#{criteria.hqmf_id}-#{population['stratification']}"])
        else
          criteria.create_human_readable_id(population_id_with_counter(criteria_id))
          @ids_by_hqmf_id["#{criteria.hqmf_id}-#{population['stratification']}"] = criteria.id
        end

        @population_criteria << criteria
        population[criteria_id] = criteria.id
      else
        population[criteria_id] = identical.first.id
      end
    end

    # Returns a unique id for a given population (increments the id if already present)
    def population_id_with_counter(criteria_id)
      if @population_counters[criteria_id]
        @population_counters[criteria_id] += 1
        "#{criteria_id}_#{@population_counters[criteria_id]}"
      else
        @population_counters[criteria_id] = 0
        criteria_id
      end
    end
  end
end
