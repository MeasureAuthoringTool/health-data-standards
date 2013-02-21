require 'test_helper'

class MedicationDispensedImporterTest < MiniTest::Unit::TestCase
  def test_medication_dispensed_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/medication_dispensed_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    med = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::MedicationDispensedImporter.new, '2.16.840.1.113883.3.560.1.8', 'dispensed')
    medications = med.package_entries(doc, nrh)
    medication = medications[0]
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19960119172123')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19960119221325')
    assert medication.codes['RxNorm'].include?("977869")
    assert_equal expected_start, medication.start_time
    assert_equal expected_end, medication.end_time
  end
end