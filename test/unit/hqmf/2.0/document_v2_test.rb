require_relative '../../../test_helper'

class DocumentV2Test < Minitest::Test
  def setup
    # Parse the sample file and convert to the model
    hqmf_xml = File.open("test/fixtures/2.1/CMS_30_HQMF_R2_Updated.xml").read
    doc = HQMF2::Document.new(hqmf_xml)
   # model = doc.to_model
    # serialize the model using the generator back to XML and then
    # reparse it
   # @hqmf_xml = HQMF2::Generator::ModelProcessor.to_hqmf(model)
   # doc = HQMF2::Document.new(@hqmf_xml)
    @model = doc.to_model
  end


  def test_remove_population_preconditions
     path = File.expand_path("../../../../fixtures/2.1/measures/fulfills.xml", __FILE__)
     hqmf_contents = File.open(path).read
     xml = Nokogiri::XML(hqmf_contents)
     #find the precondition in the parsed document
     precon = xml.xpath("//cda:precondition[./cda:criteriaReference/cda:id[@extension='initialPopulation' and @root='05CB5EF9-FB0E-498F-98FD-805F14AA2B66']]",HQMF2::Document::NAMESPACES)
     assert_equal 1, precon.length
     doc = HQMF2::Document.new(hqmf_contents)
     doc_xml = doc.instance_variable_get("@doc")
     precon2 = doc_xml.xpath("//cda:precondition[./cda:criteriaReference/cda:id[@extension='initialPopulation' and @root='05CB5EF9-FB0E-498F-98FD-805F14AA2B66']]",HQMF2::Document::NAMESPACES)
     assert_equal 0, precon2.length
  end

  def test_roundtrip
    assert_equal 'foo', @model.id
    assert_equal "Statin Prescribed at Discharge", @model.title.strip
    assert_equal "Acute myocardial infarction (AMI) patients who are prescribed a statin at hospital discharge.", @model.description.strip
    data_criteria = @model.all_data_criteria
    assert_equal 13, data_criteria.length # changed to 13 due to filtering of the dc

    assert_equal 26, @model.attributes.length
    assert_equal '201304011658-0500', @model.attributes[0].value_obj.value
    assert_equal 'Finalized Date/Time', @model.attributes[0].code_obj.original_text
    assert_equal 'COPY', @model.attributes[1].code_obj.code
    assert_equal 'Copyright', @model.attributes[1].code_obj.title
    assert_equal 'Copyright Statement', @model.attributes[1].value_obj.value
    assert_equal 'MSRSCORE', @model.attributes[2].code_obj.code
    assert_equal '2.16.840.1.113883.5.4', @model.attributes[2].code_obj.system
    assert_equal HQMF::Coded, @model.attributes[2].value_obj.class
    assert_equal 'Proportion', @model.attributes[2].value_obj.title
    assert_equal 'PROPOR', @model.attributes[2].value_obj.code
    assert_equal '2.16.840.1.113883.1.11.20367', @model.attributes[2].value_obj.system
    assert_equal 'Measure Scoring', @model.attributes[2].code_obj.title
    assert_equal 'For every patient evaluated by this measure also identify payer, race, ethnicity and gender.', @model.attributes[25].value_obj.value

    ref_attrs = @model.attributes_for_code("REF", "2.16.840.1.113883.5.4")
    assert_equal ref_attrs.count, 9

    for a in ref_attrs
      code_obj = a.code_obj
      value_obj = a.value_obj
      assert_equal a.code, "REF"
      assert_equal code_obj.system,  "2.16.840.1.113883.5.4"
      assert_equal value_obj.class, HQMF::ED
      assert_equal code_obj.class, HQMF::Coded
      assert_equal value_obj.media_type, "text/plain"
      assert_operator a.value.length, :>, 10
      assert_equal a.name, "Reference"
    end

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('negStatinMedOrderOnDischarge') }
    assert criteria.negation

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('principalActiveDiagnosis_AMI') }
    assert_equal criteria.status, "performed"

    all_population_criteria = @model.all_population_criteria
    assert_equal all_population_criteria.length, 5

    codes = all_population_criteria.collect {|p| p.id}
    %w(IPP DENOM NUMER DENEXCEP DENEX).each do |c|
      assert codes.include?(c)
    end

    ipp = @model.population_criteria('IPP')
    assert ipp.conjunction?

    denom = @model.population_criteria('DENOM')
    assert denom.conjunction?
    assert_equal denom.title, "Denominator"
    assert_equal denom.type, "DENOM"

    numer = @model.population_criteria('NUMER')
    assert numer.conjunction?
    assert_equal numer.title, "Numerator"
    assert_equal numer.type, "NUMER"

    denex = @model.population_criteria('DENEX')
    assert_equal denex.preconditions.size, 1


    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('statinMedOrderOnDischarge') }
    assert_nil criteria.status
    assert criteria.title, "statinMedOrderOnDischarge"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('principalActiveDiagnosis_AMI') }
    assert criteria.status, "performed"
    assert criteria.title, "Problem"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('inpatientEncounterAMI') }
    assert criteria.status, "performed"
    assert criteria.title, "Encounter Inpatient SNOMED-CT Value Set"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('PatientCharacteristicBirthdate') }
    assert_nil criteria.status
    assert criteria.title, "birth date"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('clinicalTrialParticipant') }
    assert_nil criteria.status
    assert criteria.title, "Clinical Trial Participant"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('InterventionPerformedComfortMeasureOnly') }
    assert_nil criteria.status
    assert criteria.title, "Hospital Measures - Comfort Measure Only Intervention SNOMED-CT Value Set"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('dischargedDuringInpatientEncounterAMI') }
    assert_nil criteria.status
    assert criteria.title, "dischargedDuringInpatientEncounterAMI"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('LDLResultLessThan100_24hr') }
    assert criteria.status, "performed"
    assert criteria.title, "LDL-c LOINC Value Set"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('LDLResultLessThan100_30d') }
    assert criteria.status, "performed"
    assert criteria.title, "LDL-c LOINC Value Set"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('negStatinMedOrderOnDischarge') }
    assert_nil criteria.status
    assert criteria.title, "negStatinMedOrderOnDischarge"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('negActiveDischargeMedStatin') }
    assert criteria.status, "active"
    assert criteria.title, "Discharge Medication"

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('noStatinsWithMedicalReason') }
    assert_nil criteria.status
    assert criteria.title, "noStatinsWithMedicalReason"

