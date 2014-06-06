module HQMF1
  # Represents a HQMF measure attribute
  class Attribute
  
    include HQMF1::Utilities
    
    # Create a new instance based on the supplied HQMF
    # @param [Nokogiri::XML::Element] entry the measure attribute element
    def initialize(entry)
      @entry = entry
    end

    # Get the attribute code
    # @return [String] the code
    def code
      if (@entry.at_xpath('./cda:code/@code'))
        @entry.at_xpath('./cda:code/@code').value
      elsif @entry.at_xpath('./cda:code/@nullFlavor')
        @entry.at_xpath('./cda:code/@nullFlavor').value
      end
    end

    # Get the attribute name
    # @return [String] the name
    def name
      if (@entry.at_xpath('./cda:code/@displayName'))
        @entry.at_xpath('./cda:code/@displayName').value
      elsif @entry.at_xpath('cda:code/cda:originalText')
        @entry.at_xpath('cda:code/cda:originalText').text
      end
    end
    
    # Get the attribute id, used elsewhere in the document to refer to the attribute
    # @return [String] the id
    def id
      attr_val('./cda:id/@root')
    end
    
    # Get the attribute value
    # @return [String] the value
    def value
      val = attr_val('./cda:value/@value')
      val ||= attr_val('./cda:value/@extension')
      if val
        val
      else
        @entry.at_xpath('./cda:value').inner_text
      end
    end
    
    # Get the unit of the attribute value or nil if none is defined
    # @return [String] the unit
    def unit
      attr_val('./cda:value/@unit')
    end
    
    # Get a JS friendly constant name for this measure attribute
    def const_name
      components = name.gsub(/\W/,' ').split.collect {|word| word.strip.upcase }
      components.join '_'
    end
    
    def to_json
      json = {self.const_name => build_hash(self, [:code,:value,:unit,:name,:id])}
      extend_json_for_enhanced_model(json)
    end

    private

    def extend_json_for_enhanced_model(json)
      if (@entry.at_xpath('./cda:id'))
        json[self.const_name][:id_obj] = id_xml_to_json('./cda:id')
      end

      if (@entry.at_xpath('./cda:code'))
        json[self.const_name][:code_obj] = code_xml_to_json('./cda:code')
      end

      if (@entry.at_xpath('./cda:value'))
        value_hash = { :type => attr_val('./cda:value/@xsi:type')}
        case value_hash[:type]
        when 'II'
          value_hash.merge!(id_xml_to_json('./cda:value'))
        when 'CD'
          value_hash.merge!(code_xml_to_json('./cda:value'))
        when 'ED'
          value_hash[:value] = @entry.at_xpath('./cda:value').inner_text
          value_hash[:media_type] = attr_val('./cda:value/@mediaType')
        else
          if (attr_val('./cda:value/@value'))
            value_hash.merge!(HQMF1::Value.new(@entry.at_xpath('./cda:value')).to_json)
            value_hash[:expression] = @entry.at_xpath('./cda:value/cda:expression').try(:inner_text).try(:strip)
          else
            value_hash[:value] = @entry.at_xpath('./cda:value').inner_text.try(:strip)
          end
        end
        json[self.const_name][:value_obj] = value_hash
      end
      json
    end

    def id_xml_to_json(entry_xpath)
      {
        :root => attr_val("#{entry_xpath}/@root"),
        :extension => attr_val("#{entry_xpath}/@extension")
      }
    end

    def code_xml_to_json(entry_xpath)
      {
        :type => attr_val("#{entry_xpath}/@xsi:type") || 'CD',
        :system => attr_val("#{entry_xpath}/@codeSystem"),
        :code => attr_val("#{entry_xpath}/@code"),
        :code_list_id => attr_val("#{entry_xpath}/@valueSet"),
        :title => attr_val("#{entry_xpath}/@displayName"),
        :null_flavor => attr_val("#{entry_xpath}/@nullFlavor"),
        :original_text => @entry.at_xpath("#{entry_xpath}/cda:originalText").try(:inner_text)
      }
    end
  end
end