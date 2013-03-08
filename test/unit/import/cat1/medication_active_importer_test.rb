require 'test_helper'

class MedicationActiveImporterTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Import

  def test_medication_active
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/medication_active_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    packager = Cat1::EntryPackage.new(Cat1::MedicationActiveImporter.new(CDA::EntryFinder.new("//cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.41']")), '2.16.840.1.113883.3.560.1.13', 'active')
    medication = packager.package_entries(doc, nrh).first
    
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890509170647')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890509173724')
    assert medication.codes['RxNorm'].include?('866439')
    assert_equal expected_start, medication.start_time
    assert_equal expected_end, medication.end_time
    assert_equal 1, medication.cumulative_medication_duration['scalar']
  end
end