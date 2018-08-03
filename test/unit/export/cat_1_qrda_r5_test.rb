require 'test_helper'
require 'pry'

class Cat1TestQRDAR5 < Minitest::Test
  include HealthDataStandards::Export::Helper::Cat1ViewHelper


  def setup
    unless @initialized
      dump_database
      collection_fixtures(File.join('records', 'cql_fixtures'), '_id')
      collection_fixtures(File.join('health_data_standards_svs_value_sets', 'cql_fixtures'), '_id')
      collection_fixtures(File.join('measures', 'cql_fixtures'), '_id')

      @patient_134v6 = Record.where({first: "Elements", last:"Test"}).first
      @patient_108v7 = Record.where({first: "108v7 Elements", last:"108v7 Test"}).first
      @patient_144v7 = Record.where({first: "CMS144v7 Elements", last:"CMS144v7 Test"}).first

      @measure_134v6 = [HealthDataStandards::CQM::Measure.where({cms_id: 'CMS134v6'}).first]
      @measure_108v7 = [HealthDataStandards::CQM::Measure.where({cms_id: 'CMS108v7'}).first]
      @measure_144v7 = [HealthDataStandards::CQM::Measure.where({cms_id: 'CMS144v7'}).first]

      @start_date = Time.now.years_ago(1)
      @end_date = Time.now

      @doc_134v6 = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r5").export(@patient_134v6, @measure_134v6, @start_date, @end_date, nil, "r5"))
      @doc_108v7 = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r5").export(@patient_108v7, @measure_108v7, @start_date, @end_date, nil, "r5"))
      @doc_144v7 = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r5").export(@patient_144v7, @measure_144v7, @start_date, @end_date, nil, "r5"))

      @doc_134v6.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      @doc_108v7.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      @doc_144v7.root.add_namespace_definition('cda', 'urn:hl7-org:v3')

      @initialized = true
    end
  end

  # doing tests by measures. each test takes ~30 seconds to run due to setup. Testing by measures
  # allows us to do this more efficiently by breaking the tests up into sub functions.

  def test_CMS134_serialization
    _test_encounter_performed_serialization
    _test_diagnosis_serialization
    _test_intervention_performed_serialization
    _test_laboratory_test_performed_serialization
    _test_medication_active_serialization
    _test_procedure_performed_serialization
  end

  # CMS108v7
  # Covers Assessment Performed, Device Applied, Device Order, Medication
  # Administered, Medication Order.
  #
  # Note:
  # • medication order missing “method”
  # • device applied missing “anatomical approach site” and “anatomical location”
  # (not present in Bonnie)
  def test_CMS108_serialization
    _test_assessment_performed_serialization
    _test_device_applied_serialization
    _test_device_order_serialization
    _test_medication_administered_serialization
    _test_medication_order_serialization
  end

  # CMS144v7
  # Covers Allergy Intolerance, Diagnostic Study Performed, Physical Exam Performed.
  #
  # Note:
  # • Allergy missing “type”
  # • Physical exam missing “anatomical location”
  def test_CMS144_serialization
    _test_allergy_intolerance_serialization
    _test_diagnostic_study_performed_serialization
    _test_physical_exam_performed_serialization
  end

  # helper tests

  def _test_encounter_performed_serialization
    encounter_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.23")
    encounter_performed_node = @doc_134v6.xpath(encounter_performed_xpath)

    assert_equal 1, encounter_performed_node.count

    # relevant period
    relevant_period_node = encounter_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:encounter/xmlns:effectiveTime")
    start = relevant_period_node.xpath("./xmlns:low/@value")
    stop = relevant_period_node.xpath("./xmlns:high/@value")

    assert_equal "20120723080000", start.inner_text
    assert_equal "20120723081500", stop.inner_text

    # admission Source
    # TODO: unsupported (?)

    # diagnosis
    diagnoses_nodes = encounter_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:encounter/xmlns:entryRelationship/xmlns:act/xmlns:templateId[@root=\"2.16.840.1.113883.10.20.22.4.80\"]/parent::xmlns:act")

    assert_equal 2, diagnoses_nodes.count

    kidney_failure = diagnoses_nodes.xpath("./xmlns:entryRelationship/xmlns:observation/xmlns:value[@code=\"129151000119102\"]")
    proteinuria = diagnoses_nodes.xpath("./xmlns:entryRelationship/xmlns:observation/xmlns:value[@code=\"12178007\"]")
    assert kidney_failure != nil
    assert proteinuria != nil

    # discharge disposition
    discharge_disposition_node = encounter_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:encounter/sdtc:dischargeDispositionCode")
    assert_equal 1, discharge_disposition_node.count
    assert_equal "428361000124107", discharge_disposition_node.xpath("./@code").inner_text

    # negation rationale
    # not present on this element

    # principal diagnosis
    principal_diagnosis_node = encounter_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:encounter/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root=\"2.16.840.1.113883.10.20.24.3.152\"]/parent::xmlns:observation")
    assert_equal 1, principal_diagnosis_node.count
    assert_equal "105401000119101", principal_diagnosis_node.xpath("./xmlns:value/@code").inner_text

    # code
    code_node = encounter_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:encounter/xmlns:code")
    assert_equal 1, code_node.count
    assert_equal "12843005", code_node.xpath("./@code").inner_text

    # facility locations
    facility_locations_nodes = encounter_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:encounter/xmlns:participant/xmlns:templateId[@root=\"2.16.840.1.113883.10.20.24.3.100\"]/parent::xmlns:participant")
    assert_equal 2, facility_locations_nodes.count

    emergency_department = facility_locations_nodes.xpath("./xmlns:participantRole/xmlns:code[@code=\"4525004\"]/parent::xmlns:participantRole/parent::xmlns:participant")
    assert emergency_department != nil
    assert "20120723080000", emergency_department.xpath("./xmlns:time/xmlns:low").inner_text
    assert "20120723090000", emergency_department.xpath("./xmlns:time/xmlns:high").inner_text

    office_visit = facility_locations_nodes.xpath("./xmlns:participantRole/xmlns:code[@code=\"185463005\"]/parent::xmlns:participantRole/parent::xmlns:participant")
    assert office_visit != nil
    assert "20120723090000", emergency_department.xpath("./xmlns:time/xmlns:low").inner_text
    assert "20120723100000", emergency_department.xpath("./xmlns:time/xmlns:high").inner_text

  end

  def _test_diagnosis_serialization
    diagnosis_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.135")
    diagnosis_node = @doc_134v6.xpath(diagnosis_xpath)

    # code
    code_node = diagnosis_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:observation/xmlns:value")
    assert_equal 1, code_node.count
    assert_equal "129151000119102", code_node.xpath("./@code").inner_text

    # prevalence period
    prevalence_period_node = diagnosis_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:observation/xmlns:effectiveTime")
    start = prevalence_period_node.xpath("./xmlns:low/@value")
    stop = prevalence_period_node.xpath("./xmlns:high/@value")

    assert_equal "20120723080000", start.inner_text
    assert_equal "20120723081500", stop.inner_text

    # anatomical location site
    anatomical_location_node = diagnosis_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:observation/xmlns:targetSiteCode")
    assert_equal 1, anatomical_location_node.count
    assert_equal "129151000119102", anatomical_location_node.xpath("./@code").inner_text

    # severity
    severity_node = diagnosis_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:value")
    assert_equal 1, severity_node.count
    assert_equal "12178007", severity_node.xpath("./@code").inner_text

  end

  def _test_intervention_performed_serialization
    intervention_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.32")
    intervention_performed_node = @doc_134v6.xpath(intervention_performed_xpath)
    # TODO: code, SNOMED-CT: 385763009
    # TODO: relevantPeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: reason, Reason: Kidney Failure
    # TODO: result, Dead
    # TODO: status, Status: Diabetes
    # TODO: negationRationale, ???

  end

  def _test_laboratory_test_performed_serialization
    lab_test_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3")
    lab_test_performed_node = @doc_134v6.xpath(lab_test_performed_xpath)
    #first test

    # TODO: code, LOINC: 11218-5
    # TODO: relevantPeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: status, Status: Discharged to Health Care Facility for Hospice Care
    # TODO: method, Method: Vascular Access for Dialysis
    # TODO: result, 35 mg
    # TODO: resultDatetime, Result Date/Time: 07/28/2012 8:00 AM
    # TODO: reason, Reason: Kidney Failure
    # TODO: referenceRange, start and stop, 20 mg and 60 mg
    # TODO: negationRationale, ???
    # TODO: components, ???

    #second test

    # TODO: code, LOINC: 11218-5
    # TODO: relevantPeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: status, ???
    # TODO: method, ???
    # TODO: result, ???
    # TODO: resultDatetime, ???
    # TODO: reason, ???
    # TODO: referenceRange, ???
    # TODO: negationRationale, ???
    # TODO: components, Component: Proteinuria, 45 mg , Reference Range - Low: 20 mg, Reference Range - High: 60 mg
    #Component: Vascular Access for Dialysis, Diabetes

  end

  def _test_medication_active_serialization
    medication_active_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.41")
    medication_active_node = @doc_134v6.xpath(medication_active_xpath)
    # TODO: code, RxNorm: 1000001
    # TODO: relevantPeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: dosage, Dosage: 60 mg
    # TODO: supply, Supply: 60 {pills}
    # TODO: frequency, Frequency: 1 mg/day
    # TODO: route, Route: Vascular Access for Dialysis
  end

  def _test_procedure_performed_serialization
    procedure_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.64")
    procedure_performed_node = @doc_134v6.xpath(procedure_performed_xpath)
    # first procedure
    # TODO: code, SNOMED-CT: 108241001
    # TODO: relevantPeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: reason, Reason: Proteinuria
    # TODO: method, Method: Urine Protein Tests
    # TODO: result, Dead
    # TODO: status, Status: Dead
    # TODO: anatomicalApproachSite, ???
    # TODO: anatomicalLocationSite, Face-to-Face Interaction
    # TODO: ordinality, Ordinality: 4
    # TODO: incisionDatetime, Incision Date/Time: 07/12/2012 8:00 AM
    # TODO: negationRationale, ???
    # TODO: components, ???

    #second procedure
    # TODO: code, SNOMED-CT: 175899003
    # TODO: relevantPeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: reason, ???
    # TODO: method, ???
    # TODO: result, ???
    # TODO: status, ???
    # TODO: anatomicalApproachSite, ???
    # TODO: anatomicalLocationSite, ???
    # TODO: ordinality, type: ???
    # TODO: incisionDatetime, ???
    # TODO: negationRationale, ???
    # TODO: components, Component: Diabetic Nephropathy, 56
    # Component: Urine Protein Tests, Proteinuria
  end


