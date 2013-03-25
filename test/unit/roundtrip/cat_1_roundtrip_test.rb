require 'test_helper'

class Cat1RoundtripTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  # This test class compares a record in Mongoid to itself after being exported
  # and imported.

  def test_round_trip
    # Export
    mary = Record.where({first: "Mary"}).first
    patient = mary
    start_date = Time.now.years_ago(1)
    end_date = Time.now
    measures = MEASURES
    qrda_xml = HealthDataStandards::Export::Cat1.new.export(patient, measures, start_date, end_date)
    doc = Nokogiri::XML(qrda_xml)
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    File.open('mary.xml', 'w') { |file| file.write(doc) }

    # Import 
    doc_import = Nokogiri::XML(File.new('mary.xml'))  
    doc_import.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    doc_import.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    patient_import = Record.new
    HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(patient_import, doc_import)
    encounter = patient.encounters.first
    encounter_import = patient_import.encounters.first

    #Compare Encounter Attributes
    assert_equal encounter.codes, encounter_import.codes
    assert_equal encounter.start_time, encounter_import.start_time
    assert_equal encounter.end_time, encounter_import.end_time
    
    #Compare Entire Encounters Section
    assert_equal patient.encounters, patient_import.encounters

  end


  def test_round_trip_stringio
    # Export
    mary = Record.where({first: "Mary"}).first
    patient = mary
    start_date = Time.now.years_ago(1)
    end_date = Time.now
    measures = MEASURES
    qrda_xml = HealthDataStandards::Export::Cat1.new.export(patient, measures, start_date, end_date)
    doc = Nokogiri::XML(qrda_xml)
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')    
    mary_xml = StringIO.new(doc.to_s)

    # Import 
    doc_import = Nokogiri::XML(mary_xml.string)
    doc_import.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    doc_import.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    patient_import = Record.new
    HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(patient_import, doc_import)
    encounter = patient.encounters.first
    encounter_import = patient_import.encounters.first

    #Compare Encounter Attributes
    assert_equal encounter.codes, encounter_import.codes
    assert_equal encounter.start_time, encounter_import.start_time
    assert_equal encounter.end_time, encounter_import.end_time
    
    #Compare Entire Encounters Section
    assert_equal patient.encounters, patient_import.encounters

  end


end