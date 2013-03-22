require 'test_helper'

class Cat1RoundtripTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  # This test class compares a record in Mongoid to itself after being exported
  # and imported.

  def test_round_trip
    # Export
    @mary = Record.where({first: "Mary"}).first
    @patient = @mary
    @start_date = Time.now.years_ago(1)
    @end_date = Time.now
    @measures = MEASURES
    @qrda_xml = HealthDataStandards::Export::Cat1.new.export(@patient, @measures, @start_date, @end_date)
    @doc = Nokogiri::XML(@qrda_xml)
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    File.open('mary.xml', 'w') { |file| file.write(@doc) }

    # Import
    doc = Nokogiri::XML(File.new('mary.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    doc.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    @patient_import = Record.new
    HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(@patient_import, doc)
    encounter = @patient_import.encounters.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20120430120000')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20120430130000')
    assert encounter.codes['CPT'].include?('99201')
    assert_equal expected_start, encounter.start_time
    assert_equal expected_end, encounter.end_time

    #Compare Encounters
    assert_equal @patient.encounters, @patient_import.encounters

  end

end