# CMS108v7
# Covers Assessment Performed, Device Applied, Device Order, Medication
# Administered, Medication Order.
#
# Note:
# • medication order missing “method”
# • device applied missing “anatomical approach site” and “anatomical location”
# (not present in Bonnie)

  def _test_assessment_performed_serialization
    assessment_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.144")
    assessment_performed_node = @doc_108v7.xpath(assessment_performed_xpath)
    # TODO: code, LOINC: 72136-5
    # TODO: authorDatetime, 08/01/2012 8:00 AM

    # TODO: negationRationale, ???
    # TODO: reason, Reason: Comfort Measures
    # TODO: method, Method: General Surgery
    # TODO: result, 06/14/2012 8:00 AM
    # TODO: components, Component: General or Neuraxial Anesthesia, Hip Replacement Surgery
    # Component: Direct Thrombin Inhibitor, 34 mg
    # Component: Glycoprotein IIb/IIIa Inhibitors, 05/16/2012 8:00 AM
    # TODO: relatedTo, Related To: Device, Applied: Venous foot pumps (VFP) 08/01/2012
  end

  def _test_device_applied_serialization
    device_applied_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.7")
    device_applied_node = @doc_108v7.xpath(device_applied_xpath)
    # TODO: code, SNOMED-CT: 442023007
    # TODO: authorDatetime, type: DateTime
    # TODO: relevantPeriod, start and stop, 08/01/2012 8:00 AM and undefined
    # TODO: negationRationale, ???
    # TODO: reason, Reason: Hemorrhagic Stroke
    # TODO: anatomicalLocationSite, ???
    # TODO: anatomicalApproachSite, ???

    #Note: has second "not performed" device applied
  end

  def _test_device_order_serialization
    device_order_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.9")
    device_order_node = @doc_108v7.xpath(device_order_xpath)
    # TODO: code, SNOMED-CT: 442023007
    # TODO: authorDatetime, start_time, 1343808000
    # TODO: negationRationale, ???
    # TODO: reason, "code_system": "ICD-10-PCS",   "code": "0SP909Z",   "title": "Hip Replacement Surgery"

  end

  def _test_medication_administered_serialization
    medication_administered_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.42")
    medication_administered_node = @doc_108v7.xpath(medication_administered_xpath)

    # TODO: code, RxNorm: 1037045
    # TODO: relevantPeriod, start and stop, 08/01/2012 8:00 AM and UNDEFINED
    # TODO: dosage, Dosage: 5 mg
    # TODO: supply, Supply: 100 mg
    # TODO: frequency, Frequency: 3 days
    # TODO: route, Route: Intravenous route
    # TODO: reason, Reason: Emergency Department Visit
    # TODO: negationRationale, ???
  end

  def _test_medication_order_serialization
    medication_order_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.47")
    medication_order_node = @doc_108v7.xpath(medication_order_xpath)

    # TODO: code, RxNorm: 855288
    # TODO: activeDatetime, ???
    # TODO: relevantPeriod, start and stop, 08/01/2012 8:00 AM and 08/01/2012 8:15 AM
    # TODO: refills, Refills: 9
    # TODO: dosage, Dosage: 5 mg
    # TODO: supply, Supply: 100 mg
    # TODO: frequency, Frequency: 1 day
    # TODO: route, Route: Subcutaneous route
    # TODO: method, ???
    # TODO: reason, Reason: Atrial Fibrillation/Flutter
    # TODO: negationRationale, ???
  end


