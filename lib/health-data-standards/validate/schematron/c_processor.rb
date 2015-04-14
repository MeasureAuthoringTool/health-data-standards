module HealthDataStandards
  module Validate
    module Schematron
      module CProcessor


        def get_errors(document)
          document = get_document(document)
          processor.transform(document)
        end

        def processor
          return @processor if @processor
          doc = Nokogiri::XML(File.open(@schematron_file))
          doc.root["defaultPhase"] = ("errors")

          xslt = Nokogiri::XSLT(File.open(ISO_SCHEMATRON))

          result = xslt.transform(doc)
          #this is stupid but needs to be done to assocaite the xslt file with a dirctory
          result = Nokogiri::XML(result.to_s,@schematron_file)
          @processor = Nokogiri::XSLT::Stylesheet.parse_stylesheet_doc(result)
        end

      end
    end
  end
end