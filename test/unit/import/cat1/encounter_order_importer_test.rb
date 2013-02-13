require 'test_helper'

class EncounterOrderImporterTest < MiniTest::Unit::TestCase
  def test_encounter_order_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/encounter_order_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    enc = HealthDataStandards::Import::Cat1::EntryPackage.new(doc, HealthDataStandards::Import::Cat1::EncounterOrderImporter.new, '2.16.840.1.113883.3.560.1.83', 'ordered').entry
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20051226144034')
    assert enc.codes['SNOMED-CT'].include?("76168009")
    assert_equal expected_start, enc.start_time
  end
end