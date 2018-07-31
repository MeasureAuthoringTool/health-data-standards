require 'test_helper'
require 'pry'

class Cat1TestQRDAR5 < Minitest::Test
  include HealthDataStandards::Export::Helper::Cat1ViewHelper


  def setup
    unless @initialized
      dump_database
      records_set = File.join('records', 'cql_fixtures', 'core_measures', 'CMS134v6')
      valueset_set = File.join('health_data_standards_svs_value_sets', 'cql_fixtures', 'core_measures', 'CMS134v6')
      measure_set = File.join('measures', 'cql_fixtures', 'core_measures', 'CMS134v6')

      collection_fixtures(records_set)
      collection_fixtures(valueset_set)
      collection_fixtures(measure_set)

      @patient = Record.where({first: "Elements", last:"Test"}).first
      @measure = [HealthDataStandards::CQM::Measure.first]

      @start_date = Time.now.years_ago(1)
      @end_date = Time.now

      @qrda_xml = HealthDataStandards::Export::Cat1.new("r5").export(@patient, @measure, @start_date, @end_date, nil, "r5")
      @doc = Nokogiri::XML(@qrda_xml)
      @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      @initialized = true
    end
  end

  def test_encounter_performed_serialization
    #byebug
    encounter_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.23")
    encounter_performed_node = @doc.xpath(encounter_performed_xpath)

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
    # TODO

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

    # length of stay
    # TODO

  end

  def test_diagnosis_serialization
    # TODO: use diagnosis template
    diagnosis_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.23")
    # TODO: code, SNOMED-CT: 129151000119102
    # TODO: prevalencePeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: anatomicalLocationSite, Anatomical Location Site: Kidney Failure
    # TODO: severity,  Severity: Proteinuria

  end

  def test_intervention_performed_serialization
    # TODO: use intervention performed template
    intervention_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.23")
    # TODO: code, SNOMED-CT: 385763009
    # TODO: relevantPeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: reason, Reason: Kidney Failure
    # TODO: result, Dead
    # TODO: status, Status: Diabetes
    # TODO: negationRationale, ???

  end

  def test_laboratory_test_performed_serialization
    # TODO: use laboratory test performed template
    lab_test_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.23")
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

  def test_medication_active_serialization
    # TODO: use medication active template
    medication_active_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.23")
    # TODO: code, RxNorm: 1000001
    # TODO: relevantPeriod, start and stop, 07/23/2012 8:00 AM and  07/23/2012 8:15 AM
    # TODO: dosage, Dosage: 60 mg
    # TODO: supply, Supply: 60 {pills}
    # TODO: frequency, Frequency: 1 mg/day
    # TODO: route, Route: Vascular Access for Dialysis
  end

  def test_procedure_performed_serialization
    # TODO: use procedure performed template
    procedure_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.23")
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

  def get_entry_xpath(qrda_oid)
    "//xmlns:entry//xmlns:templateId[@root=\"" + qrda_oid + "\"]/ancestor::xmlns:entry"
  end

end
