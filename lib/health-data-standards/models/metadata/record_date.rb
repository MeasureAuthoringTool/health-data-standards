module Metadata
  class RecordDate
    include Mongoid::Document

    CREATED = 'CREATED'
    MODIFIED = 'MODIFIED'
    COPIED = 'COPIED'

    field :operation, type: String
    field :operation_time, type: Time

    embeds_one :pedigree, class_name: "Metadata::Pedigree"

    def set(time = Time.now, type = MODIFIED, who = nil, organization = nil)
      raise Exception.new("time and type are required") if type.nil? || time.nil?
      @operation = type.to_s.upcase

      raise Exception.new("type must be one of CREATED, MODIFIED or COPIED") if operation != CREATED && operation != MODIFIED && operation == COPIED
      @operation_time = time
      @pedigree = Pedigree.new
      @pedigree.author = who if who
      @pedigree.organization = organization if organization
    end

    def to_xml(options)
      require 'builder'
      xml = options[:builder] || ::Nokogiri::XML::Builder.new
      hmd = options[:ns_prefix]
      if operation == CREATED
        xml[hmd].CreatedDateTime operation_time
      elsif operation == MODIFIED
        xml[hmd].Modified do
          xml[hmd].ModifiedDateTime operation_time
          @pedigree.to_xml(options) if pedigree
        end
      elsif operation == COPIED
        xml[hmd].CopiedDateTime operation_time
        @pedigree.to_xml(options) if pedigree
      else
        # ?
      end
    end

    def from_xml(node,options)
      require 'builder'
      hmd = options[:ns_prefix]
      m = node.at_xpath("./#{hmd}:ModifiedDateTime")
      cp = node.at_xpath("./#{hmd}:CopiedDateTime")
      if node.name == 'CreatedDateTime'
        @operation = CREATED
        @operation_time = node.text()
      elsif ! m.nil?
        @operation = MODIFIED
        @operation_time = m.text()
      else
        @operation = COPIED
        @operation_time = cp.text()
      end
      ped = node.at_xpath("./#{hmd}:PedigreeInfo")
      unless ped.nil?
        @pedigree = Pedigree.new
        @pedigree.from_xml(ped,options)
      end
    end
  end
end