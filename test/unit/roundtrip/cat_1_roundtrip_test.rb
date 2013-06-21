require 'test_helper'

class Cat1RoundtripTest < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  # This test class compares a record in Mongoid to itself after being exported
  # and imported.

  def test_round_trip
    skip("need to fix now that we filter translations based on valuesets")
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
    medication = patient.medications.first
    medication_import = patient_import.medications.first
    condition = patient.conditions.first
    condition_import = patient_import.conditions.first
    procedure = patient.procedures.first
    procedure_import = patient_import.procedures.first
    allergy = patient.allergies.first
    allergy_import = patient_import.allergies.first
    medical_equipment = patient.medical_equipment.first
    medical_equipment_import = patient_import.medical_equipment.first

    # Compare Encounter Attributes
    assert_equal encounter.codes, encounter_import.codes
    assert_equal encounter.start_time, encounter_import.start_time
    assert_equal encounter.end_time, encounter_import.end_time
    
    # Compare Entire Encounters Section
    assert_equal patient.encounters, patient_import.encounters

    # Compare Medication Attributes
    assert_equal medication.codes, medication_import.codes

    # Compare Entire Medications Section
    assert_equal patient.medications, patient_import.medications

    # Compare Condition Attributes
    assert_contains_all condition.codes, condition_import.codes

    # Compare Entire Conditions Section
    assert_equal patient.conditions, patient_import.conditions

    # Compare Procedure Attributes
    assert_equal procedure.codes, procedure_import.codes

    # Compare Entire Procedures Section
    assert_equal patient.procedures, patient_import.procedures

    # Compare Allergy Attributes
    assert_equal allergy.codes, allergy_import.codes

    # Compare Entire Allergy Section
    assert_equal patient.allergies, patient_import.allergies

    # Compare Medical Equipment Attributes
    assert_equal medical_equipment.codes, medical_equipment_import.codes

    # Compare Entire Medical Equipment Section
    assert_equal patient.medical_equipment, patient_import.medical_equipment

    

  end



  private 

  def assert_contains_all(a1,a2,msg=nil)
    contains = a2.reject{ |x| a1.include?(x) }.empty?
    msg = "Expected all items in #{mu_pp(a2)} to be included in #{mu_pp(a1)}"
    assert(contains, msg)
  end

end