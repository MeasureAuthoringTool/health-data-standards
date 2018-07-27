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

  def test_sample
    assert_equal @patient.first, "Elements"
  end

  def test_encounter_performed_serialization
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
    debugger
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

  def get_entry_xpath(qrda_oid)
    "//xmlns:entry//xmlns:templateId[@root=\"" + qrda_oid + "\"]/ancestor::xmlns:entry"
  end

  # def test_patient_data_section_export
  #   med_dispensed = @doc.at_xpath('//cda:supply[cda:templateId/@root="2.16.840.1.113883.10.20.24.3.45"]')
  #   assert med_dispensed, "med_dispensed is nil"
  #   assert_equal "Multivitamin", med_dispensed.at_xpath('./cda:text').text
  # end

  # def test_entries_for_data_criteria
  #   # for some reason the find method isn't working on @measures
  #   measure1 = @measures.select{|m| m.hqmf_id == '0001'}.first
  #   assert measure1
  #   data_criteria = measure1.all_data_criteria.find{|dc| dc.id == 'MedicationDispensedPreferredAsthmaTherapy_precondition_37'}
  #   entries = entries_for_data_criteria(data_criteria, @patient)
  #   assert_equal 1, entries.length
  #   assert_equal 'Multivitamin', entries[0].description
  # end

  # def test_payer_information
  #   data_criteria = OpenStruct.new(definition: "patient_characteristic_payer",
  #                                  status: "",
  #                                  negation: false)
  #   entries = entries_for_data_criteria(data_criteria, @patient)
  #   assert_equal 1, entries.length
  #   assert entries.first.codes['Source of Payment Typology'].include?('6')
  # end

  # def test_unique_data_criteria
  #   pairs = unique_data_criteria(@measures, false)
  #   assert pairs
  #   assert pairs.any? do |p|
  #     p['data_criteria_oid'] == "2.16.840.1.113883.3.560.1.8" &&
  #     p['value_set_oid'] == "2.16.840.1.113883.3.464.0001.373"
  #   end
  # end

  # def test_handling_expired_patients
  #   data_criteria = OpenStruct.new(definition: "patient_characteristic_expired", status: "", negation: false)
  #   deathdate = Time.now.to_i
  #   patient = OpenStruct.new(expired: true, deathdate: deathdate)
  #   entries = entries_for_data_criteria(data_criteria, patient)
  #   assert_equal 1, entries.length
  #   assert_equal deathdate, entries.first.start_time
  # end

  # def test_measure_section_export
  #   measure_entries = @doc.xpath('//cda:section[cda:templateId/@root="2.16.840.1.113883.10.20.24.2.3"]/cda:entry')
  #   assert_equal @measures.length, measure_entries.size
  #   measure = measure_entries.find do |measure_entry|
  #     measure_entry.at_xpath('./cda:organizer/cda:reference/cda:externalDocument/cda:id[@extension="0001"]').present?
  #   end
  #   assert measure
  # end

  # def test_reporting_parameters_section_export
  #   effective_time = @doc.at_xpath('//cda:section[cda:templateId/@root="2.16.840.1.113883.10.20.17.2.1"]/cda:entry/cda:act/cda:effectiveTime')
  #   assert effective_time

  #   assert_equal @start_date.to_formatted_s(:number), effective_time.at_xpath('./cda:low')['value']
  #   assert_equal @end_date.to_formatted_s(:number), effective_time.at_xpath('./cda:high')['value']
  # end

  # def test_record_target_export
  #   street_address = @doc.at_xpath('//cda:recordTarget/cda:patientRole/cda:addr/cda:streetAddressLine')
  #   assert street_address

  #   expected_addr = "15 Credibility Street"

  #   assert_equal expected_addr, street_address.children.first.to_s
  # end
end
