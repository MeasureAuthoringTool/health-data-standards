module HQMF1
  module Utilities
    
    include HQMF::Conversion::Utilities
    
    # Utility function to handle optional attributes
    # @param xpath an XPath that identifies an XML attribute
    # @return the value of the attribute or nil if the attribute is missing
    def attr_val(xpath)
      attr = @entry.at_xpath(xpath)
      if attr
        attr.value
      else
        nil
      end
    end
    
    def clean_json(json)
      json.reject!{|k,v| v.nil? || (v.respond_to?(:empty?) && v.empty?)}
    end
    
    def clean_json_recursive(json)
      json.each do |k,v|
        if v.is_a? Hash
          clean_json_recursive(v)
          clean_json(v)
        elsif v.is_a? Array
          v.each do |e|
            if e.is_a? Hash
              clean_json_recursive(e)
              clean_json(e)
            end
          end
        end
        
      end
      clean_json(json)
    end
    
  end
end  