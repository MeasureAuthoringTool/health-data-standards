module HQMF
  # Class for converting an HQMF 1.0 representation to an HQMF 2.0 representation
  class DocumentConverter
   
    BIRTHTIME_CODE_LIST = {'LOINC'=>['21112-8']}
    
    def self.convert(json, codes)
      
      title = json[:title]
      description = json[:description]
      
      metadata = json[:metadata]
      metadata.keys.each {|key| metadata[key.to_s] = metadata[key]; metadata.delete(key.to_sym)}
      
      id = metadata["NQF_ID_NUMBER"][:value] if metadata["NQF_ID_NUMBER"]
      emeasure_id = metadata['EMEASURE_IDENTIFIER'][:value] if metadata['EMEASURE_IDENTIFIER']
      attributes = parse_attributes(metadata)
      hqmf_id = json[:hqmf_id]
      hqmf_set_id = json[:hqmf_set_id]
      hqmf_version_number = json[:hqmf_version_number]
      cms_id = "CMS#{emeasure_id}v#{hqmf_version_number}"
      
      measure_period = parse_measure_period(json)
      @data_criteria_converter = DataCriteriaConverter.new(json, measure_period)
      
      # source data criteria are the original unmodified v2 data criteria
      source_data_criteria = []
      @data_criteria_converter.v2_data_criteria.each {|criteria| source_data_criteria << criteria}
      
      # PASS 1
      @population_criteria_converter = PopulationCriteriaConverter.new(json, @data_criteria_converter)
      population_criteria = @population_criteria_converter.population_criteria
      
      # PASS 2
      comparison_converter = HQMF::ComparisonConverter.new(@data_criteria_converter)
      comparison_converter.convert_comparisons(population_criteria)

      # PASS 3
      # specific_occurrence_converter = HQMF::SpecificOccurrenceConverter.new(@data_criteria_converter)
      # specific_occurrence_converter.convert_specific_occurrences(population_criteria)

      data_criteria = @data_criteria_converter.final_v2_data_criteria
      
      populations = @population_criteria_converter.sub_measures
      
      doc = HQMF::Document.new(id, hqmf_id, hqmf_set_id, hqmf_version_number, cms_id, title, description, population_criteria, data_criteria, source_data_criteria, attributes, measure_period, populations)
       
      backfill_patient_characteristics_with_codes(doc, codes)
      
      HQMF::DocumentConverter.validate(doc, codes)
      
      doc
      
    end
   
    private
    
    def self.parse_attributes(metadata)
      attributes = []
      metadata.keys.each do |key|
        attribute_hash = metadata[key]
        code = attribute_hash[:code]
        value = attribute_hash[:value]
        unit = attribute_hash[:unit]
        name = attribute_hash[:name]
        attributes << HQMF::Attribute.new(key,code,value,unit,name)
      end
      attributes
    end
    

    # patient characteristics data criteria such as GENDER require looking at the codes to determine if the 
    # measure is interested in Males or Females.  This process is awkward, and thus is done as a separate
    # step after the document has been converted.
    def self.backfill_patient_characteristics_with_codes(doc, codes)
      
      [].concat(doc.all_data_criteria).concat(doc.source_data_criteria).each do |data_criteria|
        if (data_criteria.type == :characteristic and !data_criteria.property.nil?)
          if (codes)
            value_set = codes[data_criteria.code_list_id]
            puts "\tno value set for unknown patient characteristic: #{data_criteria.id}" unless value_set
          else
            puts "\tno code set to back fill: #{data_criteria.title}"
            next
          end
          
          if (data_criteria.property == :gender)
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
    

    def self.parse_measure_period(json)
      
      # Create a new HQMF::EffectiveTime
      # @param [Value] low
      # @param [Value] high
      # @param [Value] width
      # ----------
      # Create a new HQMF::Value
      # @param [String] type
      # @param [String] unit
      # @param [String] value
      # @param [String] inclusive
      # @param [String] derived
      # @param [String] expression
      
      low = HQMF::Value.new('TS',nil, '201201010000',nil, nil, nil)
      high = HQMF::Value.new('TS',nil,'201212312359',nil, nil, nil)
      width = HQMF::Value.new('PQ','a','1',nil, nil, nil)
      
#      puts ('need to figure out a way to make dates dynamic')
      
      HQMF::EffectiveTime.new(low,high,width)
    end
    
    def self.validate(document,codes)
      puts "\t(#{document.id})document is nil!!!!!!!!!!!" unless document
      puts "\t(#{document.id})codes are nil!!!!!!!!!!!" unless codes
      return unless document and codes
      
      referenced_oids = document.all_data_criteria.map(&:code_list_id).compact.uniq
      
      referenced_oids.each do |oid|
        value_set = codes[oid]
        puts "\tDC (#{document.id},#{document.title}): referenced OID could not be found #{oid}" unless value_set
      end
      
      oid_values = document.all_data_criteria.select {|dc| dc.value != nil and dc.value.type == 'CD'}
      
      if oid_values.size > 0
        referenced_oids = (oid_values.map {|dc| dc.value.code_list_id }).compact.uniq
        referenced_oids.each do |oid|
          value_set = codes[oid]
          puts "\tVALUE (#{document.id},#{document.title}): referenced OID could not be found #{oid}" unless value_set
        end
      end
      
      
      oid_negation = document.all_data_criteria.select {|dc| dc.negation_code_list_id != nil}
      if oid_negation.size > 0
        referenced_oids = (oid_negation.map {|dc| dc.negation_code_list_id}).compact.uniq
        referenced_oids.each do |oid|
          value_set = codes[oid]
          puts "\tNEGATION (#{document.id},#{document.title}): referenced OID could not be found #{oid}" unless value_set
        end
      end
        
      oid_fields = document.all_data_criteria.select {|dc| dc.field_values != nil}
      if oid_fields.size > 0
        referenced_oids = (oid_fields.map{|dc| dc.field_values.map {|key,field| puts "field: #{key} is nil" unless field || key.match(/DATETIME/); field.code_list_id if field != nil and field.type == 'CD'}}).flatten.compact.uniq
        referenced_oids.each do |oid|
          value_set = codes[oid]
          puts "\tFIELDS (#{document.id},#{document.title}): referenced OID could not be found #{oid}" unless value_set
        end
      end
      
    end

   
  end  
end
