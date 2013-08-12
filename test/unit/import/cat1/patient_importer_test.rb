require 'test_helper'

class PatientImporterTest < MiniTest::Unit::TestCase

  def test_care_goal
    patient = build_record_from_xml('test/fixtures/cat1_fragments/care_goal_fragment.xml')
    care_goal = patient.care_goals.first
    assert care_goal.codes['SNOMED-CT'].include?('252465000')
    assert care_goal.oid
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('201101011400')
    assert_equal expected_start, care_goal.start_time
  end

  def test_discharge_medication_importing
    patient = build_record_from_xml('test/fixtures/cat1_fragments/discharge_medication_fragment.xml')
    discharge = patient.medications.first
    assert discharge.codes['RxNorm'].include?('994435')
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20050430111813')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20050501022146')
    assert_equal expected_start, discharge.start_time
    assert_equal expected_end, discharge.end_time
  end

  def test_physical_exam_performed
    patient = build_record_from_xml('test/fixtures/cat1_fragments/physical_exam_performed_fragment.xml')
    physical_exam = patient.procedures.first
    assert physical_exam.codes['LOINC'].include?('8462-4')
    assert physical_exam.oid
    assert physical_exam.status
  end

  def test_procedure_performed
    patient = build_record_from_xml('test/fixtures/cat1_fragments/procedure_performed_fragment.xml')
    procedure_performed = patient.procedures.first
    assert procedure_performed.codes['CPT'].include?('55876')
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19860117151405')
    assert_equal expected_start, procedure_performed.start_time
  end

  def test_procedure_result
    patient = build_record_from_xml('test/fixtures/cat1_fragments/procedure_result_fragment.xml')
    procedure_result = patient.procedures.first
    assert procedure_result.codes['SNOMED-CT'].include?('116783008')
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20011202034746')
    assert_equal expected_start, procedure_result.start_time
  end

  def test_risk_category_assessment
    patient = build_record_from_xml('test/fixtures/cat1_fragments/risk_category_assessment_fragment.xml')
    risk_category_assessment = patient.procedures.first
    assert risk_category_assessment.codes['LOINC'].include?('72136-5')
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19930805130208')
    assert_equal expected_start, risk_category_assessment.start_time
  end

  def test_device_applied
    patient = build_record_from_xml('test/fixtures/cat1_fragments/device_applied_fragment.xml')
    device_applied = patient.medical_equipment.first
    assert device_applied.codes['ICD-9-CM'].include?('37.98')
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19850331043808')
    assert_equal expected_start, device_applied.start_time
  end

  def test_comm_prov_to_patient
    patient = build_record_from_xml('test/fixtures/cat1_fragments/comm_prov_to_patient_fragment.xml')
    communication = patient.procedures.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20100605220000')
    assert communication.codes['LOINC'].include?('69981-9')
    assert_equal expected_start, communication.start_time
  end

  def test_comm_patient_to_prov
    patient = build_record_from_xml('test/fixtures/cat1_fragments/comm_patient_to_provider_fragment.xml')
    communication = patient.procedures.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20101027165345')
    assert communication.codes['SNOMED-CT'].include?('315640000')
    assert_equal expected_start, communication.start_time
  end

  def test_intervention_order
    patient = build_record_from_xml('test/fixtures/cat1_fragments/intervention_order_fragment.xml')
    intervention_order = patient.procedures.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20100625000000')
    assert intervention_order.codes['SNOMED-CT'].include?('304549008')
    assert_equal expected_start, intervention_order.start_time
  end

  def test_intervention_performed
    patient = build_record_from_xml('test/fixtures/cat1_fragments/intervention_performed_fragment.xml')
    intervention_performed = patient.procedures.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20100205120000')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20100205120000')
    assert intervention_performed.codes['SNOMED-CT'].include?('171207006')
    assert_equal expected_start, intervention_performed.start_time
    assert_equal expected_end, intervention_performed.end_time
  end

  def test_intervention_result
    patient = build_record_from_xml('test/fixtures/cat1_fragments/intervention_result_fragment.xml')
    intervention_result = patient.results.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20041016152724')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20041016204832')
    assert intervention_result.codes['SNOMED-CT'].include?('428181000124104')
    assert_equal expected_start, intervention_result.start_time
    assert_equal expected_end, intervention_result.end_time
  end

  def test_lab_performed
    patient = build_record_from_xml('test/fixtures/cat1_fragments/lab_performed_fragment.xml')
    lab_performed = patient.results.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20020129180704')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20020130074815')
    assert lab_performed.codes['LOINC'].include?('7905-3')
    assert_equal expected_start, lab_performed.start_time
    assert_equal expected_end, lab_performed.end_time
  end

  def test_comm_prov_to_prov
    patient = build_record_from_xml('test/fixtures/cat1_fragments/comm_provider_to_provider_fragment.xml')
    communication = patient.procedures.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19810627142601')
    assert communication.codes['SNOMED-CT'].include?('371545006')
    assert_equal expected_start, communication.start_time
  end

  def test_medication_administered
    patient = build_record_from_xml('test/fixtures/cat1_fragments/medication_admin_fragment.xml')
    med_admin = patient.medications.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20061203201716')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20061204072502')
    assert med_admin.codes['CVX'].include?('33')
    assert_equal expected_start, med_admin.start_time
    assert_equal expected_end, med_admin.end_time
  end

  def test_medication_intolerance
    patient = build_record_from_xml('test/fixtures/cat1_fragments/medication_intolerance_fragment.xml')
    med_intolerance = patient.allergies.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20061203201716')
    assert med_intolerance.codes['RxNorm'].include?('998695')
    assert_equal expected_start, med_intolerance.start_time
  end

  def test_medication_allergy
    patient = build_record_from_xml('test/fixtures/cat1_fragments/medication_allergy_fragment.xml')
    med_allergy = patient.allergies.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19790809140056')
    assert med_allergy.codes['RxNorm'].include?('996994')
    assert_equal expected_start, med_allergy.start_time
  end

    def test_medication_adverse
    patient = build_record_from_xml('test/fixtures/cat1_fragments/medication_adverse_fragment.xml')
    med_adverse = patient.allergies.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20070520173120')
    assert med_adverse.codes['RxNorm'].include?('998695')
    assert_equal expected_start, med_adverse.start_time
  end

  def test_medication_order
    patient = build_record_from_xml('test/fixtures/cat1_fragments/medication_order_fragment.xml')
    med_order = patient.medications.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20000328001401')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20000328012924')
    assert med_order.codes['RxNorm'].include?('866439')
    assert_equal expected_start, med_order.start_time
    assert_equal expected_end, med_order.end_time
  end

  def test_physical_exam_finding
    patient = build_record_from_xml('test/fixtures/cat1_fragments/physical_exam_finding_fragment.xml')
    pe_finding = patient.results.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19910425090834')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19910426051840')
    assert pe_finding.codes['LOINC'].include?('8480-6')
    assert pe_finding.oid
    assert_equal expected_start, pe_finding.start_time
    assert_equal expected_end, pe_finding.end_time
  end

  def test_condition_expired
    dead_patient = Record.new
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/condition_expired_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    HealthDataStandards::Import::Cat1::PatientImporter.instance.get_patient_expired(dead_patient, doc)
    assert dead_patient.expired

    alive_patient = Record.new
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/functional_status_result_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    HealthDataStandards::Import::Cat1::PatientImporter.instance.get_patient_expired(alive_patient, doc)
    refute alive_patient.expired
  end

  def test_functional_status_result
    patient = build_record_from_xml('test/fixtures/cat1_fragments/functional_status_result_fragment.xml')
    func_stat_result = patient.results.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19881027090442')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19881028024912')
    assert func_stat_result.codes['LOINC'].include?('72102-7')
    assert_equal expected_start, func_stat_result.start_time
    assert_equal expected_end, func_stat_result.end_time
  end

  def test_clinical_trial_participant
    patient = Record.new
    doc = Nokogiri::XML(File.new('test/fixtures/cat1_fragments/clinical_trial_participant_fragment.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    HealthDataStandards::Import::Cat1::PatientImporter.instance.get_clinical_trial_participant(patient, doc)
    assert patient.clinicalTrialParticipant
  end

  def test_diagnostic_study_result
    patient = build_record_from_xml('test/fixtures/cat1_fragments/diagnostic_study_result_fragment.xml')
    diag_study_result = patient.results.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890923063243')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890923101231')
    assert diag_study_result.codes['LOINC'].include?('71485-7')
    assert_equal expected_start, diag_study_result.start_time
    assert_equal expected_end, diag_study_result.end_time
  end

  def test_diagnostic_study_performed
    patient = build_record_from_xml('test/fixtures/cat1_fragments/diagnostic_study_performed_fragment.xml')
    diag_study_performed = patient.procedures.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20081029211606')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20081029230540')
    assert diag_study_performed.codes['LOINC'].include?('69399-4')
    assert_equal expected_start, diag_study_performed.start_time
    assert_equal expected_end, diag_study_performed.end_time
  end

  def test_diagnosis_resolved
    patient = build_record_from_xml('test/fixtures/cat1_fragments/diagnosis_resolved_fragment.xml')
    diag_resolved = patient.conditions.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20030403010254')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20030403121452')
    assert diag_resolved.codes['SNOMED-CT'].include?('94643001')
    assert_equal expected_start, diag_resolved.start_time
    assert_equal expected_end, diag_resolved.end_time
  end

  def test_encounter_performed
    patient = build_record_from_xml('test/fixtures/cat1_fragments/encounter_performed_fragment.xml')
    encounter = patient.encounters.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20061121075239')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20061122012933')
    assert encounter.codes['SNOMED-CT'].include?('112689000')
    assert encounter.discharge_disposition["code"].include?('306699001')
    assert_equal expected_start, encounter.start_time
    assert_equal expected_end, encounter.end_time
  end

  def test_insurance_provider
    patient = build_record_from_xml('test/fixtures/cat1_fragments/insurance_provider_fragment.xml')
    ip = patient.insurance_providers.first
    assert_equal({ 'SOP' => ['349'] }, ip.codes)
  end

  private

  def build_record_from_xml(xml_file)
    doc = Nokogiri::XML(File.new(xml_file))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    doc.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    patient = Record.new
    HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(patient, doc)
    patient
  end

end