=begin
    for x in @model.all_data_criteria
      puts ">>> #{x.id} -- #{x.title}"
    end

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('DiabetesMedNotAdministeredForNoStatedReason') }
    assert criteria.negation
    assert !criteria.negation_code_list_id

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('DiabetesMedNotAdministeredPatientAllergic') }
    assert criteria.negation
    assert_equal '1.2.3.4', criteria.negation_code_list_id

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('DummyAmbulatoryEncounterWithSource') }
    assert criteria.field_values.has_key?('SOURCE')
    assert_equal HQMF::Coded, criteria.field_values['SOURCE'].class
    assert_equal '2.16.840.1.113883.3.464.0003.95.02.0005', criteria.field_values['SOURCE'].code_list_id
    assert criteria.field_values.has_key?('FACILITY_LOCATION')
    assert_equal HQMF::Coded, criteria.field_values['FACILITY_LOCATION'].class
    assert_equal '2.16.840.1.113883.3.464.0003.100.02.0003', criteria.field_values['FACILITY_LOCATION'].code_list_id
    assert_equal 'AmbulatoryEncounter', criteria.source_data_criteria
    assert_equal 'ENCOUNTER_AMBULATORY', criteria.specific_occurrence_const
    assert_equal 'A', criteria.specific_occurrence

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('birthdateFiftyYearsBeforeMeasurementPeriod') }
    assert_equal :characteristic, criteria.type
    assert_equal 'Birthdate', criteria.title
    assert_equal :birthtime, criteria.property
    assert_equal 1, criteria.temporal_references.length
    assert_equal 'SBS', criteria.temporal_references[0].type
    assert_equal 'MeasurePeriod', criteria.temporal_references[0].reference.id
    assert criteria.temporal_references[0].range.low
    assert_equal '50', criteria.temporal_references[0].range.low.value
    assert_equal 'a', criteria.temporal_references[0].range.low.unit
    assert !criteria.temporal_references[0].range.high

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('DummyProcedureAfterHasDiabetesWithCount') }
    assert_equal :procedures, criteria.type
    assert_equal 'performed', criteria.status
    assert_equal '20100101', criteria.effective_time.low.value
    assert_equal '20111231', criteria.effective_time.high.value
    assert criteria.effective_time.low.inclusive
    assert criteria.effective_time.high.inclusive
    assert_equal 1, criteria.temporal_references.length
    assert_equal '1', criteria.temporal_references[0].range.high.value
    assert_equal 'a', criteria.temporal_references[0].range.high.unit
    assert_equal 'HasDiabetes', criteria.temporal_references[0].reference.id
    assert !criteria.code_list_id
    assert criteria.inline_code_list
    assert criteria.inline_code_list['SNOMED-CT']
    assert_equal '127355002', criteria.inline_code_list['SNOMED-CT'][0]
    assert_equal 1, criteria.subset_operators.size
    assert_equal 'SUMMARY', criteria.subset_operators[0].type
    assert_equal '2', criteria.subset_operators[0].value.low.value

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('EDorInpatientEncounter') }
    assert_equal :encounters, criteria.type
    assert !criteria.inline_code_list
    assert_equal '2.16.840.1.113883.3.464.1.42', criteria.code_list_id
    assert criteria.effective_time.high
    assert criteria.effective_time.high.derived?
    assert_equal "EndDate.add(new PQ(-2,'a'))", criteria.effective_time.high.expression

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('anyDiabetes') }
    assert_equal :derived, criteria.type
    assert_equal 'UNION', criteria.derivation_operator
    assert_equal 2, criteria.children_criteria.size
    assert_equal 'HasDiabetes', criteria.children_criteria[0]
    assert_equal 'HasGestationalDiabetes', criteria.children_criteria[1]

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('HasPolycysticOvaries') }
    assert_equal :conditions, criteria.type
    assert_equal '2.16.840.1.113883.3.464.1.98', criteria.code_list_id
    assert criteria.effective_time.high
    assert criteria.effective_time.high.derived?
    assert_equal 'EndDate', criteria.effective_time.high.expression

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('HbA1C') }
    assert_equal :laboratory_tests, criteria.type
    assert_equal 'HbA1C', criteria.title
    assert_equal 1, criteria.subset_operators.length
    assert_equal 'RECENT', criteria.subset_operators[0].type
    assert_equal '2.16.840.1.113883.3.464.1.72', criteria.code_list_id
    assert_equal 'performed', criteria.status
    assert_equal nil, criteria.effective_time
    assert_equal HQMF::Range, criteria.value.class
    assert_equal nil, criteria.value.high
    assert criteria.value.low
    assert_equal '9', criteria.value.low.value
    assert_equal '%', criteria.value.low.unit

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('DummyInlineCodedResult') }
    assert_equal :laboratory_tests, criteria.type
    assert_equal 'DummyInlineCodedResult', criteria.title
    assert_equal 0, criteria.subset_operators.length
    assert_equal '2.16.840.1.113883.3.464.1.72', criteria.code_list_id
    assert_equal 'performed', criteria.status
    assert_equal nil, criteria.effective_time
    assert_equal HQMF::Coded, criteria.value.class
    assert_equal '1.2.3.4', criteria.value.system
    assert_equal 'xyzzy', criteria.value.code

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('DummyExternalCodedResult') }
    assert_equal :laboratory_tests, criteria.type
    assert_equal 'DummyExternalCodedResult', criteria.title
    assert_equal 0, criteria.subset_operators.length
    assert_equal '2.16.840.1.113883.3.464.1.72', criteria.code_list_id
    assert_equal 'performed', criteria.status
    assert_equal nil, criteria.effective_time
    assert_equal HQMF::Coded, criteria.value.class
    assert_equal '1.2.3.4', criteria.value.code_list_id

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('DiabetesMedAdministered') }
    assert !criteria.negation
    assert_equal :medications, criteria.type
    assert_equal 'DiabetesMedAdministered', criteria.title
    assert_equal '2.16.840.1.113883.3.464.1.94', criteria.code_list_id
    assert criteria.effective_time
    assert_equal nil, criteria.effective_time.high
    assert criteria.effective_time.low
    assert_equal true, criteria.effective_time.low.derived?
    assert_equal "StartDate.add(new PQ(-2,'a'))", criteria.effective_time.low.expression

    criteria = @model.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?('DiabetesMedSupplied') }
    assert_equal :medications, criteria.type
    assert_equal 'DiabetesMedSupplied', criteria.title
    assert_equal '2.16.840.1.113883.3.464.1.94', criteria.code_list_id
    assert criteria.effective_time
    assert_equal nil, criteria.effective_time.low
    assert criteria.effective_time.high
    assert_equal true, criteria.effective_time.high.derived?
    assert_equal "EndDate.add(new PQ(-2,'a'))", criteria.effective_time.high.expression

    all_population_criteria = @model.all_population_criteria
    assert_equal 8, all_population_criteria.length

    codes = all_population_criteria.collect {|p| p.id}
    %w(IPP DENOM NUMER DENEXCEP).each do |c|
      assert codes.include?(c)
    end

    ipp = @model.population_criteria('IPP')
    assert ipp.conjunction?
    assert_equal 'allTrue', ipp.conjunction_code
    assert_equal 1, ipp.preconditions.length
    assert_equal false, ipp.preconditions[0].conjunction?
    assert_equal 'ageBetween17and64', ipp.preconditions[0].reference.id

    den = @model.population_criteria('DENOM')
    assert_equal 1, den.preconditions.length
    assert den.preconditions[0].conjunction?
    assert_equal 'atLeastOneTrue', den.preconditions[0].conjunction_code
    assert_equal 5, den.preconditions[0].preconditions.length
    assert den.preconditions[0].preconditions[0].conjunction?
    assert_equal 'allTrue', den.preconditions[0].preconditions[0].conjunction_code
    assert_equal 2, den.preconditions[0].preconditions[0].preconditions.length
    assert_equal false, den.preconditions[0].preconditions[0].preconditions[0].conjunction?
    assert_equal 'HasDiabetes', den.preconditions[0].preconditions[0].preconditions[0].reference.id

    num = @model.population_criteria('NUMER')
    assert_equal 1, num.preconditions.length
    assert_equal false, num.preconditions[0].conjunction?
    assert_equal 'HbA1C', num.preconditions[0].reference.id

    exc = @model.population_criteria('DENEXCEP')
    assert exc.conjunction?
    assert_equal 'atLeastOneTrue', exc.conjunction_code
    assert_equal 3, exc.preconditions.length

    assert_equal 2, @model.populations.length
    assert_equal 'Population1', @model.populations[0]['id']
    assert_equal 'Population2', @model.populations[1]['id']
    assert_equal 'IPP', @model.populations[0]['IPP']
    assert_equal 'IPP_1', @model.populations[1]['IPP']
    assert_equal 'DENOM', @model.populations[0]['DENOM']
    assert_equal 'DENOM_1', @model.populations[1]['DENOM']
    assert_equal 'NUMER', @model.populations[0]['NUMER']
    assert_equal 'NUMER_1', @model.populations[1]['NUMER']
    assert_equal 'DENEXCEP', @model.populations[0]['DENEXCEP']
    assert_equal 'DENEXCEP_1', @model.populations[1]['DENEXCEP']
    assert_equal nil, @model.populations[0]['DENEX']
    assert_equal nil, @model.populations[1]['DENEX']
=end
  end

  def test_schema_valid
    doc = Nokogiri.XML(@hqmf_xml)
    xsd_file = File.open("test/fixtures/2.1/schemas/EMeasure.xsd")
    xsd = Nokogiri::XML.Schema(xsd_file)
    error_count = 0
    xsd.validate(doc).each do |error|
      puts error.message
      error_count = error_count + 1
    end
#    assert_equal 0, error_count
  end
end
