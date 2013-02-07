require 'test_helper'

class MedicationDispensedImporterTest < MiniTest::Unit::TestCase
  def test_medication_dispensed_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/medication_dispensed_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    med_disp = HealthDataStandards::Import::Cat1::MedicationDispensedImporter.new
    entries = med_disp.create_entries(doc)

    med = entries[0]
    
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19960119172123')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19960119221325')
    assert med.codes['RxNorm'].include?("977869")
    assert_equal expected_start, med.start_time
    assert_equal expected_end, med.end_time
  end
end