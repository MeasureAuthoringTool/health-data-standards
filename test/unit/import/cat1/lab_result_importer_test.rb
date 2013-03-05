require 'test_helper'

class LabResultImporterTest < MiniTest::Unit::TestCase
  def test_lab_result_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/lab_result_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    lr = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::LabResultImporter.new, '2.16.840.1.113883.3.560.1.12')
    lab_results = lr.package_entries(doc, nrh)
    lab_result = lab_results[0]
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19910519162436')
    assert lab_result.codes['LOINC'].include?('11268-0')
    assert_equal expected_start, lab_result.start_time
  end
end