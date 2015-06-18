require 'java'
require_relative '../../../../java/saxon9he.jar'

java_import "java.io.StringReader"
java_import "java.io.StringWriter"

java_import "javax.xml.parsers.DocumentBuilder"
java_import "javax.xml.parsers.DocumentBuilderFactory"

java_import "javax.xml.transform.TransformerFactory"
java_import "javax.xml.transform.Transformer"
java_import "javax.xml.transform.dom.DOMSource"
java_import "javax.xml.transform.stream.StreamSource"
java_import "javax.xml.transform.stream.StreamResult"

java_import "org.w3c.dom.Document"

 
TRANSFORMER_FACTORY_IMPL = "net.sf.saxon.TransformerFactoryImpl"

module HealthDataStandards
  module Validate
    module Schematron
      module JavaProcessor

        ISO_SCHEMATRON2 = File.join(DIR, 'resources/schematron/iso-schematron-xslt2/iso_svrl_for_xslt2.xsl')

        class HdsUrlResolver
          include javax.xml.transform.URIResolver

          def initialize(schematron)
            @file = schematron
          end

          def resolve(href, base)
            path = File.join(File.dirname(@file), href)
            return StreamSource.new(java.io.File.new(path))
          end

        end

        def get_errors(document)
          document_j = get_document_j(document)
          output = build_transformer(StringReader.new(processor), StreamSource.new(document_j), true)
          Nokogiri::XML(output)
        end

        def get_document_j(doc)
          case doc
          when File
            java.io.File.new(doc.path)
          else 
            StringReader.new(doc.to_s)
          end
        end

        def processor
          @processor ||= build_transformer(java.io.File.new(ISO_SCHEMATRON2), schematron_file)
        end

        def schematron_file
          # this allows us to run the validation utility app in jBoss/TorqueBox
          # for some reason it breaks the first time you call DocumentBuilderFactory,
          # so the solution is to catch the error and retry
          # TODO: pull this out when the above is no longer the case.
          begin
            dbf = DocumentBuilderFactory.new_instance
          rescue Exception => ex
            retry
          end
          dbf.setIgnoringElementContentWhitespace(true);
          db = dbf.new_document_builder
          document = db.parse(java.io.File.new(@schematron_file))
          
          root = document.document_element
          phase = root.set_attribute("defaultPhase", "errors")

          DOMSource.new(root)
        end

        def build_transformer(xslt, input_file, url=false)
          factory = TransformerFactory.newInstance(TRANSFORMER_FACTORY_IMPL, nil)
          factory.uri_resolver = HdsUrlResolver.new(@schematron_file) if url
          transformer = factory.new_transformer(StreamSource.new(xslt))
          sw = StringWriter.new
          output = StreamResult.new(sw)
          transformer.transform(input_file, output)
          sw.to_s
        end
      end
    end
  end
end