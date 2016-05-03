require 'test_helper'

class EncounterTransferImporterTest < Minitest::Test
  def test_encounter_transfer_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/encounter_performed_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    enc = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::CDA::EncounterImporter.new(HealthDataStandards::Import::CDA::EntryFinder.new("//cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']")), '2.16.840.1.113883.3.560.1.79', 'performed')
    encounters = enc.package_entries(cat1_patient_data_section(doc), nrh)
    encounter = encounters[0]
    from_time = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20120214')
    to_time = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20120214')
    assert encounter.transferFrom['code'].include?("1024-9")
    assert encounter.transferTo['code'].include?("1194-0")
    assert_equal encounter.transferFrom.time, from_time
    assert_equal encounter.transferTo.time, to_time
  end
end