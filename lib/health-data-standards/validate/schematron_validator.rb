module HealthDataStandards
  module Validate
    module Schematron
    NAMESPACE = {"svrl" => "http://purl.oclc.org/dsdl/svrl"}
    DIR = File.expand_path("../../../../", __FILE__)
    ISO_SCHEMATRON = File.join(DIR, 'resources/schematron/iso-schematron-xslt1/iso_svrl_for_xslt1.xsl')

      class Validator
        include BaseValidator

        def initialize(name,schematron_file)
          @name = name
          @schematron_file = schematron_file
        end

        def validate(document,data = {})
          document = get_document(document)
          processor = get_schematron_processor(@schematron_file)
          report = processor.transform(document)

          errors = report.root.xpath("//svrl:failed-assert",NAMESPACE).map do |el|
            build_error(el.xpath('svrl:text',NAMESPACE).text, el['location'], data[:file_name])
          end
          errors.uniq{|e| "#{e.location}#{e.message}"}
        end


        # get the validation stylesheet returning either the cached instance or creating a new instance
        def get_schematron_processor(schematron_file)
          doc   = Nokogiri::XML(File.open(@schematron_file))
          doc.root["defaultPhase"] = ("errors")

          xslt  = Nokogiri::XSLT(File.open(ISO_SCHEMATRON))
          result = xslt.transform(doc)
          #this is stupid but needs to be done to assocaite the xslt file with a dirctory
          result = Nokogiri::XML(result.to_s,@schematron_file)
          processor = Nokogiri::XSLT::Stylesheet.parse_stylesheet_doc(result)
        end

      end
    end
  end
end
