require 'test_helper'

class TransferToFromImporterTest < Minitest::Test
  def test_transfer_to_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/transfer_to_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    enc = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::TransferToImporter.new, '2.16.840.1.113883.3.560.1.72')
    encounters = enc.package_entries(cat1_patient_data_section(doc), nrh)
    encounter = encounters[0]
    to_time = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('2015042223')
    assert encounter.transferTo['code'].include?("434771000124107")
    assert_equal to_time, encounter.transferTo.start_time
    assert_equal to_time, encounter.transferTo.end_time
  end

  def test_transfer_to_act_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/transfer_to_act_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    enc = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::TransferToActImporter.new, '2.16.840.1.113883.3.560.1.72')
    encounters = enc.package_entries(cat1_patient_data_section(doc), nrh)
    encounter = encounters[0]
    to_time = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('2015042223')
    assert encounter.transferTo['code'].include?("434771000124107")
    assert_equal to_time, encounter.transferTo.start_time
  end

  def test_transfer_from_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/transfer_from_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    enc = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::TransferFromImporter.new, '2.16.840.1.113883.3.560.1.71')
    encounters = enc.package_entries(cat1_patient_data_section(doc), nrh)
    encounter = encounters[0]
    to_time = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20150512054500')
    assert encounter.transferFrom['code'].include?("434771000124107")
    assert_equal to_time, encounter.transferFrom.start_time
    assert_equal to_time, encounter.transferFrom.end_time
  end

  def test_transfer_from_act_importing
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/transfer_from_act_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    nrh = HealthDataStandards::Import::CDA::NarrativeReferenceHandler.new
    nrh.build_id_map(doc)
    enc = HealthDataStandards::Import::Cat1::EntryPackage.new(HealthDataStandards::Import::Cat1::TransferFromActImporter.new, '2.16.840.1.113883.3.560.1.71')
    encounters = enc.package_entries(cat1_patient_data_section(doc), nrh)
    encounter = encounters[0]
    to_time = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20150512054500')
    assert encounter.transferFrom['code'].include?("434771000124107")
    assert_equal to_time, encounter.transferFrom.start_time
  end
end
