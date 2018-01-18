require 'test_helper'

class Cat1RoundtripTest < Minitest::Test
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  # This test class compares a record in Mongoid to itself after being exported
  # and imported.

  def setup
    dump_database
    collection_fixtures('records', '_id')
    collection_fixtures('health_data_standards_svs_value_sets', '_id', 'bundle_id')
    collection_fixtures('bundles', '_id')
    collection_fixtures('measures')
  end

  def test_round_trip
    # Export
    patient = Record.where({first: "Mary"}).first
    start_date = Time.now.years_ago(1)
    end_date = Time.now
    measure = HealthDataStandards::CQM::Measure.where({name: "Mary Berry's Wacky Wild Measure"}).first
    qrda_xml = HealthDataStandards::Export::Cat1.new("r3").export(patient, [measure], start_date, end_date, nil, "r3")
    # Import
    doc_import = Nokogiri::XML(qrda_xml)
    doc_import.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    doc_import.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')

    patient_import = Record.new
    HealthDataStandards::Import::C32::PatientImporter.instance.get_demographics(patient_import, doc_import)
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

    # Compare Medication Attributes
    assert_equal medication.codes, medication_import.codes

    # Compare Condition Attributes
    assert_contains_all condition.codes, condition_import.codes

    # Compare Procedure Attributes
    assert_equal procedure.codes, procedure_import.codes

    # Compare Allergy Attributes
    assert_equal allergy.codes, allergy_import.codes

    # Compare Medical Equipment Attributes
    # Both codes are in the negated valueset
    assert_equal 1, HealthDataStandards::SVS::ValueSet.where('concepts.code' => medical_equipment.codes.first[1][0]).in(oid: medical_equipment_import.codes['NA_VALUESET'][0]).count
    assert_equal 1, HealthDataStandards::SVS::ValueSet.where('concepts.code' => medical_equipment_import.codes.first[1][0]).in(oid: medical_equipment_import.codes['NA_VALUESET'][0]).count

  end



  private

  def assert_contains_all(a1,a2,msg=nil)
    contains = a2.reject{ |x| a1.include?(x) }.empty?
    msg = "Expected all items in #{mu_pp(a2)} to be included in #{mu_pp(a1)}"
    assert(contains, msg)
  end

end
