module HQMF2
  # Module containing parser helper functions
  module Utilities
    include HQMF::Conversion::Utilities

    # Utility function to handle optional attributes
    # @param xpath an XPath that identifies an XML attribute
    # @return the value of the attribute or nil if the attribute is missing
    def attr_val(xpath)
      Utilities.attr_val(@entry, xpath)
    end

    # Utility function to handle optional attributes
    # @param xpath an XPath that identifies an XML attribute
    # @return the value of the attribute or nil if the attribute is missing
    def self.attr_val(node, xpath)
      attr = node.at_xpath(xpath, HQMF2::Document::NAMESPACES)
      return attr.value if attr
    end

    def to_xml
      @entry.to_xml
    end

    # General helper for stripping '-' and ',' into '_' for processable ids
    def strip_tokens(value)
      return nil if value.nil?
      stripped = value.gsub(/[^0-9a-z]/i, '_')
      # Prefix digits with 'prefix_' to prevent JS syntax errors
      stripped.gsub(/^[0-9]/, "prefix_#{value[0]}")
    end

    # Class that generates incremental ids
    class IdGenerator
      def initialize
        @current_id = 0
      end

      def next_id
        @current_id += 1
        @current_id
      end
    end
  end
end
