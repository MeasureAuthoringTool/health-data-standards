require 'test_helper'

class DiagnosisActiveImporterTest < MiniTest::Unit::TestCase
  def test_diagnosis_active_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/diagnosis_active_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    diag = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::DiagnosisActiveImporter.new, '2.16.840.1.113883.3.560.1.2', 'active')
    diagnoses = diag.package_entries(doc, nrh)
    diagnosis = diagnoses[0]
    assert diagnosis.codes['ICD-9-CM'].include?("999.34")
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890903081502')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890904034509')
    assert_equal expected_start, diagnosis.start_time
    assert_equal expected_end, diagnosis.end_time
    assert_equal 'active', diagnosis.status # asserting that the condition is active
  end
end