require 'test_helper'

class ExportGeneratorTest < MiniTest::Unit::TestCase
  def setup
    collection_fixtures('records', '_id')
    @record = Record.first
  end

  def test_generating_results_exporter
    exporter = HealthDataStandards::Export::GreenC32::ExportGenerator.create_exporter_for(:result)
    result = @record.results.first
    xml = exporter.export(result)
    
    doc = Nokogiri::XML(xml)
    doc.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
    
    ri = HealthDataStandards::Import::GreenC32::ResultImporter.instance
    
    result2 = ri.import(doc.xpath("/gc32:result"))
    
    assert_equal result.value, result2.value
    assert_equal result.description, result2.description
  end
end