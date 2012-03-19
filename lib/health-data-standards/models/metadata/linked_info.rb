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
        xml[hmd].Target(self.href, extension: self.extension)
      end
    end

    def from_xml(node, options)
      require 'builder'
      hmd = options[:ns_prefix]
      target = node.at_xpath("./#{hmd}:Target")
      if target
        self.href = target.text()
        self.extension = target.attr(:extension)
      end
    end
  end
end