# CMS144v7
# Covers Allergy Intolerance, Diagnostic Study Performed, Physical Exam Performed.
#
# Note:
# • Allergy missing “type”
# • Physical exam missing “anatomical location”

  def _test_allergy_intolerance_serialization
    allergy_intolerance_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.147")
    allergy_intolerance_node = @doc_144v7.xpath(allergy_intolerance_xpath)

    # TODO: code, RxNorm: 10600
    # TODO: prevalencePeriod, start and stop, 08/01/2012 8:00 AM and 08/01/2012 8:15 AM
    # TODO: type, ???
    # TODO: severity, Severity: Heart rate
  end

  def _test_diagnostic_study_performed_serialization
    diagnostic_study_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.18")
    diagnostic_study_performed_node = @doc_144v7.xpath(diagnostic_study_performed_xpath)

    # TODO: code, LOINC: 10230-1
    # TODO: relevantPeriod, start and stop, 08/01/2012 8:00 AM and 08/01/2012 11:00 AM
    # TODO: reason, Reason: Bradycardia
    # TODO: result, 5 %
    # TODO: resultDatetime, Result Date/Time: 08/01/2012 8:00 AM
    # TODO: status, Status: Moderate or Severe
    # TODO: method, Method: Outpatient Consultation
    # TODO: facilityLocation, SNOMED-CT: 309904001
    # TODO: negationRationale, ???
    # TODO: components, Component: Arrhythmia, 50 bpm
    # Component: Bradycardia, Hypotension
    # Component: Intensive Care Unit, 08/01/2012 9:00 AM
  end

  def _test_physical_exam_performed_serialization
    physical_exam_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.59")
    physical_exam_performed_node = @doc_144v7.xpath(physical_exam_performed_xpath)

    # TODO: code, LOINC: 8867-4
    # TODO: relevantPeriod, start and stop, 08/01/2012 8:00 AM and 08/01/2012 11:00 AM
    # TODO: reason, Reason: Bradycardia
    # TODO: method, Method: Cardiac Pacer in Situ
    # TODO: result, 29 mg
    # TODO: anatomicalLocationSite, ???
    # TODO: negationRationale, ???
    # TODO: components, Component: Intolerance to Beta Blocker Therapy, Nursing Facility Visit
    # Component: Medical Reason, 5 mg
    # Component: Ejection Fraction, 08/01/2012 10:00 AM
  end

  def get_entry_xpath(qrda_oid)
    "//xmlns:entry//xmlns:templateId[@root=\"" + qrda_oid + "\"]/ancestor::xmlns:entry"
  end

end
