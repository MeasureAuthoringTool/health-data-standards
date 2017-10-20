require 'test_helper'

class Cat1Test < Minitest::Test
  include HealthDataStandards::Export::Helper::Cat1ViewHelper

  def setup
    unless @initialized
      dump_database
      collection_fixtures('records')
      @patient = Record.where({first: "Barry"}).first

      pp = ProviderPerformance.new(start_date: Time.new(2012).to_i, end_date: Time.new(2012, 12, 31).to_i)
      provider = Provider.new(first: 'Hiram', last: 'McDaniels')
      provider.npi = '111111111'
      provider.save!
      pp.provider = provider
      @patient.provider_performances << pp

      @start_date = Time.now.years_ago(1)
      @end_date = Time.now

      collection_fixtures('health_data_standards_svs_value_sets', '_id', 'bundle_id')
      collection_fixtures('bundles', '_id')

      collection_fixtures('measures')
      @measures = HealthDataStandards::CQM::Measure.all
      @header = generate_header
      @qrda_xml = HealthDataStandards::Export::Cat1.new("r3").export(@patient, @measures, @start_date, @end_date, @header, "r3")
      @doc = Nokogiri::XML(@qrda_xml)
      @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      @initialized = true
    end
  end


  def test_schema_validation
     xsd = Nokogiri::XML::Schema(open("./resources/schema/infrastructure/cda/CDA_SDTC.xsd"))
     valid_measures = @measures.select { |m| m.hqmf_id.length > 4 } #make sure there is a valid hqmf_id
     Record.all.each do |record|
      insurance_provider = InsuranceProvider.new(start_time: Time.new(2008,1,1).to_i,
                                                 codes: {"SOP" => [349]})
      record.insurance_providers << insurance_provider
      puts "Testing Cat I for #{record.first} #{record.last}"
      doc = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r3").export(record,valid_measures,@start_date,@end_date, @header, "r3"))
      assert_equal [], xsd.validate(doc), "Invalid Cat I for #{record.first} #{record.last}"
    end
  end

  def test_schematron_validation_qrda_r3
    Record.all.each do |record|
      insurance_provider = InsuranceProvider.new(start_time: Time.new(2008,1,1).to_i,
						 codes: {"SOP" => [349]})
      record.insurance_providers << insurance_provider
      puts "Testing Cat I for #{record.first} #{record.last}"
      doc = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r3").export(record,@measures,@start_date,@end_date, @header, "r3"))
      errors = HealthDataStandards::Validate::Cat1.instance.validate(doc, {file_name: "cat1_good.xml"})

      doc2 = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r3").export(record,@measures,@start_date,@end_date, nil, "r3"))
      errors2 = HealthDataStandards::Validate::Cat1.instance.validate(doc, {file_name: "cat1_good.xml"})

      assert_equal [], errors, "Invalid Cat I for #{record.first} #{record.last} (with header)"
      assert_equal [], errors2, "Invalid Cat I for #{record.first} #{record.last} (w/o header)"

    end
  end

  def test_schematron_validation_qrda_r4
    # Patients with retired 'data criteria' (e.g., Diagnosis, Active) will fail export with QRDA Cat I R4.
    Record.where(last: "QRDAR4").each do |record|
      puts "Testing Cat I for #{record.first} #{record.last}"
      doc = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r4").export(record,@measures,Time.at(1420070400),Time.at(1451606399), @header, "r4"))
      errors = HealthDataStandards::Validate::Cat1R4.instance.validate(doc, {file_name: "cat1_good.xml"})

      doc2 = Nokogiri::XML(HealthDataStandards::Export::Cat1.new("r4").export(record,@measures,@start_date,@end_date, nil, "r4"))
      errors2 = HealthDataStandards::Validate::Cat1R4.instance.validate(doc, {file_name: "cat1_good.xml"})

      assert_equal [], errors, "Invalid Cat I for #{record.first} #{record.last} (with header)"
      assert_equal [], errors2, "Invalid Cat I for #{record.first} #{record.last} (w/o header)"

    end
  end

  def test_schematron_r2_validation
    Record.all.each do |record|
      insurance_provider = InsuranceProvider.new(start_time: Time.new(2008,1,1).to_i,
             codes: {"SOP" => [349]})
      record.insurance_providers << insurance_provider
      puts "Testing Cat I for #{record.first} #{record.last}"
      doc = Nokogiri::XML(HealthDataStandards::Export::Cat1R2.new.export(record,@measures,@start_date,@end_date, @header))
      errors = HealthDataStandards::Validate::Cat1R2.instance.validate(doc, {file_name: "cat1_good.xml"})

      doc2 = Nokogiri::XML(HealthDataStandards::Export::Cat1R2.new.export(record,@measures,@start_date,@end_date, nil))
      errors2 = HealthDataStandards::Validate::Cat1R2.instance.validate(doc, {file_name: "cat1_good.xml"})

      assert_equal [], errors, "Invalid Cat I for #{record.first} #{record.last} (with header)"
      assert_equal [], errors2, "Invalid Cat I for #{record.first} #{record.last} (w/o header)"

    end
  end

  def test_cda_header_export
    first_name = @doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name/cda:given').text
    medical_record_assigner = @doc.at_xpath('/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:id/@root').value
    author_root_value = @doc.at_xpath('/cda:ClinicalDocument/cda:author/cda:assignedAuthor/cda:id/@root').value
    assert_equal 'Barry', first_name
    assert_equal 'BarryBerrysBasement', medical_record_assigner
    assert_equal '2.16.840.1.113883.4.7', author_root_value
  end

  def test_patient_data_section_export
    med_dispensed = @doc.at_xpath('//cda:supply[cda:templateId/@root="2.16.840.1.113883.10.20.24.3.45"]')
    assert med_dispensed, "med_dispensed is nil"
    assert_equal "Multivitamin", med_dispensed.at_xpath('./cda:text').text
  end

  def test_entries_for_data_criteria
    # for some reason the find method isn't working on @measures
    measure1 = @measures.select{|m| m.hqmf_id == '0001'}.first
    assert measure1
    data_criteria = measure1.all_data_criteria.find{|dc| dc.id == 'MedicationDispensedPreferredAsthmaTherapy_precondition_37'}
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
    pairs = unique_data_criteria(@measures, false)
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
    assert_equal deathdate, entries.first.start_time
  end

  def test_measure_section_export
    measure_entries = @doc.xpath('//cda:section[cda:templateId/@root="2.16.840.1.113883.10.20.24.2.3"]/cda:entry')
    assert_equal @measures.length, measure_entries.size
    measure = measure_entries.find do |measure_entry|
      measure_entry.at_xpath('./cda:organizer/cda:reference/cda:externalDocument/cda:id[@extension="0001"]').present?
    end
    assert measure
  end

  def test_reporting_parameters_section_export
    effective_time = @doc.at_xpath('//cda:section[cda:templateId/@root="2.16.840.1.113883.10.20.17.2.1"]/cda:entry/cda:act/cda:effectiveTime')
    assert effective_time

    assert_equal @start_date.to_formatted_s(:number), effective_time.at_xpath('./cda:low')['value']
    assert_equal @end_date.to_formatted_s(:number), effective_time.at_xpath('./cda:high')['value']
  end

  def test_record_target_export
    street_address = @doc.at_xpath('//cda:recordTarget/cda:patientRole/cda:addr/cda:streetAddressLine')
    assert street_address

    expected_addr = "15 Credibility Street"

    assert_equal expected_addr, street_address.children.first.to_s
  end

  def generate_header
    header_hash=  {identifier: {root: "2.16.840.1.113883.4.6", extension: "header_ext"},
                   authors: [{ids: [ {root: "2.16.840.1.113883.4.7" , extension: "author_extension"}],
                              device: {name:"dvice_name" , model: "device_mod"},
                              addresses:[Address.new(street: ["1234 Drury Lane"], city: "Bedford", state: "MA", zip: "01960", country: "USA")],
			      telecoms: [Telecom.new(use: "WP", value: "555-555-1234")],
                              time: Time.now,
                              organization: {ids: [ {root: "2.16.840.1.113883.4.9" , extension: "authors_organization_ext"}],
                                             name: ""}}],
                   custodian: {ids: [ {root: "custodian_root" , extension: "custodian_ext"}],
                               person: {given: "", family: ""},
                               organization: {ids: [ {root: "2.16.840.1.113883.4.12" , extension: "custodian_organization_ext"}],
					      name: "", addresses:[Address.new(street: ["1234 Drury Lane"], city: "Bedford", state: "MA", zip: "01960", country: "USA")], telecoms: [Telecom.new(use: "WP", value: "555-555-3456")]}},
                   legal_authenticator:{ids: [ {root: "2.16.840.1.113883.4.14" , extension: "legal_authenticator_ext"}],
                                        addresses: [Address.new(street: ["1234 Drury Lane"], city: "Bedford", state: "MA", zip: "01960", country: "USA")],
					telecoms: [Telecom.new(use: "WP", value: "555-555-2345")],
                                        time: Time.now,
                                        person: {given:"hey", family: "there"},
                                        organization:{ids: [ {root: "2.16.840.1.113883.4.62" , extension: "legal_authenticator_org_ext"}],
                                                      name: ""}
                   }
    }

    Qrda::Header.new(header_hash)
  end
end
