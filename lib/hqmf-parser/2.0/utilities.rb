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

    # General helper for stripping '-' and ',' into '_' for processable ids
    def strip_tokens(value)
      return nil unless !value.nil?
      value.gsub('-','_').gsub(',','_')
    end

    class IdGenerator
      def initialize()
        @current_id = 0
      end

      def next_id
        @current_id += 1
        @current_id
      end
    end

  end
end
