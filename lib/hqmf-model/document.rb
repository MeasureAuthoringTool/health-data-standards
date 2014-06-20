module HQMF
  # Class representing an HQMF document
  class Document
    
    MEASURE_PERIOD_ID = "MeasurePeriod"

    STRATIFIED_POPULATION_TEMPLATE_ID = '2.16.840.1.113883.3.100.1.2'
    STRATIFIED_POPULATION_TEMPLATE_TITLE = 'Stratified'

    include HQMF::Conversion::Utilities

    attr_reader :id, :title, :description, :measure_period, :attributes, :populations, :source_data_criteria, :hqmf_id, :hqmf_set_id, :hqmf_version_number, :cms_id
  
    # Create a new HQMF::Document which can be converted to JavaScript
    # @param [String] id
    # @param [String] hqmf_id
    # @param [String] hqmf_set_id
    # @param [String] hqmf_version_number
    # @param [String] title
    # @param [String] description
    # @param [Array#PopulationCritera] population_criteria 
    # @param [Array#DataCriteria] data_criteria
    # @param [Array#DataCriteria] source_data_criteria
    # @param [Array#Attribute] attributes
    # @param [Array#Hash] populations
    # @param [Range] measure_period
    def initialize(id, hqmf_id, hqmf_set_id, hqmf_version_number, cms_id, title, description, population_criteria, data_criteria, source_data_criteria, attributes, measure_period, populations=nil)
      @id = id
      @hqmf_id = hqmf_id
      @hqmf_set_id = hqmf_set_id
      @hqmf_version_number = hqmf_version_number
      @cms_id = cms_id
      @title = title
      @description = description
      @population_criteria = population_criteria
      @data_criteria = data_criteria
      @source_data_criteria = source_data_criteria
      @attributes = attributes
      @populations = populations || [
        {
          HQMF::PopulationCriteria::IPP => HQMF::PopulationCriteria::IPP,
          HQMF::PopulationCriteria::DENOM => HQMF::PopulationCriteria::DENOM,
          HQMF::PopulationCriteria::NUMER => HQMF::PopulationCriteria::NUMER,
          HQMF::PopulationCriteria::DENEXCEP => HQMF::PopulationCriteria::DENEXCEP,
          HQMF::PopulationCriteria::DENEX => HQMF::PopulationCriteria::DENEX
        }
      ]
      @measure_period = measure_period
    end
    
    # Create a new HQMF::Document from a JSON hash keyed with symbols
    def self.from_json(json)
      id = json["id"]
      hqmf_id = json["hqmf_id"]
      hqmf_set_id = json["hqmf_set_id"]
      hqmf_version_number = json["hqmf_version_number"]
      title = json["title"]
      description = json["description"]
      cms_id = json["cms_id"]
      
      population_criterias = []
      json["population_criteria"].each do |key, population_criteria|
        population_criterias << HQMF::PopulationCriteria.from_json(key.to_s, population_criteria)
      end if json['population_criteria']

      data_criterias = []
      json["data_criteria"].each do |key, data_criteria|
        data_criterias << HQMF::DataCriteria.from_json(key.to_s, data_criteria)
      end

      source_data_criterias = []
      json["source_data_criteria"].each do |key, data_criteria|
        source_data_criterias << HQMF::DataCriteria.from_json(key.to_s, data_criteria)
      end
      
      populations = json["populations"] if json["populations"]

      attributes = json["attributes"].map {|attribute| HQMF::Attribute.from_json(attribute)} if json["attributes"]

      measure_period = HQMF::Range.from_json(json["measure_period"]) if json["measure_period"]
      HQMF::Document.new(id, hqmf_id, hqmf_set_id, hqmf_version_number, cms_id, title, description, population_criterias, data_criterias, source_data_criterias, attributes, measure_period,populations)
    end
    
    def to_json
      json = build_hash(self, [:id, :hqmf_id, :hqmf_set_id, :hqmf_version_number, :title, :description, :cms_id])

      json[:population_criteria] = {}
      @population_criteria.each do |population|
        json[:population_criteria].merge! population.to_json
      end

      json[:data_criteria] = {}
      @data_criteria.each do |data|
        json[:data_criteria].merge! data.to_json
      end

      json[:source_data_criteria] = {}
      @source_data_criteria.each do |data|
        json[:source_data_criteria].merge! data.to_json
      end
      
      x = nil
      json[:attributes] = x if x = json_array(@attributes)
      
      json[:populations] = @populations
      
      json[:measure_period] = @measure_period.to_json

      json
    end
    
    
    # Get all the population criteria defined by the measure
    # @return [Array] an array of HQMF::PopulationCriteria
    def all_population_criteria
      @population_criteria
    end
    
    # Get a specific population criteria by id.
    # @param [String] id the population identifier
    # @return [HQMF::PopulationCriteria] the matching criteria, raises an Exception if not found
    def population_criteria(id)
      find(@population_criteria, :id, id)
    end

    def is_cv?
      find(@population_criteria, :type, HQMF::PopulationCriteria::MSRPOPL)
    end

    def find_population_by_type(type)
      find(@population_criteria, :type, type)
    end
    
    # Get all the data criteria defined by the measure
    # @return [Array] an array of HQMF::DataCriteria describing the data elements used by the measure
    def all_data_criteria
      @data_criteria
    end
    
    def all_code_set_oids
      (@data_criteria.map {|d| d.all_code_set_oids }).flatten.compact.uniq
    end
    
    # Get the source data criteria that are specific occurrences
    # @return [Array] an array of HQMF::DataCriteria describing the data elements used by the measure that are specific occurrences
    def specific_occurrence_source_data_criteria(force_sources=nil)
      return [] if @source_data_criteria.nil?
      matching = @source_data_criteria.select {|dc| !dc.specific_occurrence.nil?}

      if force_sources
        existing = matching.map(&:id)
        matching.concat @source_data_criteria.select {|dc| !existing.include?(dc.id) && force_sources.include?(dc.id)} 
      end

      matching
    end
    

    # @return [Array] an array of HQMF::DataCriteria ids that are actually used in the measure
    def referenced_data_criteria
      data_criteria_ids = []
      @population_criteria.each do |population|
        data_criteria_ids.concat(population.referenced_data_criteria)
      end
      references = []
      data_criteria_ids.each do |id|
        dc = data_criteria(id)
        references << id
        from_dc = dc.referenced_data_criteria(self)
        references.concat(from_dc)
      end
      used_dc = []
      references.uniq.each do |id|
        used_dc << data_criteria(id)
      end
      used_dc
    end

    # Get specific attributes by code.
    # @param [String] code the attribute code
    # @param [String] code_system the attribute code system
    # @return [Array#Attribute] the matching attributes, raises an Exception if not found
    def attributes_for_code(code, code_system)
      @attributes.find_all { |e| e.send(:code) == code && e.send(:code_obj).send(:system) == code_system }
    end
    
    # Get a specific data criteria by id.
    # @param [String] id the data criteria identifier
    # @return [HQMF::DataCriteria] the matching data criteria, raises an Exception if not found
    def data_criteria(id)
      find(@data_criteria, :id, id)
    end
    
    # patient characteristics data criteria such as GENDER require looking at the codes to determine if the 
    # measure is interested in Males or Females.  This process is awkward, and thus is done as a separate
    # step after the document has been converted.
    def backfill_patient_characteristics_with_codes(codes)
      
      [].concat(self.all_data_criteria).concat(self.source_data_criteria).each do |data_criteria|
        if (data_criteria.type == :characteristic and !data_criteria.property.nil?)
          if (codes)
            value_set = codes[data_criteria.code_list_id]
            puts "\tno value set for unknown patient characteristic: #{data_criteria.id}" unless value_set
          else
            puts "\tno code set to back fill: #{data_criteria.title}"
            next
          end
          
          if (data_criteria.property == :gender)
            next if value_set.nil?
            key = value_set.keys[0]
            data_criteria.value = HQMF::Coded.new('CD','Administrative Sex',value_set[key].first)
          else
            data_criteria.inline_code_list = value_set
          end
          
        elsif (data_criteria.type == :characteristic)
          if (codes)
            value_set = codes[data_criteria.code_list_id]
            if (value_set)
              # this is looking for a birthdate characteristic that is set as a generic characteristic but points to a loinc code set
              if (value_set['LOINC'] and value_set['LOINC'].first == '21112-8')
                data_criteria.definition = 'patient_characteristic_birthdate'
              end
              # this is looking for a gender characteristic that is set as a generic characteristic
              gender_key = (value_set.keys.select {|set| set == 'Administrative Sex' || set == 'AdministrativeSex'}).first
              if (gender_key and ['M','F'].include? value_set[gender_key].first)
                data_criteria.definition = 'patient_characteristic_gender'
                data_criteria.value = HQMF::Coded.new('CD','Gender',value_set[gender_key].first)
              end
            end
          end

        end
      end
    end

    private
    
    def find(collection, attribute, value)
      collection.find {|e| e.send(attribute)==value}
    end
  end
end
