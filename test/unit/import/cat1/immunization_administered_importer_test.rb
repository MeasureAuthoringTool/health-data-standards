require 'test_helper'

class ImmunizationAdministeredImporterTest < Minitest::Test
  include HealthDataStandards::Import

  def test_immunization_administered
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/immunization_administered_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    packager = Cat1::EntryPackage.new(Cat1::ImmunizationAdministeredImporter.new, '2.16.840.1.113883.10.20.28.3.112', 'administered')
    immunization = packager.package_entries(cat1_patient_data_section(doc), nrh).first
    
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890509170647')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890509173724')
    assert immunization.codes['CVX'].include?('33')
    assert_equal expected_start, immunization.start_time
    assert_equal expected_end, immunization.end_time
  end
end