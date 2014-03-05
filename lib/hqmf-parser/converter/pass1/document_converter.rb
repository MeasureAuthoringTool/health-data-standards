module HQMF
  # Class for converting an HQMF 1.0 representation to an HQMF 2.0 representation
  class DocumentConverter
   
    BIRTHTIME_CODE_LIST = {'LOINC'=>['21112-8']}
    
    def self.convert(json, codes)
      
      title = json[:title]
      description = json[:description]
      
      # TODO: Investigate why we never use json[:attributes]
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
       
      HQMF::DocumentConverter.validate(doc, codes) if codes
      
      doc
      
    end
   
    private

    def self.parse_attributes(metadata)
      attributes = []
      metadata.keys.each do |key|
        attributes << HQMF::Attribute.from_json(metadata[key])
      end
      attributes
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
