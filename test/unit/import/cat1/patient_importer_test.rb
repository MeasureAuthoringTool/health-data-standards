require 'test_helper'

class PatientImporterTest < MiniTest::Unit::TestCase
  def test_ecog_status_importing
    patient = build_record_from_xml('test/fixtures/cat1_fragments/ecog_fragment.xml')
    ecog_status = patient.conditions.first
    assert ecog_status.codes['SNOMED-CT'].include?('423237006')
    expected_timestamp = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20120619085355')
    assert_equal expected_timestamp, ecog_status.time
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
  end

  def test_procedure_intolerance
    patient = build_record_from_xml('test/fixtures/cat1_fragments/procedure_intolerance_fragment.xml')
    procedure_intolerance = patient.allergies.first
    assert procedure_intolerance.codes['CPT'].include?('90668')
  end

  def test_procedure_order
    patient = build_record_from_xml('test/fixtures/cat1_fragments/procedure_order_fragment.xml')
    procedure_order = patient.procedures.first
    assert procedure_order.codes['CPT'].include?('90870')
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20110524094323')
    assert_equal expected_start, procedure_order.start_time
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

  def test_symptom_active
    patient = build_record_from_xml('test/fixtures/cat1_fragments/symptom_active_fragment.xml')
    symptom_active = patient.conditions.first
    assert symptom_active.codes['SNOMED-CT'].include?('95815000')
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19930215222215')
    assert_equal expected_start, symptom_active.start_time
  end

  def test_comm_prov_to_patient
    patient = build_record_from_xml('test/fixtures/cat1_fragments/comm_prov_to_patient_fragment.xml')
    communication = patient.procedures.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20100605220000')
    assert communication.codes['LOINC'].include?('69981-9')
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

   def test_lab_order
     patient = build_record_from_xml('test/fixtures/cat1_fragments/lab_order_fragment.xml')
     lab_order = patient.results.first
     expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19910519162436')
     assert lab_order.codes['SNOMED-CT'].include?('8879006')
     assert_equal expected_start, lab_order.start_time
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

  def test_medication_active
    patient = build_record_from_xml('test/fixtures/cat1_fragments/medication_active_fragment.xml')
    med_active = patient.medications.first
    expected_start = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890509170647')
    expected_end = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('19890509173724')
    assert med_active.codes['RxNorm'].include?('866439')
    assert_equal expected_start, med_active.start_time
    assert_equal expected_end, med_active.end_time
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
    assert_equal expected_start, pe_finding.start_time
    assert_equal expected_end, pe_finding.end_time
  end



  private

  def build_record_from_xml(xml_file)
    doc = Nokogiri::XML(File.new(xml_file))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    
    patient = Record.new
    HealthDataStandards::Import::Cat1::PatientImporter.instance.import_sections(patient, doc)
    patient
  end

end