require 'test_helper'
require 'pry'

class Cat1TestQRDAR5 < Minitest::Test
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  ENCOUNTER_PERFORMED_XPATH = '//xmlns:entry//templateId[@root="2.16.840.1.113883.10.20.24.3.23"]'

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
      node = @doc.xpath(ENCOUNTER_PERFORMED_XPATH)
      @initialized = true
    end
  end

  def test_sample
    assert_equal @patient.first, "Elements"
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
