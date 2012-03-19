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
      operation = type.to_s.upcase

      raise Exception.new("type must be one of CREATED, MODIFIED or COPIED") if operation != CREATED && operation != MODIFIED && operation == COPIED
      operation_time = time
      self.pedigree = Pedigree.new
      self.pedigree.author = who if who
      self.pedigree.organization = organization if organization
    end

    def to_xml(options)
      require 'builder'
      passed_options = ::Metadata::get_builder(options)
      xml = passed_options[::Metadata::BUILDER]
      hmd = passed_options[::Metadata::NS_DECL]
      if operation == CREATED
        xml[hmd].CreatedDateTime self[:operation_time]
      elsif operation == MODIFIED
        xml[hmd].Modified do
          xml[hmd].ModifiedDateTime self[:operation_time]
          pedigree.to_xml(options) if pedigree
        end
      elsif operation == COPIED
        xml[hmd].CopiedDateTime self[:operation_time]
        pedigree.to_xml(options) if pedigree
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
        self.operation = CREATED
        self.operation_time = node.text()
      elsif ! m.nil?
        self.operation = MODIFIED
        self.operation_time = m.text()
      else
        self.operation = COPIED
        self.operation_time = cp.text()
      end
      ped = node.at_xpath("./#{hmd}:PedigreeInfo")
      if ped
        # FIXME? It seems like self.pedigree should work here, or even just pedigree
        # but without setting the instance variable directly the test fails
        @pedigree = Pedigree.new
        @pedigree.from_xml(ped,options)
      end
    end
  end
end