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

        def get_errors(document)
          document_j = document.is_a?(File) ? java.io.File.new(document.path) : StringReader.new(document)
          output = build_transformer(StringReader.new(processor), StreamSource.new(document_j))
          Nokogiri::XML(output)
        end

        def processor
          @processor ||= build_transformer(java.io.File.new(ISO_SCHEMATRON2), schematron_file)
        end

        def schematron_file
          dbf = DocumentBuilderFactory.new_instance
          dbf.setIgnoringElementContentWhitespace(true);
          db = dbf.new_document_builder
          document = db.parse(java.io.File.new(@schematron_file))
          
          root = document.document_element
          phase = root.set_attribute("defaultPhase", "errors")

          DOMSource.new(root)
        end

        def build_transformer(xslt, input_file)
          @factory ||= TransformerFactory.newInstance(TRANSFORMER_FACTORY_IMPL, nil)
          transformer = @factory.newTransformer(StreamSource.new(xslt))
          sw = StringWriter.new
          output = StreamResult.new(sw)
          transformer.transform(input_file, output)
          sw.to_s
        end
      end
    end
  end
end