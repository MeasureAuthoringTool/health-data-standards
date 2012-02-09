require 'test_helper'

class ExportGeneratorTest < MiniTest::Unit::TestCase
  def setup
    collection_fixtures('records', '_id')
    @record = Record.first
  end

  def test_generating_results_exporter
    exporter = HealthDataStandards::Export::GreenCda::ExportGenerator.create_exporter_for(:result)
    result = @record.results.first
    xml = exporter.export(result)
    
    doc = Nokogiri::XML(xml)
    doc.root.add_namespace_definition('green', "urn:hl7-org:greencda:c32")
    
    ri = HealthDataStandards::Import::GreenCda::ResultImporter.instance
    
    result2 = ri.import(doc.xpath("/green:result"))
    
    assert_equal result.value, result2.value
    assert_equal result.description, result2.description
  end
end