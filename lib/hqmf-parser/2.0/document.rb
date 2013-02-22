module HQMF2
  # Class representing an HQMF document
  class Document

    include HQMF2::Utilities
    NAMESPACES = {'cda' => 'urn:hl7-org:v3', 'xsi' => 'http://www.w3.org/2001/XMLSchema-instance'}

    attr_reader :measure_period, :id, :hqmf_set_id, :hqmf_version_number, :populations, :attributes, :source_data_criteria
      
    # Create a new HQMF2::Document instance by parsing at file at the supplied path
    # @param [String] path the path to the HQMF document
    def initialize(hqmf_contents)
      @doc = @entry = Document.parse(hqmf_contents)
      @id = attr_val('cda:QualityMeasureDocument/cda:id/@extension')
      @hqmf_set_id = attr_val('cda:QualityMeasureDocument/cda:setId/@extension')
      @hqmf_version_number = attr_val('cda:QualityMeasureDocument/cda:versionNumber/@value').to_i
      measure_period_def = @doc.at_xpath('cda:QualityMeasureDocument/cda:controlVariable/cda:measurePeriod/cda:value', NAMESPACES)
      if measure_period_def
        @measure_period = EffectiveTime.new(measure_period_def)
      end
      
      # Extract measure attributes
      @attributes = @doc.xpath('/cda:QualityMeasureDocument/cda:subjectOf/cda:measureAttribute', NAMESPACES).collect do |attribute|
        id = attribute.at_xpath('./cda:id/@extension', NAMESPACES).try(:value)
        code = attribute.at_xpath('./cda:code/@code', NAMESPACES).try(:value)
        name = attribute.at_xpath('./cda:code/cda:displayName/@value', NAMESPACES).try(:value)
        value = attribute.at_xpath('./cda:value/@value', NAMESPACES).try(:value)
        HQMF::Attribute.new(id, code, value, nil, name)
      end
      
      # Extract the data criteria
      @data_criteria = []
      @source_data_criteria = []
      @doc.xpath('cda:QualityMeasureDocument/cda:component/cda:dataCriteriaSection/cda:entry', NAMESPACES).each do |entry|
        criteria = DataCriteria.new(entry)
        if criteria.is_source_data_criteria
          @source_data_criteria << criteria
        else
          @data_criteria << criteria
        end
      end
      
      # Extract the population criteria and population collections
      @populations = []
      @population_criteria = []
      
      population_counters = {}
      ids_by_hqmf_id = {}
      
      @doc.xpath('cda:QualityMeasureDocument/cda:component/cda:populationCriteriaSection', NAMESPACES).each_with_index do |population_def, population_index|
        population = {}

        stratifier_id_def = population_def.at_xpath('cda:templateId/cda:item[@root="'+HQMF::Document::STRATIFIED_POPULATION_TEMPLATE_ID+'"]/@controlInformationRoot', NAMESPACES)
        population['stratification'] = stratifier_id_def.value if stratifier_id_def

        {
          HQMF::PopulationCriteria::IPP => 'patientPopulationCriteria',
          HQMF::PopulationCriteria::DENOM => 'denominatorCriteria',
          HQMF::PopulationCriteria::NUMER => 'numeratorCriteria',
          HQMF::PopulationCriteria::DENEXCEP => 'denominatorExceptionCriteria',
          HQMF::PopulationCriteria::DENEX => 'denominatorExclusionCriteria'
        }.each_pair do |criteria_id, criteria_element_name|
          criteria_def = population_def.at_xpath("cda:component[cda:#{criteria_element_name}]", NAMESPACES)
          
          if criteria_def

            criteria = PopulationCriteria.new(criteria_def, self)
            
            # check to see if we have an identical population criteria.
            # this can happen since the hqmf 2.0 will export a DENOM, NUMER, etc for each population, even if identical.
            # if we have identical, just re-use it rather than creating DENOM_1, NUMER_1, etc.
            identical = @population_criteria.select {|pc| pc.to_model.base_json.to_json == criteria.to_model.base_json.to_json}
            
            if (identical.empty?)
              # this section constructs a human readable id.  The first IPP will be IPP, the second will be IPP_1, etc.  This allows the populations to be
              # more readable.  The alternative would be to have the hqmf ids in the populations, which would work, but is difficult to read the populations.
              if ids_by_hqmf_id["#{criteria.hqmf_id}-#{population['stratification']}"]
                criteria.create_human_readable_id(ids_by_hqmf_id[criteria.hqmf_id])
              else
                if population_counters[criteria_id]
                  population_counters[criteria_id] += 1
                  criteria.create_human_readable_id("#{criteria_id}_#{population_counters[criteria_id]}")
                else
                  population_counters[criteria_id] = 0
                  criteria.create_human_readable_id(criteria_id)
                end
                ids_by_hqmf_id["#{criteria.hqmf_id}-#{population['stratification']}"] = criteria.id
              end
            
            
              @population_criteria << criteria
              population[criteria_id] = criteria.id
            else
              population[criteria_id] = identical.first.id
            end
          end
        end
        id_def = population_def.at_xpath('cda:id/@extension', NAMESPACES)
        population['id'] = id_def ? id_def.value : "Population#{population_index}"
        title_def = population_def.at_xpath('cda:title/@value', NAMESPACES)
        population['title'] = title_def ? title_def.value : "Population #{population_index}"
        @populations << population
      end
    end
    
    # Get the title of the measure
    # @return [String] the title
    def title
      @doc.at_xpath('cda:QualityMeasureDocument/cda:title/@value', NAMESPACES).inner_text
    end
    
    # Get the description of the measure
    # @return [String] the description
    def description
      description = @doc.at_xpath('cda:QualityMeasureDocument/cda:text/@value', NAMESPACES)
      description==nil ? '' : description.inner_text
    end
  
    # Get all the population criteria defined by the measure
    # @return [Array] an array of HQMF2::PopulationCriteria
    def all_population_criteria
      @population_criteria
    end
    
    # Get a specific population criteria by id.
    # @param [String] id the population identifier
    # @return [HQMF2::PopulationCriteria] the matching criteria, raises an Exception if not found
    def population_criteria(id)
      find(@population_criteria, :id, id)
    end
    
    # Get all the data criteria defined by the measure
    # @return [Array] an array of HQMF2::DataCriteria describing the data elements used by the measure
    def all_data_criteria
      @data_criteria
    end
    
    # Get a specific data criteria by id.
    # @param [String] id the data criteria identifier
    # @return [HQMF2::DataCriteria] the matching data criteria, raises an Exception if not found
    def data_criteria(id)
      find(@data_criteria, :id, id)
    end
    
    # Parse an XML document at the supplied path
    # @return [Nokogiri::XML::Document]
    def self.parse(hqmf_contents)
      doc = Nokogiri::XML(hqmf_contents)
      doc
    end
    
    def to_model
      dcs = all_data_criteria.collect {|dc| dc.to_model}
      pcs = all_population_criteria.collect {|pc| pc.to_model}
      sdc = source_data_criteria.collect{|dc| dc.to_model}
      HQMF::Document.new(id, id, hqmf_set_id, hqmf_version_number, nil, title, description, pcs, dcs, sdc, attributes, measure_period.to_model, populations)
    end
    
    private
    
    def find(collection, attribute, value)
      collection.find {|e| e.send(attribute)==value}
    end
  end
end
