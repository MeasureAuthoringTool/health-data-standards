require_relative '../../../test_helper'

  class DocumentV2Test < Test::Unit::TestCase
    def setup
      @hqmf_contents = File.open("test/fixtures/2.0/NQF59New.xml").read
      @doc = HQMF2::Document.new(@hqmf_contents)
      @model = @doc.to_model
    end
  
    def test_parse
      doc = HQMF2::Document.parse(@hqmf_contents)
      assert_equal 'QualityMeasureDocument', doc.root.name
      assert_equal 'urn:hl7-org:v3', doc.root.namespace.href 
    end
  
    def test_metadata
      assert_equal 'foo', @doc.id
      assert_equal "Sample Quality Measure Document", @doc.title
      assert_equal "This is the measure description.", @doc.description
      assert @doc.measure_period
      assert_equal '20110101', @doc.measure_period.low.value
      assert_equal '20111231', @doc.measure_period.high.value
    end
    
    def test_model_metadata
      assert_equal 'foo', @model.id
      assert_equal "Sample Quality Measure Document", @model.title
      assert_equal "This is the measure description.", @model.description
      assert @model.measure_period
      assert_equal '20110101', @model.measure_period.low.value
      assert_equal '20111231', @model.measure_period.high.value
    end
  
    def test_attributes
      assert_equal 1, @doc.attributes.length
      assert_equal 'COPYRIGHT', @doc.attributes[0].id
      assert_equal 'COPY', @doc.attributes[0].code
      assert_equal 'Copyright', @doc.attributes[0].name
      assert_equal 'Copyright Statement', @doc.attributes[0].value
    end

    def test_model_attributes
      assert_equal 1, @model.attributes.length
      assert_equal 'COPYRIGHT', @model.attributes[0].id
      assert_equal 'COPY', @model.attributes[0].code
      assert_equal 'Copyright', @model.attributes[0].name
      assert_equal 'Copyright Statement', @model.attributes[0].value
    end

    def test_population_criteria
      all_population_criteria = @doc.all_population_criteria
      assert_equal 8, all_population_criteria.length
    
      codes = all_population_criteria.collect {|p| p.id}
      %w(IPP DENOM NUMER DENEXCEP).each do |c|
        assert codes.include?(c)
      end

      ipp = @doc.population_criteria('IPP')
      assert ipp.conjunction?
      assert_equal 'allTrue', ipp.conjunction_code
      assert_equal 1, ipp.preconditions.length
      assert_equal false, ipp.preconditions[0].conjunction?
      assert_equal 'ageBetween17and64', ipp.preconditions[0].reference.id

      den = @doc.population_criteria('DENOM')
      assert_equal 1, den.preconditions.length
      assert den.preconditions[0].conjunction?
      assert_equal 'atLeastOneTrue', den.preconditions[0].conjunction_code
      assert_equal 5, den.preconditions[0].preconditions.length
      assert den.preconditions[0].preconditions[0].conjunction?
      assert_equal 'allTrue', den.preconditions[0].preconditions[0].conjunction_code
      assert_equal 2, den.preconditions[0].preconditions[0].preconditions.length
      assert_equal false, den.preconditions[0].preconditions[0].preconditions[0].conjunction?
      assert_equal 'HasDiabetes', den.preconditions[0].preconditions[0].preconditions[0].reference.id
    
      num = @doc.population_criteria('NUMER')
      assert_equal 1, num.preconditions.length
      assert_equal false, num.preconditions[0].conjunction?
      assert_equal 'HbA1C', num.preconditions[0].reference.id

      exc = @doc.population_criteria('DENEXCEP')
      assert exc.conjunction?
      assert_equal 'atLeastOneTrue', exc.conjunction_code
      assert_equal 3, exc.preconditions.length
      
      assert_equal 2, @doc.populations.length
      assert_equal 'Population1', @doc.populations[0]['id']
      assert_equal 'Population2', @doc.populations[1]['id']
      assert_equal 'IPP', @doc.populations[0]['IPP']
      assert_equal 'IPP_1', @doc.populations[1]['IPP']
      assert_equal 'DENOM', @doc.populations[0]['DENOM']
      assert_equal 'DENOM_1', @doc.populations[1]['DENOM']
      assert_equal 'NUMER', @doc.populations[0]['NUMER']
      assert_equal 'NUMER_1', @doc.populations[1]['NUMER']
      assert_equal 'DENEXCEP', @doc.populations[0]['DENEXCEP']
      assert_equal 'DENEXCEP_1', @doc.populations[1]['DENEXCEP']
      assert_equal nil, @doc.populations[0]['DENEX']
      assert_equal nil, @doc.populations[1]['DENEX']
    end
  
    def test_model_population_criteria
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
    end
  
    def test_data_criteria
      data_criteria = @doc.all_data_criteria
      assert_equal 37, data_criteria.length
    
      criteria = @doc.data_criteria('EndDate')
      assert criteria.to_xml.include?('extension="EndDate"')
      assert_equal :variable, criteria.to_model.type
      assert_equal 'EndDate', criteria.title
      assert_equal HQMF2::Value, criteria.value.class
      assert_equal '20101231', criteria.value.value
      assert_equal 'TS', criteria.value.type
      
      criteria = @doc.data_criteria('DiabetesMedNotAdministeredForNoStatedReason')
      assert criteria.negation
      assert !criteria.negation_code_list_id

      criteria = @doc.data_criteria('DiabetesMedNotAdministeredPatientAllergic')
      assert criteria.negation
      assert_equal '1.2.3.4', criteria.negation_code_list_id

      criteria = @doc.data_criteria('birthdateFiftyYearsBeforeMeasurementPeriod')
      assert_equal :characteristic, criteria.to_model.type
      assert_equal 'Birthdate', criteria.title
      assert_equal :birthtime, criteria.to_model.property
      assert_equal 1, criteria.temporal_references.length
      assert_equal 'SBS', criteria.temporal_references[0].type
      assert_equal 'MeasurePeriod', criteria.temporal_references[0].reference.id
      assert criteria.temporal_references[0].range.low
      assert_equal '50', criteria.temporal_references[0].range.low.value
      assert_equal 'a', criteria.temporal_references[0].range.low.unit
      assert !criteria.temporal_references[0].range.high

      criteria = @doc.data_criteria('ageBetween17and64')
      assert_equal :characteristic, criteria.to_model.type
      assert_equal 'ageBetween17and64', criteria.title
      assert_equal :age, criteria.to_model.property
      assert_equal HQMF2::Range, criteria.value.class
      assert_equal 'IVL_PQ', criteria.value.type
      assert_equal '17', criteria.value.low.value
      assert_equal 'a', criteria.value.low.unit
      assert_equal false, criteria.value.low.derived?
      assert_equal true, criteria.value.low.inclusive?
      assert_equal '64', criteria.value.high.value
      assert_equal 'a', criteria.value.high.unit
      assert_equal false, criteria.value.high.derived?
      assert_equal true, criteria.value.high.inclusive?

      criteria = @doc.data_criteria('genderMale')
      assert_equal :characteristic, criteria.to_model.type
      assert_equal 'Gender', criteria.title
      assert_equal :gender, criteria.to_model.property
      assert_equal HQMF2::Coded, criteria.value.class
      assert_equal 'CD', criteria.value.type
      assert_equal 'M', criteria.value.code
      assert_equal '2.16.840.1.113883.5.1', criteria.value.system

      criteria = @doc.data_criteria('DummyLanguage_Arabic')
      assert_equal :characteristic, criteria.to_model.type
      assert_equal 'Language', criteria.title
      assert_equal :languages, criteria.to_model.property
      assert_equal HQMF2::Coded, criteria.value.class
      assert_equal 'CD', criteria.value.type
      assert_equal 'ar', criteria.value.code
      assert_equal '1.0.639.1', criteria.value.system

      criteria = @doc.data_criteria('DummyMaritalStatus_Divorced')
      assert_equal :characteristic, criteria.to_model.type
      assert_equal 'Marital Status', criteria.title
      assert_equal :maritalStatus, criteria.to_model.property
      assert_equal HQMF2::Coded, criteria.value.class
      assert_equal 'CD', criteria.value.type
      assert_equal 'D', criteria.value.code
      assert_equal '2.16.840.1.113883.5.2', criteria.value.system

      criteria = @doc.data_criteria('DummyRace_Latin_American')
      assert_equal :characteristic, criteria.to_model.type
      assert_equal 'Race', criteria.title
      assert_equal :race, criteria.to_model.property
      assert_equal HQMF2::Coded, criteria.value.class
      assert_equal 'CD', criteria.value.type
      assert_equal '2178-2', criteria.value.code
      assert_equal '2.16.840.1.113883.6.238', criteria.value.system

      criteria = @doc.data_criteria('DummyProcedureAfterHasDiabetes')
      assert_equal :procedures, criteria.to_model.type
      assert criteria.inline_code_list
      assert_equal '127355002', criteria.inline_code_list['SNOMED-CT'][0]
      assert criteria.effective_time
      assert_equal '20100101', criteria.effective_time.low.value
      assert_equal '20111231', criteria.effective_time.high.value
      assert_equal 'completed', criteria.status
      assert_equal 1, criteria.temporal_references.length
      assert_equal 'SAS', criteria.temporal_references[0].type
      assert_equal 'HasDiabetes', criteria.temporal_references[0].reference.id
      assert_equal '1', criteria.temporal_references[0].range.high.value
      assert_equal 'a', criteria.temporal_references[0].range.high.unit

      criteria = @doc.data_criteria('EDorInpatientEncounter')
      assert_equal :encounters, criteria.to_model.type
      assert_equal 'EDorInpatientEncounter', criteria.title
      assert_equal '2.16.840.1.113883.3.464.1.42', criteria.code_list_id
      assert criteria.effective_time
      assert_equal nil, criteria.effective_time.low
      assert criteria.effective_time.high
      assert_equal true, criteria.effective_time.high.derived?
      assert_equal 'EndDate.add(new PQ(-2,\'a\'))', criteria.effective_time.high.expression
      assert_equal 0, criteria.temporal_references.length

      criteria = @doc.data_criteria('HasGestationalDiabetes')
      assert_equal :conditions, criteria.to_model.type
      assert_equal 'HasGestationalDiabetes', criteria.title
      assert_equal '2.16.840.1.113883.3.464.1.67', criteria.code_list_id
      assert criteria.effective_time
      assert criteria.effective_time.low
      assert_equal true, criteria.effective_time.low.derived?
      assert_equal 'StartDate', criteria.effective_time.low.expression
      assert criteria.effective_time.high
      assert_equal true, criteria.effective_time.high.derived?
      assert_equal 'EndDate', criteria.effective_time.high.expression

      criteria = @doc.data_criteria('HbA1C')
      assert_equal :laboratory_tests, criteria.to_model.type
      assert_equal 'HbA1C', criteria.title
      assert_equal 1, criteria.subset_operators.length
      assert_equal 'RECENT', criteria.subset_operators[0].type
      assert_equal '2.16.840.1.113883.3.464.1.72', criteria.code_list_id
      assert_equal 'completed', criteria.status
      assert_equal nil, criteria.effective_time
      assert_equal HQMF2::Range, criteria.value.class
      assert_equal nil, criteria.value.high
      assert criteria.value.low
      assert_equal '9', criteria.value.low.value
      assert_equal '%', criteria.value.low.unit

      criteria = @doc.data_criteria('DummyInlineCodedResult')
      assert_equal :laboratory_tests, criteria.to_model.type
      assert_equal 'DummyInlineCodedResult', criteria.title
      assert_equal 0, criteria.subset_operators.length
      assert_equal '2.16.840.1.113883.3.464.1.72', criteria.code_list_id
      assert_equal 'completed', criteria.status
      assert_equal nil, criteria.effective_time
      assert_equal HQMF2::Coded, criteria.value.class
      assert_equal '1.2.3.4', criteria.value.system
      assert_equal 'xyzzy', criteria.value.code

      criteria = @doc.data_criteria('DummyExternalCodedResult')
      assert_equal :laboratory_tests, criteria.to_model.type
      assert_equal 'DummyExternalCodedResult', criteria.title
      assert_equal 0, criteria.subset_operators.length
      assert_equal '2.16.840.1.113883.3.464.1.72', criteria.code_list_id
      assert_equal 'completed', criteria.status
      assert_equal nil, criteria.effective_time
      assert_equal HQMF2::Coded, criteria.value.class
      assert_equal '1.2.3.4', criteria.value.code_list_id

      criteria = @doc.data_criteria('DiabetesMedAdministered')
      assert !criteria.negation
      assert_equal :medications, criteria.to_model.type
      assert_equal 'DiabetesMedAdministered', criteria.title
      assert_equal '2.16.840.1.113883.3.464.1.94', criteria.code_list_id
      assert criteria.effective_time
      assert_equal nil, criteria.effective_time.high
      assert criteria.effective_time.low
      assert_equal true, criteria.effective_time.low.derived?
      assert_equal "StartDate.add(new PQ(-2,'a'))", criteria.effective_time.low.expression

      criteria = @doc.data_criteria('DiabetesMedSupplied')
      assert_equal :medications, criteria.to_model.type
      assert_equal 'DiabetesMedSupplied', criteria.title
      assert_equal '2.16.840.1.113883.3.464.1.94', criteria.code_list_id
      assert criteria.effective_time
      assert_equal nil, criteria.effective_time.low
      assert criteria.effective_time.high
      assert_equal true, criteria.effective_time.high.derived?
      assert_equal "EndDate.add(new PQ(-2,'a'))", criteria.effective_time.high.expression
      
      criteria = @doc.data_criteria('anyDiabetes')
      assert_equal :derived, criteria.to_model.type
      assert_equal 2, criteria.children_criteria.length
      assert criteria.children_criteria.include? 'HasDiabetes'
      assert criteria.children_criteria.include? 'HasGestationalDiabetes'
      
      criteria = @doc.data_criteria('RiskCategoryAssessment')
      assert_equal :risk_category_assessments, criteria.to_model.type
      assert_equal HQMF2::AnyValue, criteria.value.class      

      criteria = @doc.data_criteria('DummyAmbulatoryEncounterWithSource')
      assert criteria.field_values.has_key?('SOURCE')
      assert_equal HQMF2::Coded, criteria.field_values['SOURCE'].class
      assert_equal '2.16.840.1.113883.3.464.0003.95.02.0005', criteria.field_values['SOURCE'].code_list_id
      assert criteria.field_values.has_key?('FACILITY_LOCATION')
      assert_equal HQMF2::Coded, criteria.field_values['FACILITY_LOCATION'].class
      assert_equal '2.16.840.1.113883.3.464.0003.100.02.0003', criteria.field_values['FACILITY_LOCATION'].code_list_id
      assert_equal 'AmbulatoryEncounter', criteria.source_data_criteria
      assert_equal 'ENCOUNTER_AMBULATORY', criteria.specific_occurrence_const
      assert_equal 'A', criteria.specific_occurrence

      assert_nil @doc.data_criteria('foo')
    end
    
    def test_model_data_criteria
      data_criteria = @model.all_data_criteria
      assert_equal 37, data_criteria.length
    
      criteria = @model.data_criteria('EndDate')
      assert_equal :variable, criteria.type
      assert_equal 'EndDate', criteria.title
      assert_equal HQMF::Value, criteria.value.class
      assert_equal '20101231', criteria.value.value
      assert_equal 'TS', criteria.value.type

      criteria = @model.data_criteria('DiabetesMedNotAdministeredForNoStatedReason')
      assert criteria.negation
      assert !criteria.negation_code_list_id

      criteria = @model.data_criteria('DiabetesMedNotAdministeredPatientAllergic')
      assert criteria.negation
      assert_equal '1.2.3.4', criteria.negation_code_list_id

      criteria = @model.data_criteria('birthdateFiftyYearsBeforeMeasurementPeriod')
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

      criteria = @model.data_criteria('ageBetween17and64')
      assert_equal :characteristic, criteria.type
      assert_equal 'ageBetween17and64', criteria.title
      assert_equal :age, criteria.property
      assert_equal HQMF::Range, criteria.value.class
      assert_equal 'IVL_PQ', criteria.value.type
      assert_equal '17', criteria.value.low.value
      assert_equal 'a', criteria.value.low.unit
      assert_equal false, criteria.value.low.derived?
      assert_equal true, criteria.value.low.inclusive?
      assert_equal '64', criteria.value.high.value
      assert_equal 'a', criteria.value.high.unit
      assert_equal false, criteria.value.high.derived?
      assert_equal true, criteria.value.high.inclusive?

      criteria = @model.data_criteria('genderMale')
      assert_equal :characteristic, criteria.type
      assert_equal 'Gender', criteria.title
      assert_equal :gender, criteria.property
      assert_equal HQMF::Coded, criteria.value.class
      assert_equal 'CD', criteria.value.type
      assert_equal 'M', criteria.value.code
      assert_equal '2.16.840.1.113883.5.1', criteria.value.system

      criteria = @model.data_criteria('DummyLanguage_Arabic')
      assert_equal :characteristic, criteria.type
      assert_equal 'Language', criteria.title
      assert_equal :languages, criteria.property
      assert_equal HQMF::Coded, criteria.value.class
      assert_equal 'CD', criteria.value.type
      assert_equal 'ar', criteria.value.code
      assert_equal '1.0.639.1', criteria.value.system

      criteria = @model.data_criteria('DummyMaritalStatus_Divorced')
      assert_equal :characteristic, criteria.type
      assert_equal 'Marital Status', criteria.title
      assert_equal :maritalStatus, criteria.property
      assert_equal HQMF::Coded, criteria.value.class
      assert_equal 'CD', criteria.value.type
      assert_equal 'D', criteria.value.code
      assert_equal '2.16.840.1.113883.5.2', criteria.value.system

      criteria = @model.data_criteria('DummyRace_Latin_American')
      assert_equal :characteristic, criteria.type
      assert_equal 'Race', criteria.title
      assert_equal :race, criteria.property
      assert_equal HQMF::Coded, criteria.value.class
      assert_equal 'CD', criteria.value.type
      assert_equal '2178-2', criteria.value.code
      assert_equal '2.16.840.1.113883.6.238', criteria.value.system

      criteria = @model.data_criteria('DummyProcedureAfterHasDiabetes')
      assert_equal :allProcedures, criteria.patient_api_function
      assert criteria.inline_code_list
      assert_equal '127355002', criteria.inline_code_list['SNOMED-CT'][0]
      assert criteria.effective_time
      assert_equal '20100101', criteria.effective_time.low.value
      assert_equal '20111231', criteria.effective_time.high.value
      assert_equal 'performed', criteria.status
      assert_equal 1, criteria.temporal_references.length
      assert_equal 'SAS', criteria.temporal_references[0].type
      assert_equal 'HasDiabetes', criteria.temporal_references[0].reference.id
      assert_equal '1', criteria.temporal_references[0].range.high.value
      assert_equal 'a', criteria.temporal_references[0].range.high.unit

      criteria = @model.data_criteria('EDorInpatientEncounter')
      assert_equal :encounters, criteria.type
      assert_equal 'EDorInpatientEncounter', criteria.title
      assert_equal '2.16.840.1.113883.3.464.1.42', criteria.code_list_id
      assert criteria.effective_time
      assert_equal nil, criteria.effective_time.low
      assert criteria.effective_time.high
      assert_equal true, criteria.effective_time.high.derived?
      assert_equal 'EndDate.add(new PQ(-2,\'a\'))', criteria.effective_time.high.expression
      assert_equal 0, criteria.temporal_references.length

      criteria = @model.data_criteria('HasGestationalDiabetes')
      assert_equal :conditions, criteria.type
      assert_equal 'HasGestationalDiabetes', criteria.title
      assert_equal '2.16.840.1.113883.3.464.1.67', criteria.code_list_id
      assert criteria.effective_time
      assert criteria.effective_time.low
      assert_equal true, criteria.effective_time.low.derived?
      assert_equal 'StartDate', criteria.effective_time.low.expression
      assert criteria.effective_time.high
      assert_equal true, criteria.effective_time.high.derived?
      assert_equal 'EndDate', criteria.effective_time.high.expression

      criteria = @model.data_criteria('HbA1C')
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

      criteria = @model.data_criteria('DummyInlineCodedResult')
      assert_equal :laboratory_tests, criteria.type
      assert_equal 'DummyInlineCodedResult', criteria.title
      assert_equal 0, criteria.subset_operators.length
      assert_equal '2.16.840.1.113883.3.464.1.72', criteria.code_list_id
      assert_equal 'performed', criteria.status
      assert_equal nil, criteria.effective_time
      assert_equal HQMF::Coded, criteria.value.class
      assert_equal '1.2.3.4', criteria.value.system
      assert_equal 'xyzzy', criteria.value.code

      criteria = @model.data_criteria('DummyExternalCodedResult')
      assert_equal :laboratory_tests, criteria.type
      assert_equal 'DummyExternalCodedResult', criteria.title
      assert_equal 0, criteria.subset_operators.length
      assert_equal '2.16.840.1.113883.3.464.1.72', criteria.code_list_id
      assert_equal 'performed', criteria.status
      assert_equal nil, criteria.effective_time
      assert_equal HQMF::Coded, criteria.value.class
      assert_equal '1.2.3.4', criteria.value.code_list_id

      criteria = @model.data_criteria('DiabetesMedAdministered')
      assert_equal :medications, criteria.type
      assert_equal 'DiabetesMedAdministered', criteria.title
      assert_equal '2.16.840.1.113883.3.464.1.94', criteria.code_list_id
      assert criteria.effective_time
      assert_equal nil, criteria.effective_time.high
      assert criteria.effective_time.low
      assert_equal true, criteria.effective_time.low.derived?
      assert_equal "StartDate.add(new PQ(-2,'a'))", criteria.effective_time.low.expression

      criteria = @model.data_criteria('DiabetesMedSupplied')
      assert_equal :medications, criteria.type
      assert_equal 'DiabetesMedSupplied', criteria.title
      assert_equal '2.16.840.1.113883.3.464.1.94', criteria.code_list_id
      assert criteria.effective_time
      assert_equal nil, criteria.effective_time.low
      assert criteria.effective_time.high
      assert_equal true, criteria.effective_time.high.derived?
      assert_equal "EndDate.add(new PQ(-2,'a'))", criteria.effective_time.high.expression
      
      criteria = @model.data_criteria('anyDiabetes')
      assert_equal :derived, criteria.type
      assert_equal HQMF::DataCriteria::UNION, criteria.derivation_operator
      assert_equal 0, criteria.subset_operators.size
      assert_equal 2, criteria.children_criteria.length
      assert criteria.children_criteria.include? 'HasDiabetes'
      assert criteria.children_criteria.include? 'HasGestationalDiabetes'

      criteria = @model.data_criteria('RiskCategoryAssessment')
      assert_equal :risk_category_assessments, criteria.type
      assert_equal HQMF::AnyValue, criteria.value.class      

      criteria = @model.data_criteria('DummyAmbulatoryEncounterWithSource')
      assert criteria.field_values.has_key?('SOURCE')
      assert_equal HQMF::Coded, criteria.field_values['SOURCE'].class
      assert_equal '2.16.840.1.113883.3.464.0003.95.02.0005', criteria.field_values['SOURCE'].code_list_id
      assert criteria.field_values.has_key?('FACILITY_LOCATION')
      assert_equal HQMF::Coded, criteria.field_values['FACILITY_LOCATION'].class
      assert_equal '2.16.840.1.113883.3.464.0003.100.02.0003', criteria.field_values['FACILITY_LOCATION'].code_list_id
      assert_equal 'AmbulatoryEncounter', criteria.source_data_criteria
      assert_equal 'ENCOUNTER_AMBULATORY', criteria.specific_occurrence_const
      assert_equal 'A', criteria.specific_occurrence

      assert_nil @model.data_criteria('foo')
    end
    
    def test_to_json
      json = @model.to_json
      
      json[:title].must_equal "Sample Quality Measure Document"
      json[:description].must_equal "This is the measure description."
      
      logic = json[:population_criteria]
      
      population_criteria = logic[:IPP]
      
      ipp = {conjunction?:true, type: 'IPP', title: 'Initial Patient Population', :preconditions=>[{:reference=>"ageBetween17and64"}], hqmf_id: 'IPP'}
      diff = ipp.diff_hash(population_criteria)
      assert diff.empty?, "differences: #{diff.to_json}"
      
      population_criteria = logic[:DENOM]
      denom =
      {conjunction?:true, type: 'DENOM', title:'Denominator', :preconditions=>
          [{:preconditions=>[{:preconditions=>
            [
              { :reference=>"HasDiabetes" },
                {:preconditions=>
                   [
                    {:reference=>"EDorInpatientEncounter"},
                    {:reference=>"AmbulatoryEncounter"}
                   ],
                 :conjunction_code=>"atLeastOneTrue"
                }
            ],
            :conjunction_code=>"allTrue"
           },
           {:reference=>"DiabetesMedAdministered"},
           {:reference=>"DiabetesMedIntended"},
           {:reference=>"DiabetesMedSupplied"},
           {:reference=>"DiabetesMedOrdered"}],
           :conjunction_code=>"atLeastOneTrue"
          }],
          hqmf_id: 'DENOM'
      }
      diff = denom.diff_hash(population_criteria)
      assert diff.empty?, "differences: #{diff.to_json}"
      
      population_criteria = logic[:NUMER]
      numer={conjunction?:true, type: 'NUMER', title:'Numerator', :preconditions=>[{:reference=>"HbA1C"}], hqmf_id: 'NUMER'}
      diff = numer.diff_hash(population_criteria)
      assert diff.empty?, "differences: #{diff.to_json}"
      
      
      population_criteria = logic[:DENEXCEP]
      denomexc = {conjunction?:true, type: 'DENEXCEP', title:'Denominator exception', 
         :preconditions=>
          [{:preconditions=>
             [{:reference=>"HasPolycysticOvaries"},
              {:reference=>"HasDiabetes"}],
            :conjunction_code=>"allTrue"},
           {:reference=>"HasSteroidInducedDiabetes"},
           {:reference=>"HasGestationalDiabetes"}],
          hqmf_id: 'DENEXCEP'
      }
           
      diff = denomexc.diff_hash(population_criteria)
      assert diff.empty?, "differences: #{diff.to_json}"
           
    end
  
  end
