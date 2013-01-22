module HQMF1
  # Represents a data criteria specification
  class DataCriteria
  
    include HQMF1::Utilities
    
    attr_accessor :code_list_id, :derived_from, :definition, :status, :negation, :specific_occurrence
  
    # Create a new instance based on the supplied HQMF entry
    # @param [Nokogiri::XML::Element] entry the parsed HQMF entry
    def initialize(entry, occurrence_counters)
      @entry = entry
      
      template_map = HQMF::DataCriteria.get_template_id_map()
      oid_xpath_file = File.expand_path('../data_criteria_oid_xpath.json', __FILE__)
      oid_xpath_map = JSON.parse(File.read(oid_xpath_file))
      template_id = attr_val('cda:act/cda:templateId/@root') || attr_val('cda:observation/cda:templateId/@root')
      
      # check to see if this is a derived data criteria.  These are used for multiple occurrences.
      derived_entry = @entry.at_xpath('./*/cda:sourceOf[@typeCode="DRIV"]')
      if derived_entry
        derived = derived_entry.at_xpath('cda:act/cda:id/@root') || derived_entry.at_xpath('cda:observation/cda:id/@root')
        @derived_from = derived.value
        occurrence_counters[@derived_from] ||= HQMF::InstanceCounter.new
        @occurrence_key = occurrence_counters[@derived_from].next-1
        @specific_occurrence = "#{('A'..'ZZ').to_a[@occurrence_key]}"
      end
      
      template = template_map[template_id]
      if template
        @negation=template["negation"]
        @definition=template["definition"]
        @status=template["status"]
        @key=@definition+(@status.empty? ? '' : "_#{@status}")
      else
        raise "Unknown data criteria template identifier [#{template_id}]"
      end
      
      # Get the code list OID of the criteria, used as an index to the code list database
      @code_list_id = attr_val(oid_xpath_map[@key]['oid_xpath'])
      unless @code_list_id
        puts "\tcode list id not found, getting default" if !@derived_from
        @code_list_id = attr_val('cda:act/cda:sourceOf//cda:code/@code')
      end
      
      puts "\tno oid defined for data criteria: #{@key}" if !@code_list_id and !@derived_from
      
    end
    
    # Get the identifier of the criteria, used elsewhere within the document for referencing
    # @return [String] the identifier of this data criteria
    def id
      attr_val('cda:act/cda:id/@root') || attr_val('cda:observation/cda:id/@root')
    end
    
    # Get the title of the criteria, provides a human readable description
    # @return [String] the title of this data criteria
    def title
      title = description
      title = "Occurrence #{@specific_occurrence}: #{title}" if @derived_from
      title
    end
    
    def description
      if (@entry.at_xpath('.//cda:title'))
        description = @entry.at_xpath('.//cda:title').inner_text
      else
        description = @entry.at_xpath('.//cda:localVariableName').inner_text
      end
      description
    end
    
    # Get a JS friendly constant name for this measure attribute
    def const_name
      components = title.gsub(/\W/,' ').split.collect {|word| word.strip.upcase }
      if @derived_from
        components << HQMF::Counter.instance.next
      end
      components.join '_'
    end
    
    def to_json
      json = build_hash(self, [:id,:title,:code_list_id,:derived_from,:description, :definition, :status, :negation, :specific_occurrence])
      {
        self.const_name => json
      }
    end
    

  end
  
end