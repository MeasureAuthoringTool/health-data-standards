module HQMF1
  # Class representing an HQMF document
  class Document
    
    include HQMF1::Utilities
    
    attr_reader :hqmf_id, :hqmf_set_id, :hqmf_version_number
    
    # Create a new HQMF1::Document instance by parsing the supplied contents
    # @param [String] hqmf_contents the contents of an HQMF v1.0 document
    def initialize(hqmf_contents)
      
      @doc = Document.parse(hqmf_contents)
      occurrence_counters = {}
      @data_criteria = @doc.xpath('//cda:section[cda:code/@code="57025-9"]/cda:entry').collect do |entry|
        DataCriteria.new(entry, occurrence_counters)
      end

      @supplemental= @doc.xpath('//cda:section[cda:code/@code="69670-8"]/cda:entry').collect do |entry|
        DataCriteria.new(entry, occurrence_counters)
      end

      @data_criteria.concat @supplemental
      backfill_derived_code_lists
      
      @attributes = @doc.xpath('//cda:subjectOf/cda:measureAttribute').collect do |attr|
        Attribute.new(attr)
      end
      @population_criteria = @doc.xpath('//cda:section[cda:code/@code="57026-7"]/cda:entry').collect do |attr|
        PopulationCriteria.new(attr, self)
      end
      observations = @doc.xpath('//cda:section[cda:code/@code="57027-5"]/cda:entry').collect do |attr|
        Observation.new(attr, self)
      end
      @population_criteria.concat(observations)

      @stratification = @doc.xpath('//cda:section[cda:code/@code="69669-0"]/cda:entry').collect do |attr|
        PopulationCriteria.new(attr, self)
      end
      
      if (@stratification and !@stratification.empty?)
        initial_populations = @population_criteria.select {|pc| pc.code.starts_with? 'IPP'}
        initial_populations.each do |population|
          
          @stratification.each do |stratification|
            new_population = HQMF1::PopulationCriteria.new(population.entry, population.doc)
            new_population.hqmf_id = new_population.id
            new_population.stratification_id = stratification.id
            new_population.id = "#{new_population.id}_#{stratification.id}"
            ids = stratification.preconditions.map(&:id)
            new_population.preconditions.delete_if {|precondition| ids.include? precondition.id}
            new_population.preconditions.concat(stratification.preconditions)
            new_population.preconditions.rotate!(-1*stratification.preconditions.size)
            @population_criteria << new_population
          end
          
        end
        
      end
      
      @hqmf_set_id = @doc.at_xpath('//cda:setId/@root').value.upcase
      @hqmf_id = @doc.at_xpath('//cda:id/@root').value.upcase
      @hqmf_version_number = @doc.at_xpath('//cda:versionNumber/@value').value.to_i
      
    end
    
    # Get the title of the measure
    # @return [String] the title
    def title
      @doc.at_xpath('cda:QualityMeasureDocument/cda:title').inner_text
    end
    
    # Get the description of the measure
    # @return [String] the description
    def description
      @doc.at_xpath('cda:QualityMeasureDocument/cda:text').inner_text
    end
  
    # Get all the attributes defined by the measure
    # @return [Array] an array of HQMF1::Attribute
    def all_attributes
      @attributes
    end
    
    # Get a specific attribute by id.
    # @param [String] id the attribute identifier
    # @return [HQMF1::Attribute] the matching attribute, raises an Exception if not found
    def attribute(id)
      find(@attributes, :id, id)
    end
    
    # Get a specific attribute by code.
    # @param [String] code the attribute code
    # @return [HQMF1::Attribute] the matching attribute, raises an Exception if not found
    def attribute_for_code(code)
      find(@attributes, :code, code)
    end

    # Get all the population criteria defined by the measure
    # @return [Array] an array of HQMF1::PopulationCriteria
    def all_population_criteria
      @population_criteria
    end
    
    def stratification
      @stratification
    end
    
    # Get a specific population criteria by id.
    # @param [String] id the population identifier
    # @return [HQMF1::PopulationCriteria] the matching criteria, raises an Exception if not found
    def population_criteria(id)
      find(@population_criteria, :id, id)
    end
    
    # Get a specific population criteria by code.
    # @param [String] code the population criteria code
    # @return [HQMF1::PopulationCriteria] the matching criteria, raises an Exception if not found
    def population_criteria_for_code(code)
      find(@population_criteria, :code, code)
    end

    # Get all the data criteria defined by the measure
    # @return [Array] an array of HQMF1::DataCriteria describing the data elements used by the measure
    def all_data_criteria
      @data_criteria
    end
    
    # Get a specific data criteria by id.
    # @param [String] id the data criteria identifier
    # @return [HQMF1::DataCriteria] the matching data criteria, raises an Exception if not found
    def data_criteria(id)
      val = find(@data_criteria, :id, id) || raise("unknown data criteria #{id}")
    end
    
    # Parse an XML document from the supplied contents
    # @return [Nokogiri::XML::Document]
    def self.parse(hqmf_contents)
      doc = Nokogiri::XML(hqmf_contents)
      doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      doc
    end
    
    # if the data criteria is derived from another criteria, then we want to grab the properties from the derived criteria
    # this is typically the case with Occurrence A, Occurrence B type data criteria
    def backfill_derived_code_lists
      data_criteria_by_id = {}
      @data_criteria.each {|criteria| data_criteria_by_id[criteria.id] = criteria}
      @data_criteria.each do |criteria|
        if (criteria.derived_from)
          derived_from = data_criteria_by_id[criteria.derived_from]
          criteria.definition = derived_from.definition
          criteria.status = derived_from.status
          criteria.code_list_id = derived_from.code_list_id
        end
      end
    end

    def to_json
      json = build_hash(self, [:title, :description, :hqmf_id, :hqmf_set_id, :hqmf_version_number])
      
      json[:data_criteria] = {}
      @data_criteria.each do |criteria|
        criteria_json = criteria.to_json
        # check if the key already exists... if it does redefine the key
        if (json[:data_criteria][criteria_json.keys.first])
          criteria_json = {"#{criteria_json.keys.first}_#{HQMF::Counter.instance.next}" => criteria_json.values.first}
        end
        json[:data_criteria].merge! criteria_json
      end
      
      json[:metadata] = {}
      json[:attributes] = {}
      @attributes.each do |attribute|
        if (attribute.id)
          json[:attributes].merge! attribute.to_json
        else
          json[:metadata].merge! attribute.to_json
        end
          
      end

      json[:logic] = {}
      counters = {}
      @population_criteria.each do |population|
        population_json = population.to_json
        key = population_json.keys.first
        if json[:logic][key]
          counters[key] ||= 0
          counters[key] += 1
          population_json["#{key}_#{counters[key]}"] = population_json[key]
          population_json.delete(key)
        end
        json[:logic].merge! population_json
      end
      
      clean_json_recursive(json)
      json
    end
    
    private
    
    def find(collection, attribute, value)
      collection.find {|e| e.send(attribute)==value}
    end
    
  end
end