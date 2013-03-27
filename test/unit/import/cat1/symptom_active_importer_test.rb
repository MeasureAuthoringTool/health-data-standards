require 'test_helper'

class SymptomActiveImporterTest < MiniTest::Unit::TestCase
  def test_symptom_active_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/symptom_active_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    symp = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::SymptomActiveImporter.new, '2.16.840.1.113883.3.560.1.69', 'active')
    symptoms = symp.package_entries(doc, nrh)
    symptom_active = symptoms[0]
    assert symptom_active.codes['SNOMED-CT'].include?('95815000')
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19930215222215')
    assert_equal expected_start, symptom_active.start_time
  end
end