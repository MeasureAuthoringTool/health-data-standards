require 'test_helper'

class DiagnosisInactiveImporterTest < MiniTest::Unit::TestCase
  def test_diagnosis_active_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/diagnosis_inactive_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    dia = HealthDataStandards::Import::Cat1::DiagnosisInactiveImporter.new
    entries = dia.create_entries(doc)
    
    diagnosis = entries[0]
    
    assert diagnosis.codes['ICD-9-CM'].include?("V02.61")
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20040816121859')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20040816200929')
    assert_equal expected_start, diagnosis.start_time
    assert_equal expected_end, diagnosis.end_time
    assert_equal '73425007', diagnosis.status['SNOMED-CT'] # asserting that the condition is active
  end
end