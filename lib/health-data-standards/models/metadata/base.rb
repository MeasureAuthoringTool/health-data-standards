# Represents the metadata associated with a hData section
module Metadata
  NS = 'http://www.hl7.org/schemas/hdata/2009/11/metadata'
  NS_DECL = :ns_decl
  BUILDER = :builder

  def self.get_builder(options)
    xml = options[::Metadata::BUILDER] || ::Nokogiri::XML::Builder.new
    passed_options = Hash.new.merge(options)
    passed_options[::Metadata::BUILDER] = xml
    passed_options[::Metadata::NS_DECL] = options[:ns_decl] || 'hmd'
    passed_options
  end

  class Base
    include Mongoid::Document

    # Should this be embedded in entry or pointed at by entry?

    field :confidentiality, type: String
    field :access_control, type: String
    field :consent, type: String

    embeds_one  :pedigree, class_name: "Metadata::Pedigree"
    embeds_many :record_dates, class_name: "Metadata::RecordDate"
    embeds_many :linked_infos, class_name: "Metadata::LinkedInfo"

    def addRecordDate(time = Time.now, type = ::Metadata::RecordDate::MODIFIED, author = nil, organization = nil)
      if type == ::Metadata::RecordDate::CREATED
        self[:record_dates].each do |rd|
          throw Exception.new("Can't have two created record dates on one metadata record") if rd.operation == ::Metadata::RecordDate::CREATED
        end
      end
      rd = RecordDate.new
      rd.set(time, type, author, organization)
      self[:record_dates] << rd
      if author || organization
        self[:pedigree] = Pedigree.new
        self[:pedigree][:author] = author if author
        self[:pedigree][:organization] = organization if organization
      end
    end

    #####################
    # Output as XML
    #
    # Note that you must really pass in a builder and have declared the namespace on
    # a parent element for this to work properly.
    def to_xml(options = {})
      require 'builder'
      record = options[:record]
      throw Exception.new("No record specified, a required option for Metadata") unless record
      passed_options = ::Metadata::get_builder(options)
      xml = passed_options[::Metadata::BUILDER]
      hmd = passed_options[::Metadata::NS_DECL]
      @created_root = xml.doc.root.nil?
      if @created_root
        xml.root("xmlns:#{hmd}" => NS) do |xml|
          to_xml_details(xml,hmd,record,passed_options)
        end
        xml.doc.root = xml.doc.root.child
        xml.doc.root.set_attribute("xmlns:#{hmd}", NS)
        xml.to_xml
      else
        if xml.doc.collect_namespaces()[hmd].nil?
          xml.doc.namespaces()[hmd] = NS
        end
        to_xml_details(xml,hmd,record,passed_options).to_xml
      end
    end

    #####################
    ## Input from XML
    ##
    ## @param xml The root node containing the information for this data element or a string to be parsed
    ## that should evaluate to a node containing the information for this data element
    def from_xml(xml)
      if xml.kind_of?(String)
        doc = Nokogiri::XML::Document.parse(xml)
        xml = doc.root
      end
      # Get namespace information
      ns = xml.namespace()
      hmd = ns.prefix();
      record_date(xml,hmd,"./#{hmd}:RecordDate/#{hmd}:CreatedDateTime")
      record_date(xml,hmd,"./#{hmd}:RecordDate/#{hmd}:Modified")
      record_date(xml,hmd,"./#{hmd}:RecordDate/#{hmd}:Copied")
      lis = xml.at_xpath("./#{hmd}:LinkedInfo")
      if lis.kind_of?(Nokogiri::XML::Node)
        li = LinkedInfo.new
        li.from_xml(lis,ns_prefix: hmd)
        linked_infos << li
      else
        lis.each do |node|
          li = LinkedInfo.new
          li.from_xml(node,ns_prefix: hmd)
          linked_infos << li
        end if lis
      end
      pi = xml.at_xpath("./#{hmd}:PedigreeInfo")
      if pi
        self.pedigree = Pedigree.new
        self.pedigree.from_xml(pi,ns_prefix: hmd) if pi
      end
    end



    private

    # Extract and handle record dates at path
    def record_date(xml,hmd,xpath)
      rd = RecordDate.new
      node_or_node_set = xml.at_xpath(xpath, hmd)
      if node_or_node_set.kind_of?(Nokogiri::XML::Node)
        rd.from_xml(node_or_node_set,ns_prefix: hmd)
        record_dates << rd
      else
        node_or_node_set.each do |node|
          rd.from_xml(node,ns_prefix: hmd)
          record_dates << rd
        end if node_or_node_set
      end
    end

    # Do actual details of structure
    def to_xml_details(xml,hmd,record,passed_options)
      xml[hmd].DocumentMetaData("xmlns:#{hmd}" => NS) do
        xml[hmd].DocumentId record.medical_record_number
        self.pedigree.to_xml(passed_options) if pedigree
        xml[hmd].RecordDate do
          record_dates.each do |date|
            date.to_xml(passed_options)
          end
        end
        linked_infos.each do |info|
          info.to_xml(passed_options)
        end
        xml[hmd].Confidentiality if @confidentiality
        xml[hmd].AccessControl if @access_control
        xml[hmd].Consent if @consent
      end
      node = xml.doc.root
      to_handle_extra(node, "*/#{hmd}:Confidentiality") if @confidentiality
      to_handle_extra(node, "*/#{hmd}:AccessControl") if @access_control
      to_handle_extra(node, "*/#{hmd}:Consent") if @consent
      xml
    end

    # Work on child node found in xpath expression
    def to_handle_extra(node, xpath)
      child = node.at_xpath(xpath)
      child.parse(confidentiality).each { |n| child.add_child(n) } unless child.nil?
    end
  end
end