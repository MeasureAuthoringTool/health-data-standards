require 'test_helper'

class DiagnosticStudyOrderImporterTest < MiniTest::Unit::TestCase
  def test_encounter_order_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/diagnostic_study_order_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    ord = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::DiagnosticStudyOrderImporter.new, '2.16.840.1.113883.3.560.1.40', 'ordered')
    orders = ord.package_entries(doc, nrh)
    order = orders[0]
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19891215072420')
    assert order.codes['LOINC'].include?("69399-4")
    assert_equal expected_start, order.start_time
  end
end