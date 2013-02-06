require 'test_helper'

class LabOrderImporterTest < MiniTest::Unit::TestCase
  def test_encounter_order_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/lab_order_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    lab_order = HealthDataStandards::Import::Cat1::LabOrderImporter.new
    entries = lab_order.create_entries(doc)
    
    lab = entries[0]

    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19910519162436')
    assert lab.codes['SNOMED-CT'].include?("8879006")
    assert_equal expected_start, lab.start_time
  end
end