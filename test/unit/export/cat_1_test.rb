require 'test_helper'

class Cat1Test < MiniTest::Unit::TestCase
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  def setup
    @patient = Record.where({first: "Barry"}).first

    @start_date = Time.now.years_ago(1)
    @end_date = Time.now

    @measures = MEASURES
    @qrda_xml = HealthDataStandards::Export::Cat1.new.export(@patient, @measures, @start_date, @end_date)
    @doc = Nokogiri::XML(@qrda_xml)
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
  end


  def test_schema_validation
     xsd = Nokogiri::XML::Schema(open("./resources/schema/infrastructure/cda/CDA_SDTC.xsd"))
     Record.all.each do |record|
      doc = Nokogiri::XML(HealthDataStandards::Export::Cat1.new.export(record,@measures,@start_date,@end_date))
      assert_equal [], xsd.validate(doc) 
    end  
  end

  def test_cda_header_export
    first_name = @doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:given').text
    assert_equal 'Barry', first_name
  end

  def test_patient_data_section_export
    med_dispensed = @doc.at_xpath('//cda:supply[cda:templateId/@root="2.16.840.1.113883.10.20.24.3.45"]')
    assert med_dispensed
    assert_equal "Multivitamin", med_dispensed.at_xpath('./cda:text').text
  end

  def test_entries_for_data_criteria
    data_criteria = @measures.find{|m| m.hqmf_id == '2E679CD2-3FEC-4A75-A75A-61403E5EFEE8'}.all_data_criteria.find{|dc| dc.id == 'MedicationDispensedPharyngitisAntibiotics_precondition_4'}
    entries = entries_for_data_criteria(data_criteria, @patient)
    assert_equal 1, entries.length
    assert_equal 'Multivitamin', entries[0].description
  end

  def test_payer_information
    data_criteria = OpenStruct.new(definition: "patient_characteristic_payer",
                                   status: "",
                                   negation: false)
    entries = entries_for_data_criteria(data_criteria, @patient)
    assert_equal 1, entries.length
    assert entries.first.codes['Source of Payment Typology'].include?('6')
  end

  def test_unique_data_criteria
    pairs = unique_data_criteria(@measures)
    assert pairs
    assert pairs.any? do |p|
      p['data_criteria_oid'] == "2.16.840.1.113883.3.560.1.8" &&
      p['value_set_oid'] == "2.16.840.1.113883.3.464.0001.373"
    end
  end

  def test_handling_expired_patients
    data_criteria = OpenStruct.new(definition: "patient_characteristic_expired", status: "", negation: false)
    deathdate = Time.now.to_i
    patient = OpenStruct.new(expired: true, deathdate: deathdate)
    entries = entries_for_data_criteria(data_criteria, patient)
    assert_equal 1, entries.length
    assert_equal deathdate, entries.first.start_date
  end

  def test_measure_section_export
    measure_entries = @doc.xpath('//cda:section[cda:templateId/@root="2.16.840.1.113883.10.20.24.2.3"]/cda:entry')
    assert_equal MEASURES.length, measure_entries.size
    measure = measure_entries.find do |measure_entry|
      measure_entry.at_xpath('./cda:organizer/cda:reference/cda:externalDocument/cda:setId[@root="B5FEE67F-F5C4-4C73-9D58-1941F9729539"]').present?
    end
    assert measure
  end

  def test_reporting_parameters_section_export
    effective_time = @doc.at_xpath('//cda:section[cda:templateId/@root="2.16.840.1.113883.10.20.17.2.1"]/cda:entry/cda:act/cda:effectiveTime')
    assert effective_time

    assert_equal @start_date.to_formatted_s(:number), effective_time.at_xpath('./cda:low')['value']
    assert_equal @end_date.to_formatted_s(:number), effective_time.at_xpath('./cda:high')['value']
  end
end