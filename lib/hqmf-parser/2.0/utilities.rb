module HQMF2
  module Utilities
    
    include HQMF::Conversion::Utilities
    
    # Utility function to handle optional attributes
    # @param xpath an XPath that identifies an XML attribute
    # @return the value of the attribute or nil if the attribute is missing
    def attr_val(xpath)
      Utilities::attr_val(@entry, xpath)
    end
    
    # Utility function to handle optional attributes
    # @param xpath an XPath that identifies an XML attribute
    # @return the value of the attribute or nil if the attribute is missing
    def self.attr_val(node, xpath)
      attr = node.at_xpath(xpath, HQMF2::Document::NAMESPACES)
      if attr
        attr.value
      else
        nil
      end
    end
    
    def to_xml
      @entry.to_xml
    end
    
  end
end  