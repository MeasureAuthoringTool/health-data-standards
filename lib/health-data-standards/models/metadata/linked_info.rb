module Metadata
  class LinkedInfo
    include Mongoid::Document

    field :href, type: String
    field :extension, type: String

    def to_xml(options)
      require 'builder'
      xml = options[:builder] || ::Nokogiri::XML::Builder.new
      hmd = options[:ns_prefix]
      xml[hmd].LinkedInfo do
        xml[hmd].Target(@href, extension: @extension)
      end
    end

    def from_xml(node, options)
      require 'builder'
      hmd = options[:ns_prefix]
      target = node.at_xpath("./#{hmd}:Target")
      if target
        @href = target.text()
        @extension = target.attr(extension)
      end
    end
  end
end