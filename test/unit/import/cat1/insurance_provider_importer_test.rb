require 'test_helper'

class InsuranceProviderImporterTest < MiniTest::Unit::TestCase
  
  def test_insurance_providers
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/insurance_provider_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    ipi = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::InsuranceProviderImporter.new, '2.16.840.1.113883.3.560.1.69', 'active')
    insurance_providers = ipi.package_entries(doc, nrh)
    assert_equal 1, insurance_providers.size
    assert_equal({ 'SOP' => ['349'] }, insurance_providers.first.codes)
  end
end