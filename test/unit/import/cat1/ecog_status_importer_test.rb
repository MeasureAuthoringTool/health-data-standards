require 'test_helper'

class EcogStatusImporterTest < MiniTest::Unit::TestCase
  def test_ecog_status_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/ecog_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    ecog = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::EcogStatusImporter.new, '2.16.840.1.113883.3.560.1.1001')
    ecog_statuses = ecog.package_entries(doc, nrh)
    ecog_status = ecog_statuses[0]
    assert ecog_status.codes['SNOMED-CT'].include?('423237006')
    expected_timestamp = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20120619085355')
    assert_equal expected_timestamp, ecog_status.time
  end
end