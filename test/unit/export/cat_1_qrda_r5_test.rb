require 'test_helper'

class Cat1TestQRDAR5 < Minitest::Test
  include HealthDataStandards::Export::Helper::Cat1ViewHelper


  describe """Tests QRDA5 export using CMS134v6.
  Specifically tests:
  * Encounter Performed
  * Diagnosis
  * Intervention Performed
  * Laboratory Test Performed
  * Medication Active
  * Procedure Performed""" do


    def setup
      unless @initialized
        dump_database
        # clear cached value sets
        HealthDataStandards::Export::Helper::ScoopedViewHelper::VS_MAP.clear

        collection_fixtures(File.join('records', 'cql_fixtures', 'core_measures', 'CMS134v6'), '_id')
        collection_fixtures(File.join('health_data_standards_svs_value_sets', 'cql_fixtures', 'core_measures', 'CMS134v6'), '_id')
        collection_fixtures(File.join('measures', 'cql_fixtures', 'core_measures', 'CMS134v6'), '_id')

        @patient_134v6 = Record.where({first: "Elements", last:"Test"}).first
        @measure_134v6 = [HealthDataStandards::CQM::Measure.where({cms_id: 'CMS134v6'}).first]

        @start_date = Time.now.years_ago(1)
        @end_date = Time.now

        @doc_134v6 = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r5").export(@patient_134v6, @measure_134v6, @start_date, @end_date, nil, "r5"))
        @doc_134v6.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
        @initialized = true
      end
    end

    def test_CMS134_serialization
      _test_encounter_performed_serialization
      _test_diagnosis_serialization
      _test_intervention_performed_serialization
      _test_laboratory_test_performed_serialization
      _test_medication_active_serialization
      _test_procedure_performed_serialization
    end

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

      # admission source
      admission_source_node = encounter_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:encounter/xmlns:participant/xmlns:participantRole/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.151']/../..")
      assert_equal 1, admission_source_node.count
      assert_equal "185460008", admission_source_node.xpath("./xmlns:participantRole/xmlns:code/@code").inner_text

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

      assert_equal 1, diagnosis_node.count

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

      assert_equal 1, intervention_performed_node.count

      # code
      code_node = intervention_performed_node.xpath("./xmlns:act/xmlns:code")
      assert_equal 1, code_node.count
      assert_equal "385763009", code_node.xpath("./@code").inner_text

      # relevant period
      relevant_period_node = intervention_performed_node.xpath("./xmlns:act/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")

      assert_equal "20120723080000", start.inner_text
      assert_equal "20120723081500", stop.inner_text

      # reason
      reason_node = intervention_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, reason_node.count
      assert_equal "129151000119102", reason_node.xpath("./@code").inner_text

      # result
      result_node = intervention_performed_node.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.22.4.2']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, result_node.count
      assert_equal "419099009", result_node.xpath("./@code").inner_text

      # status
      # does not exist in any AU measures. Not yet supported in QRDA export.

      # negation rationale
      # not present on this element

    end

    def _test_laboratory_test_performed_serialization
      lab_test_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.38")
      lab_test_performed_nodes = @doc_134v6.xpath(lab_test_performed_xpath)

      assert_equal 2, lab_test_performed_nodes.count

      lab_test_performed_node1 = lab_test_performed_nodes.xpath("./xmlns:observation/xmlns:code[@code='11218-5']/../..")
      assert_equal 1, lab_test_performed_node1.count

      lab_test_performed_node2 = lab_test_performed_nodes.xpath("./xmlns:observation/xmlns:code[@code='12842-1']/../..")
      assert_equal 1, lab_test_performed_node2.count

      # first test

      # code
      # already confirmed above

      # relevant period
      relevant_period_node = lab_test_performed_node1.xpath("./xmlns:observation/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")

      assert_equal "20120723080000", start.inner_text
      assert_equal "20120723081500", stop.inner_text

      # status
      # does not exist in any AU measures. Not yet supported in QRDA export.

      # method
      # not specified in the QRDA documentation

      # result
      result_node = lab_test_performed_node1.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.22.4.2']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, result_node.count
      assert_equal "35", result_node.xpath("./@value").inner_text
      assert_equal "mg", result_node.xpath("./@unit").inner_text

      # result date time
      result_date_time_node = lab_test_performed_node1.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.22.4.2']/parent::xmlns:observation/xmlns:effectiveTime")
      # start and stop should be equal
      start = result_date_time_node.xpath("./xmlns:low/@value")
      stop = result_date_time_node.xpath("./xmlns:high/@value")
      assert_equal "20120728080000", start.inner_text
      assert_equal start.inner_text, stop.inner_text

      # reason
      reason_node = lab_test_performed_node1.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, reason_node.count
      assert_equal "129151000119102", reason_node.xpath("./@code").inner_text

      # reference range
      reference_range_node = lab_test_performed_node1.xpath("./xmlns:observation/xmlns:referenceRange")
      assert_equal 1, reference_range_node.count

      low = reference_range_node.xpath("./xmlns:observationRange/xmlns:value/xmlns:low")
      high = reference_range_node.xpath("./xmlns:observationRange/xmlns:value/xmlns:high")

      assert_equal "20", low.xpath("./@value").inner_text
      assert_equal "mg", low.xpath("./@unit").inner_text
      assert_equal "60", high.xpath("./@value").inner_text
      assert_equal "mg", high.xpath("./@unit").inner_text

      #second test

      # code
      # already confirmed above

      # relevant period
      relevant_period_node = lab_test_performed_node2.xpath("./xmlns:observation/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")

      assert_equal "20120723080000", start.inner_text
      assert_equal "20120723081500", stop.inner_text

      # components
      component_nodes = lab_test_performed_node2.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.149']/../..")
      assert_equal 2, component_nodes.count

      component_node1 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='12178007']/../..")
      component_node2 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='180272001']/../..")
      assert_equal 1, component_node1.count
      assert_equal 1, component_node2.count

      # first component
      component_result_node = component_node1.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, component_result_node.count
      assert_equal "45", component_result_node.xpath("./@value").inner_text
      assert_equal "mg", component_result_node.xpath("./@unit").inner_text

      component_reference_range_node = component_node1.xpath("./xmlns:observation/xmlns:referenceRange")
      assert_equal 1, reference_range_node.count

      low = reference_range_node.xpath("./xmlns:observationRange/xmlns:value/xmlns:low")
      high = reference_range_node.xpath("./xmlns:observationRange/xmlns:value/xmlns:high")

      assert_equal "20", low.xpath("./@value").inner_text
      assert_equal "mg", low.xpath("./@unit").inner_text
      assert_equal "60", high.xpath("./@value").inner_text
      assert_equal "mg", high.xpath("./@unit").inner_text

      # second component
      component_result_node = component_node2.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, component_result_node.count
      assert_equal "105401000119101", component_result_node.xpath("./@code").inner_text

    end

    def _test_medication_active_serialization
      medication_active_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.41")
      medication_active_node = @doc_134v6.xpath(medication_active_xpath)

      assert_equal 1, medication_active_node.count

      # code
      code_node = medication_active_node.xpath("./xmlns:substanceAdministration/xmlns:consumable/xmlns:manufacturedProduct/xmlns:manufacturedMaterial/xmlns:code")
      assert_equal 1, code_node.count
      assert_equal "1000001", code_node.xpath("./@code").inner_text

      # effective time elements
      effective_time_nodes = medication_active_node.xpath("./xmlns:substanceAdministration/xmlns:effectiveTime")
      assert_equal 2, effective_time_nodes.count

      # relevant period
      relevant_period_node = effective_time_nodes[0]
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")

      assert_equal "20120723080000", start.inner_text
      assert_equal "20120723081500", stop.inner_text

      # frequency
      frequency_node = effective_time_nodes[1].xpath("./xmlns:period")
      assert_equal "1", frequency_node.xpath("./@value").inner_text
      assert_equal "mg/day", frequency_node.xpath("./@unit").inner_text

      # dosage
      dosage_node = medication_active_node.xpath("./xmlns:substanceAdministration/xmlns:doseQuantity")
      assert_equal 1, dosage_node.count
      assert_equal "60", dosage_node.xpath("./@value").inner_text
      assert_equal "mg", dosage_node.xpath("./@unit").inner_text

      # supply
      supply_node = medication_active_node.xpath("./xmlns:substanceAdministration/xmlns:entryRelationship/xmlns:supply")
      assert_equal 1, supply_node.count
      assert_equal "60", supply_node.xpath("./xmlns:quantity/@value").inner_text
      assert_equal "{pills}", supply_node.xpath("./xmlns:quantity/@unit").inner_text

      # route
      route_node = medication_active_node.xpath("./xmlns:substanceAdministration/xmlns:routeCode")
      assert_equal 1, route_node.count
      assert_equal "180272001", route_node.xpath("./@code").inner_text

    end

    def _test_procedure_performed_serialization
      procedure_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.64")
      procedure_performed_nodes = @doc_134v6.xpath(procedure_performed_xpath)

      assert_equal 2, procedure_performed_nodes.count

      procedure_performed_node1 = procedure_performed_nodes.xpath("./xmlns:procedure/xmlns:code[@code='108241001']/../..")
      assert_equal 1, procedure_performed_node1.count

      procedure_performed_node2 = procedure_performed_nodes.xpath("./xmlns:procedure/xmlns:code[@code='175899003']/../..")
      assert_equal 1, procedure_performed_node2.count

      # first procedure

      # code
      # already confirmed above

      # relevant period
      relevant_period_node = procedure_performed_node1.xpath("./xmlns:procedure/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")

      assert_equal "20120723080000", start.inner_text
      assert_equal "20120723081500", stop.inner_text

      # reason
      reason_node = procedure_performed_node1.xpath("./xmlns:procedure/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, reason_node.count
      assert_equal "12178007", reason_node.xpath("./@code").inner_text

      # result
      result_node = procedure_performed_node1.xpath("./xmlns:procedure/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.22.4.2']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, result_node.count
      assert_equal "419099009", result_node.xpath("./@code").inner_text

      # method
      method_node = procedure_performed_node1.xpath("./xmlns:procedure/xmlns:methodCode")
      assert_equal 1, method_node.count
      assert_equal "11218-5", method_node.xpath("./@code").inner_text

      # status
      # does not exist in any AU measures. Not yet supported in QRDA export.

      # anatomical approach site
      # not on fixture. missing in bonnie.

      # anatomical location site
      anatomical_location_node = procedure_performed_node1.xpath("./xmlns:procedure/xmlns:targetSiteCode")
      assert_equal 1, anatomical_location_node.count
      assert_equal "12843005", anatomical_location_node.xpath("./@code").inner_text

      # ordinality
      ordinality_node = procedure_performed_node1.xpath("./xmlns:procedure/xmlns:priorityCode")
      assert_equal 1, ordinality_node.count
      assert_equal "127013003", ordinality_node.xpath("./@code").inner_text

      # incision date time
      incision_datetime_node = procedure_performed_node1.xpath("./xmlns:procedure/xmlns:entryRelationship/xmlns:procedure/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.89']/parent::xmlns:procedure/xmlns:effectiveTime")
      assert_equal 1, incision_datetime_node.count
      assert_equal "20120712080000", incision_datetime_node.xpath("./@value").inner_text

      # negation rationale
      # no negation rationale present on this element

      # second procedure

      # code
      # already confirmed above

      # relevant period
      relevant_period_node = procedure_performed_node2.xpath("./xmlns:procedure/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")

      # components
      component_nodes = procedure_performed_node2.xpath("./xmlns:procedure/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.149']/../..")
      assert_equal 2, component_nodes.count

      component_node1 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='127013003']/../..")
      component_node2 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='11218-5']/../..")
      assert_equal 1, component_node1.count
      assert_equal 1, component_node2.count

      # component 1
      # Component: Diabetic Nephropathy, 56
      component_result_node = component_node1.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, component_result_node.count
      assert_equal "56", component_result_node.xpath("./@value").inner_text
      assert_equal "1", component_result_node.xpath("./@unit").inner_text

      # component 2
      # Component: Urine Protein Tests, Proteinuria
      component_result_node = component_node2.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, component_result_node.count
      assert_equal "12178007", component_result_node.xpath("./@code").inner_text

    end
  end

  describe """Tests QRDA5 export using CMS108v7.
  Specifically tests:
  * Assessment Performed
  * Device Applied
  * Device Order,
  * Medication Administered
  * Medication Order""" do

    def setup
      unless @initialized
        dump_database
        # clear cached value sets
        HealthDataStandards::Export::Helper::ScoopedViewHelper::VS_MAP.clear

        collection_fixtures(File.join('records', 'cql_fixtures', 'special_measures', 'CMS108v7'), '_id')
        collection_fixtures(File.join('health_data_standards_svs_value_sets', 'cql_fixtures', 'special_measures', 'CMS108v7'), '_id')
        collection_fixtures(File.join('measures', 'cql_fixtures', 'special_measures', 'CMS108v7'), '_id')

        @patient_108v7 = Record.where({first: "108v7 Elements", last:"108v7 Test"}).first
        @measure_108v7 = [HealthDataStandards::CQM::Measure.where({cms_id: 'CMS108v7'}).first]

        @start_date = Time.now.years_ago(1)
        @end_date = Time.now

        @doc_108v7 = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r5").export(@patient_108v7, @measure_108v7, @start_date, @end_date, nil, "r5"))
        @doc_108v7.root.add_namespace_definition('cda', 'urn:hl7-org:v3')

        @initialized = true
      end
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

    def _test_assessment_performed_serialization
      assessment_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.144")
      assessment_performed_node = @doc_108v7.xpath(assessment_performed_xpath)
      assert_equal 1, assessment_performed_node.count
      code_node = assessment_performed_node.xpath("./xmlns:observation/xmlns:code")
      assert_equal 1, code_node.count
      assert_equal "72136-5", code_node.xpath("./@code").inner_text

      # relevant period
      relevant_period_node = assessment_performed_node.xpath("./xmlns:observation/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")
      stop_undef = relevant_period_node.xpath("./xmlns:high/@nullFlavor")
      assert_equal "20120801080000", start.inner_text
      assert_equal 0, stop.count
      assert_equal "UNK", stop_undef.inner_text
      # reason
      reason_node = assessment_performed_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, reason_node.count
      assert_equal "133918004", reason_node.xpath("./@code").inner_text
      # method
      method_node = assessment_performed_node.xpath("./xmlns:observation/xmlns:methodCode")
      assert_equal 1, method_node.count
      assert_equal "008Q0ZZ", method_node.xpath("./@code").inner_text

      # result
      result_value = assessment_performed_node.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, result_value.count
      assert_equal "1339660800000", result_value.xpath("./@value").inner_text

      # components
      component_nodes = assessment_performed_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.149']/../..")
      assert_equal 3, component_nodes.count

      component_node1 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='112943005']/../..")
      component_node2 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='1037045']/../..")
      component_node3 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='1736470']/../..")
      assert_equal 1, component_node1.count
      assert_equal 1, component_node2.count
      assert_equal 1, component_node3.count
      # component 1
      assert_equal "0SP909Z", component_node1.xpath("./xmlns:observation/xmlns:value/@code").inner_text
      assert_equal "2.16.840.1.113883.6.4", component_node1.xpath("./xmlns:observation/xmlns:value/@codeSystem").inner_text
      # component 2
      assert_equal "34", component_node2.xpath("./xmlns:observation/xmlns:value/@value").inner_text
      assert_equal "mg", component_node2.xpath("./xmlns:observation/xmlns:value/@unit").inner_text
      # component 3
      assert_equal "443421006080000", component_node3.xpath("./xmlns:observation/xmlns:value/@value").inner_text

      # relatedTo
      related_to_node = assessment_performed_node.xpath("./xmlns:observation/sdtc:inFulfillmentOf1")
      assert_equal 1, related_to_node.count
      related_to_id = related_to_node.xpath("sdtc:actReference/sdtc:id/@extension")[0].value
      assert_equal "5b6c247cb848464add0870ee", related_to_id

    end

    def _test_device_applied_serialization
      device_applied_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.7")
      device_applied_nodes = @doc_108v7.xpath(device_applied_xpath)

      assert_equal 2, device_applied_nodes.count

      device_applied_node1 = device_applied_nodes.xpath("./xmlns:procedure/xmlns:participant/xmlns:participantRole/xmlns:playingDevice/xmlns:code[@code='442023007']/../../../../..")
      assert_equal 1, device_applied_node1.count

      device_applied_node2 = device_applied_nodes.xpath("./xmlns:procedure/xmlns:participant/xmlns:participantRole/xmlns:playingDevice/xmlns:code[@code='428411000124104']/../../../../..")
      assert_equal 1, device_applied_node2.count

      # first device

      # code
      # already confirmed above

      # relevant period
      relevant_period_node = device_applied_node1.xpath("./xmlns:procedure/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")
      stop_undef = relevant_period_node.xpath("./xmlns:high/@nullFlavor")

      assert_equal "20120801080000", start.inner_text
      assert_equal 0, stop.count
      assert_equal "UNK", stop_undef.inner_text

      # reason
      reason_node = device_applied_node1.xpath("./xmlns:procedure/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, reason_node.count
      assert_equal "195155004", reason_node.xpath("./@code").inner_text

      # anatomical location site
      # not available in bonnie

      # anatomical approach site
      # not available in bonnie

      # second device

      # code
      # already confirmed above

      # author date time
      author_datetime_node = device_applied_node2.xpath("./xmlns:procedure/xmlns:effectiveTime")
      start = author_datetime_node.xpath("./xmlns:low/@value")

      assert_equal "20120801080000", start.inner_text

      # negation rationale
      negation_indicator = device_applied_node2.xpath("./xmlns:procedure/@negationInd")
      assert_equal "true", negation_indicator.inner_text

      negation_reason_node = device_applied_node2.xpath("./xmlns:procedure/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, negation_reason_node.count
      assert_equal "1037045", negation_reason_node.xpath("./@code").inner_text

    end

    def _test_device_order_serialization
      device_order_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.9")
      device_order_nodes = @doc_108v7.xpath(device_order_xpath)
      assert_equal 2, device_order_nodes.count

      device_order_node1 = device_order_nodes.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:supply/xmlns:participant/xmlns:participantRole/xmlns:playingDevice/xmlns:code[@code='442023007']/../../../../../../..")
      assert_equal 1, device_order_node1.count

      device_order_node2 = device_order_nodes.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:supply/xmlns:participant/xmlns:participantRole/xmlns:playingDevice/xmlns:code[@code='348681001']/../../../../../../..")
      assert_equal 1, device_order_node2.count

      # first device

      # code
      # already confirmed above

      # author datetime
      author_datetime_node = device_order_node1.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:supply/xmlns:effectiveTime")
      start = author_datetime_node.xpath("./xmlns:low/@value")

      assert_equal "20120801080000", start.inner_text

      # reason
      reason_node = device_order_node1.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:supply/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, reason_node.count
      assert_equal "0SP909Z", reason_node.xpath("./@code").inner_text

      # second device

      # author date time
      author_datetime_node = device_order_node2.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:supply/xmlns:effectiveTime")
      start = author_datetime_node.xpath("./xmlns:low/@value")

      assert_equal "20120801080000", start.inner_text

      # negation rationale
      negation_indicator = device_order_node2.xpath("./xmlns:act/@negationInd")
      assert_equal "true", negation_indicator.inner_text

      negation_reason_node = device_order_node2.xpath("./xmlns:act/xmlns:entryRelationship/xmlns:supply/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, negation_reason_node.count
      assert_equal "195155004", negation_reason_node.xpath("./@code").inner_text

    end

    def _test_medication_administered_serialization
      medication_administered_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.42")
      medication_administered_nodes = @doc_108v7.xpath(medication_administered_xpath)

      assert_equal 2, medication_administered_nodes.count

      medication_administered_node1 = medication_administered_nodes.xpath("./xmlns:substanceAdministration/xmlns:consumable/xmlns:manufacturedProduct/xmlns:manufacturedMaterial/xmlns:code[@code='1037045']/../../../../..")
      assert_equal 1, medication_administered_node1.count

      medication_administered_node2 = medication_administered_nodes.xpath("./xmlns:substanceAdministration/xmlns:consumable/xmlns:manufacturedProduct/xmlns:manufacturedMaterial/xmlns:code[@code='1361226']/../../../../..")
      assert_equal 1, medication_administered_node2.count

      # first medication

      # code
      # already confirmed above

      # effective time elements
      effective_time_nodes = medication_administered_node1.xpath("./xmlns:substanceAdministration/xmlns:effectiveTime")
      assert_equal 2, effective_time_nodes.count

      # relevant period
      relevant_period_node = effective_time_nodes[0]
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")
      stop_undef = relevant_period_node.xpath("./xmlns:high/@nullFlavor")

      assert_equal "20120801080000", start.inner_text
      assert_equal 0, stop.count
      assert_equal "UNK", stop_undef.inner_text

      # frequency
      frequency_node = effective_time_nodes[1].xpath("./xmlns:period")
      assert_equal "3", frequency_node.xpath("./@value").inner_text
      assert_equal "days", frequency_node.xpath("./@unit").inner_text

      # dosage
      dosage_node = medication_administered_node1.xpath("./xmlns:substanceAdministration/xmlns:doseQuantity")
      assert_equal 1, dosage_node.count
      assert_equal "5", dosage_node.xpath("./@value").inner_text
      assert_equal "mg", dosage_node.xpath("./@unit").inner_text

      # supply
      supply_node = medication_administered_node1.xpath("./xmlns:substanceAdministration/xmlns:entryRelationship/xmlns:supply")
      assert_equal 1, supply_node.count
      assert_equal "100", supply_node.xpath("./xmlns:quantity/@value").inner_text
      assert_equal "mg", supply_node.xpath("./xmlns:quantity/@unit").inner_text

      # route
      route_node = medication_administered_node1.xpath("./xmlns:substanceAdministration/xmlns:routeCode")
      assert_equal 1, route_node.count
      assert_equal "418114005", route_node.xpath("./@code").inner_text

      # second medication

      # code
      # already confirmed above

      # author date time
      author_datetime_node = medication_administered_node2.xpath("./xmlns:substanceAdministration/xmlns:effectiveTime")
      start = author_datetime_node.xpath("./xmlns:low/@value")

      assert_equal "20120801080000", start.inner_text

      # negation rationale
      negation_indicator = medication_administered_node2.xpath("./xmlns:substanceAdministration/@negationInd")
      assert_equal "true", negation_indicator.inner_text

      negation_reason_node = medication_administered_node2.xpath("./xmlns:substanceAdministration/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, negation_reason_node.count
      assert_equal "861356", negation_reason_node.xpath("./@code").inner_text

    end

    def _test_medication_order_serialization
      medication_order_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.47")
      medication_order_nodes = @doc_108v7.xpath(medication_order_xpath)

      assert_equal 2, medication_order_nodes.count

      medication_order_node1 = medication_order_nodes.xpath("./xmlns:substanceAdministration/xmlns:consumable/xmlns:manufacturedProduct/xmlns:manufacturedMaterial/xmlns:code[@code='855288']/../../../../..")
      assert_equal 1, medication_order_node1.count

      medication_order_node2 = medication_order_nodes.xpath("./xmlns:substanceAdministration/xmlns:consumable/xmlns:manufacturedProduct/xmlns:manufacturedMaterial/xmlns:code[@code='1361226']/../../../../..")
      assert_equal 1, medication_order_node2.count

      # first medication

      # code
      # already confirmed above

      # effective time elements
      effective_time_nodes = medication_order_node1.xpath("./xmlns:substanceAdministration/xmlns:effectiveTime")
      assert_equal 2, effective_time_nodes.count

      # author date time
      author_datetime_node = effective_time_nodes[0]
      start = author_datetime_node.xpath("./xmlns:low/@value")

      assert_equal "20120801080000", start.inner_text

      # frequency
      frequency_node = effective_time_nodes[1].xpath("./xmlns:period")
      assert_equal "1", frequency_node.xpath("./@value").inner_text
      assert_equal "day", frequency_node.xpath("./@unit").inner_text

      # dosage
      # dosage value entered as 5 but shows as 1 due to use of rxnorm code, which is precoordinated
      dosage_node = medication_order_node1.xpath("./xmlns:substanceAdministration/xmlns:doseQuantity")
      assert_equal 1, dosage_node.count
      assert_equal "5", dosage_node.xpath("./@value").inner_text
      assert_equal "mg", dosage_node.xpath("./@unit").inner_text

      # # supply
      # TODO: don't see this in the QRDA documentation even though it's in the QDM model
      # supply_node = medication_order_node1.xpath("./xmlns:substanceAdministration/xmlns:entryRelationship/xmlns:supply")
      # assert_equal 1, supply_node.count
      # assert_equal "100", supply_node.xpath("./xmlns:quantity/@value").inner_text
      # assert_equal "mg", supply_node.xpath("./xmlns:quantity/@unit").inner_text

      # route
      route_node = medication_order_node1.xpath("./xmlns:substanceAdministration/xmlns:routeCode")
      assert_equal 1, route_node.count
      assert_equal "34206005", route_node.xpath("./@code").inner_text

      # refills
      refills_node = medication_order_node1.xpath("./xmlns:substanceAdministration/xmlns:repeatNumber")
      assert_equal "9", refills_node.xpath("./@value").inner_text

      # method
      # not available in bonnie

      # second medication

      # code
      # already confirmed above

      # author date time
      author_datetime_node = medication_order_node2.xpath("./xmlns:substanceAdministration/xmlns:effectiveTime")
      start = author_datetime_node.xpath("./xmlns:low/@value")

      assert_equal "20120801080000", start.inner_text

      # negation rationale
      negation_indicator = medication_order_node2.xpath("./xmlns:substanceAdministration/@negationInd")
      assert_equal "true", negation_indicator.inner_text

      negation_reason_node = medication_order_node2.xpath("./xmlns:substanceAdministration/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, negation_reason_node.count
      assert_equal "101421000119107", negation_reason_node.xpath("./@code").inner_text
    end

  end

  describe """Tests QRDA5 export using CMS144v7.
  Specifically tests:
  * Allergy Intolerance
  * Diagnostic Study Performed
  * Physical Exam Performed""" do

    def setup
      unless @initialized
        dump_database
        # clear cached value sets
        HealthDataStandards::Export::Helper::ScoopedViewHelper::VS_MAP.clear

        collection_fixtures(File.join('records', 'cql_fixtures', 'special_measures', 'CMS144v7'), '_id')
        collection_fixtures(File.join('health_data_standards_svs_value_sets', 'cql_fixtures', 'special_measures', 'CMS144v7'), '_id')
        collection_fixtures(File.join('measures', 'cql_fixtures', 'special_measures', 'CMS144v7'), '_id')

        @patient_144v7 = Record.where({first: "CMS144v7 Elements", last:"CMS144v7 Test"}).first
        @measure_144v7 = [HealthDataStandards::CQM::Measure.where({cms_id: 'CMS144v7'}).first]

        @start_date = Time.now.years_ago(1)
        @end_date = Time.now

        @doc_144v7 = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r5").export(@patient_144v7, @measure_144v7, @start_date, @end_date, nil, "r5"))
        @doc_144v7.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
        @initialized = true
      end
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

    def _test_allergy_intolerance_serialization
      allergy_intolerance_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.147")
      allergy_intolerance_node = @doc_144v7.xpath(allergy_intolerance_xpath)

      assert_equal 1, allergy_intolerance_node.count

      # code
      code_node = allergy_intolerance_node.xpath("./xmlns:observation/xmlns:participant/xmlns:participantRole/xmlns:playingEntity/xmlns:code")
      assert_equal 1, code_node.count
      assert_equal "10600", code_node.xpath("./@code").inner_text

      # prevalence period
      prevalence_period_node = allergy_intolerance_node.xpath("./xmlns:observation/xmlns:effectiveTime")
      start = prevalence_period_node.xpath("./xmlns:low/@value")
      stop = prevalence_period_node.xpath("./xmlns:high/@value")

      assert_equal "20120801080000", start.inner_text
      assert_equal "20120801081500", stop.inner_text

      # severity
      severity_node = allergy_intolerance_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.22.4.8']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, severity_node.count
      assert_equal "8867-4", severity_node.xpath("./@code").inner_text

      # type
      # not present in Bonnie

    end

    def _test_diagnostic_study_performed_serialization
      diagnostic_study_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.18")
      diagnostic_study_performed_node = @doc_144v7.xpath(diagnostic_study_performed_xpath)

      assert_equal 1, diagnostic_study_performed_node.count

      # code
      code_node = diagnostic_study_performed_node.xpath("./xmlns:observation/xmlns:code")
      assert_equal 1, code_node.count
      assert_equal "10230-1", code_node.xpath("./@code").inner_text

      # relevant period
      relevant_period_node = diagnostic_study_performed_node.xpath("./xmlns:observation/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")

      assert_equal "20120801080000", start.inner_text
      assert_equal "20120801110000", stop.inner_text

      # reason
      reason_node = diagnostic_study_performed_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, reason_node.count
      assert_equal "251162005", reason_node.xpath("./@code").inner_text

      # result
      result_node = diagnostic_study_performed_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.22.4.2']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, result_node.count
      assert_equal "5", result_node.xpath("./@value").inner_text
      assert_equal "%", result_node.xpath("./@unit").inner_text

      # result date time
      result_date_time_node = diagnostic_study_performed_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.22.4.2']/parent::xmlns:observation/xmlns:effectiveTime")
      # start and stop should be equal
      start = result_date_time_node.xpath("./xmlns:low/@value")
      stop = result_date_time_node.xpath("./xmlns:high/@value")
      assert_equal "20120801080000", start.inner_text
      assert_equal start.inner_text, stop.inner_text

      # status
      # does not exist in any AU measures. Not yet supported in QRDA export.

      # method
      method_node = diagnostic_study_performed_node.xpath("./xmlns:observation/xmlns:methodCode")
      assert_equal 1, method_node.count
      assert_equal "17436001", method_node.xpath("./@code").inner_text

      # facility location
      facility_location_node = diagnostic_study_performed_node.xpath("./xmlns:observation/xmlns:participant/xmlns:templateId[@root=\"2.16.840.1.113883.10.20.24.3.100\"]/parent::xmlns:participant")
      assert_equal 1, facility_location_node.count
      assert_equal "309904001", facility_location_node.xpath("./xmlns:participantRole/xmlns:code/@code").inner_text

      # negation rationale
      # not present on this element

      # components
      component_nodes = diagnostic_study_performed_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.149']/../..")
      assert_equal 3, component_nodes.count

      component_node1 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='10164001']/../..")
      component_node2 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='251162005']/../..")
      component_node3 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='309904001']/../..")
      assert_equal 1, component_node1.count
      assert_equal 1, component_node2.count
      assert_equal 1, component_node3.count

      # component 1
      component_result_node = component_node1.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, component_result_node.count
      assert_equal "50", component_result_node.xpath("./@value").inner_text
      assert_equal "bpm", component_result_node.xpath("./@unit").inner_text

      # component 2
      component_result_node = component_node2.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, component_result_node.count
      assert_equal "195506001", component_result_node.xpath("./@code").inner_text

      # component 3
      component_result_node = component_node3.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, component_result_node.count
      assert_equal "20120801090000", component_result_node.xpath("./@value").inner_text

    end

    def _test_physical_exam_performed_serialization
      physical_exam_performed_xpath = get_entry_xpath("2.16.840.1.113883.10.20.24.3.59")
      physical_exam_performed_node = @doc_144v7.xpath(physical_exam_performed_xpath)

      assert_equal 1, physical_exam_performed_node.count
      code_node = physical_exam_performed_node.xpath("./xmlns:observation/xmlns:code")
      assert_equal 1, code_node.count
      assert_equal "8867-4", code_node.xpath("./@code").inner_text

      # relevant period
      relevant_period_node = physical_exam_performed_node.xpath("./xmlns:observation/xmlns:effectiveTime")
      start = relevant_period_node.xpath("./xmlns:low/@value")
      stop = relevant_period_node.xpath("./xmlns:high/@value")
      assert_equal "20120801080000", start.inner_text
      assert_equal 1, stop.count
      assert_equal "20120801081500", stop.inner_text

      # reason
      reason_node = physical_exam_performed_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.88']/parent::xmlns:observation/xmlns:value")
      assert_equal 1, reason_node.count
      assert_equal "251162005", reason_node.xpath("./@code").inner_text

      # method
      method_node = physical_exam_performed_node.xpath("./xmlns:observation/xmlns:methodCode")
      assert_equal 1, method_node.count
      assert_equal "441509002", method_node.xpath("./@code").inner_text

      # result
      result_value = physical_exam_performed_node.xpath("./xmlns:observation/xmlns:value")
      assert_equal 1, result_value.count
      assert_equal "29", result_value.xpath("./@value").inner_text

      # components
      component_nodes = physical_exam_performed_node.xpath("./xmlns:observation/xmlns:entryRelationship/xmlns:observation/xmlns:templateId[@root='2.16.840.1.113883.10.20.24.3.149']/../..")
      assert_equal 3, component_nodes.count

      component_node1 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='292419005']/../..")
      component_node2 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='183932001']/../..")
      component_node3 = component_nodes.xpath("./xmlns:observation/xmlns:code[@code='10230-1']/../..")
      assert_equal 1, component_node1.count
      assert_equal 1, component_node2.count
      assert_equal 1, component_node3.count
      # component 1
      assert_equal "18170008", component_node1.xpath("./xmlns:observation/xmlns:value/@code").inner_text
      assert_equal "2.16.840.1.113883.6.96", component_node1.xpath("./xmlns:observation/xmlns:value/@codeSystem").inner_text
      # component 2
      assert_equal "5", component_node2.xpath("./xmlns:observation/xmlns:value/@value").inner_text
      assert_equal "mg", component_node2.xpath("./xmlns:observation/xmlns:value/@unit").inner_text
      # component 3
      assert_equal "20120801100000", component_node3.xpath("./xmlns:observation/xmlns:value/@value").inner_text
    end
  end
end
