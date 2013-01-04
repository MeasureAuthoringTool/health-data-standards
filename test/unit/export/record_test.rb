require 'test_helper'
require "fileutils"

module GreenC32
  class RecordTest < MiniTest::Unit::TestCase

    def setup
      
    end
    
    def test_export
      doc = Nokogiri::XML(File.open("test/fixtures/NISTExampleC32.xml"))
      doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      record = HealthDataStandards::Import::C32::PatientImporter.instance.parse_c32(doc)
      HealthDataStandards::Export::GreenC32::Record.new.export(record)
    end
  end
end