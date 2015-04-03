module HealthDataStandards
  module Validate
    class ValuesetValidator
      include BaseValidator

       HL7_QRDA_OIDS = ["2.16.840.1.113883.3.221.5",
	    "2.16.840.1.113883.3.88.12.3221.8.7",
	    "2.16.840.1.113883.3.88.12.3221.8.9",
	    "2.16.840.1.113883.1.11.12839",
	    "2.16.840.1.113883.3.88.12.3221.8.11",
	    "2.16.840.1.113883.3.88.12.3221.6.2",
	    "2.16.840.1.113883.11.20.9.40",
	    "2.16.840.1.113883.11.20.9.23",
	    "2.16.840.1.113883.3.88.12.3221.7.4",
	    "2.16.840.1.113883.11.20.9.18",
	    "2.16.840.1.113883.11.20.9.22",
	    "2.16.840.1.113883.1.11.16866",
	    "2.16.840.1.113883.1.11.20275",
	    "2.16.840.1.113883.11.20.9.34",
	    "2.16.840.1.113883.3.88.12.3221.7.2",
	    "2.16.840.1.113883.3.88.12.80.17",
	    "2.16.840.1.113883.3.88.12.80.22",
	    "2.16.840.1.113883.3.88.12.80.64",
	    "2.16.840.1.113883.3.88.12.3221.6.8",
	    "2.16.840.1.113883.1.11.78",
	    "2.16.840.1.113883.11.20.9.25",
	    "2.16.840.1.113883.11.20.9.39",
	    "2.16.840.1.113883.3.88.12.80.32",
	    "2.16.840.1.113883.11.20.9.21",
	    "2.16.840.1.113883.3.88.12.80.68",
	    "2.16.840.1.113883.1.11.20.12",
	    "2.16.840.1.113883.11.20.9.24",
	    "2.16.840.1.113883.11.20.9.41",
	    "2.16.840.1.113883.1.11.16926",
	    "2.16.840.1.113883.1.11.12212",
	    "2.16.840.1.113883.1.11.19185",
	    "2.16.840.1.113883.1.11.14914",
	    "2.16.840.1.114222.4.11.837",
	    "2.16.840.1.113883.1.11.19563",
	    "2.16.840.1.113883.1.11.11526",
	    "2.16.840.1.113883.11.20.9.20",
	    "2.16.840.1.113883.3.88.12.80.2",
	    "2.16.840.1.113883.3.88.12.80.63",
	    "2.16.840.1.113883.1.11.12249",
	    "2.16.840.1.113883.1.11.1",
	    "2.16.840.1.113883.1.11.12199",
	    "2.16.840.1.113883.11.20.9.33",
	    "2.16.840.1.114222.4.11.1066",
	    "2.16.840.1.113883.1.11.19579"]

      attr_accessor :bundle
      def initialize(bundle)
	@bundle = bundle
      end

      def validate(document,data={})

        doc = (document.kind_of? Nokogiri::XML::Document)? document : Nokogiri::XML(document.to_s)
        doc.root.add_namespace_definition("cda", "urn:hl7-org:v3")
        doc.root.add_namespace_definition("sdtc", "urn:hl7-org:sdtc")
        # get all of the valueset items for the document
        sdtc_values = doc.xpath("//*[@sdtc:valueSet]")

	sdtc_values.inject([]) do |errors, node|
          oid = node.at_xpath("@sdtc:valueSet")
	  unless HL7_QRDA_OIDS.index(oid.to_s)
            code = node.at_xpath("@code")
            code_system = node.at_xpath("@codeSystem")
            null_flavor = node.at_xpath("@nullFlavor")
            vs = bundle.value_sets.where({"oid" => oid}).first

            if vs.nil?
	      errors << build_error("The valueset #{oid} declared in the document cannot be found", node.path, data[:file_name])
            elsif vs.concepts.where({"code" => code, "code_system"=>code_system}).count() == 0
	      if !null_flavor
		errors << build_error("The code #{code} in codeSystem #{code_system} cannot be found in the declared valueset #{oid}",
		  node.path, data[:file_name])
              end
            end
          end
	errors
        end
      end
    end
  end
end