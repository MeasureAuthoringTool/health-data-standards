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
      {self.const_name => build_hash(self, [:code,:value,:unit,:name,:id])}
    end
    
  end
end