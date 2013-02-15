require 'test_helper'

class EncounterOrderImporterTest < MiniTest::Unit::TestCase
  def test_encounter_order_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/encounter_order_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    enc = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::EncounterOrderImporter.new, '2.16.840.1.113883.3.560.1.83', 'ordered')
    encounters = enc.package_entries(doc, nrh)
    encounter = encounters[0]
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20051226144034')
    assert encounter.codes['SNOMED-CT'].include?("76168009")
    assert_equal expected_start, encounter.start_time
  end
end