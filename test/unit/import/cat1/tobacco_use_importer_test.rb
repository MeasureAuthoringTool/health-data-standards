require 'test_helper'

class TobaccoUseImporterTest < MiniTest::Unit::TestCase
  def test_tobacco_use
   	doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/tobacco_use_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    tbac_use = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::TobaccoUseImporter.new, '2.16.840.1.113883.3.560.1.1001', 'completed')
    tobacco_use_entries = tbac_use.package_entries(doc, nrh)
    tobacco_use = tobacco_use_entries[0]
    assert tobacco_use.codes['SNOMED-CT'].include?('87739003')
    assert tobacco_use.oid
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20050520110512')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20050520165047')
    assert_equal expected_start, tobacco_use.start_time
    assert_equal expected_end, tobacco_use.end_time
  end
end