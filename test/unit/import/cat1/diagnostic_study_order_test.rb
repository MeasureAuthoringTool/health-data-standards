require 'test_helper'

class DiagnosticStudyOrderImporterTest < MiniTest::Unit::TestCase
  def test_encounter_order_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/diagnostic_study_order_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    study_order = HealthDataStandards::Import::Cat1::DiagnosticStudyOrderImporter.new
    entries = study_order.create_entries(doc)
    
    order = entries[0]
    
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19891215072420')
    assert order.codes['LOINC'].include?("69399-4")
    assert_equal expected_start, order.start_time
  end
end