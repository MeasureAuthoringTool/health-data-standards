require 'test_helper'

class InsuranceProviderImporterTest < Minitest::Test
  
  def test_insurance_providers
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/insurance_provider_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    ipi = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::InsuranceProviderImporter.new, '2.16.840.1.113883.3.560.1.69', 'active')
    insurance_providers = ipi.package_entries(cat1_patient_data_section(doc), nrh)
    assert_equal 1, insurance_providers.size
    ip = insurance_providers.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20050329')
    assert_equal expected_start, ip.start_time
    assert_equal({ 'SOP' => ['349'] }, ip.codes)
  end
end