require_relative '../../../test_helper'

module HQMF1

  class DocumentV1Test  < Test::Unit::TestCase
    def setup
      @hqmf_file_path = File.expand_path("../../../../fixtures/1.0/NQF_Retooled_Measure_0043.xml", __FILE__)
      @doc = HQMF1::Document.new(File.open(@hqmf_file_path).read)
    end
  
    def test_parse
      doc = HQMF1::Document.parse(File.open(@hqmf_file_path).read)
      assert_equal 'QualityMeasureDocument', doc.root.name
      assert_equal 'urn:hl7-org:v3', doc.root.namespace.href 
    end
  
    def test_metadata
      assert_equal "Pneumonia Vaccination Status for Older Adults (NQF 0043)", @doc.title
      assert_equal "The percentage of patients 65 years of age and older who have ever received a pneumococcal vaccine.", @doc.description
    end
  
    def test_attributes
      attr_list = @doc.all_attributes
      assert_equal 16, attr_list.length
  
      attr = @doc.attribute_for_code('MSRTP')
      assert_equal 'F8D5AD22-F49E-4181-B886-E5B12BEA8966', attr.id
      assert_equal '12', attr.value
      assert_equal 'm', attr.unit
      assert_equal 'Measurement period', attr.name

      attr = @doc.attribute('F8D5AD22-F49E-4181-B886-E5B12BEA8966e')
      assert_equal 'MSRED', attr.code
      assert_equal '00001231', attr.value
      assert_equal nil, attr.unit
      assert_equal 'Measurement end date', attr.name

      attr = @doc.attribute_for_code('MSRTP')
      assert_equal 'Measurement period', attr.name
    end
  
    def test_population_criteria
      all_population_criteria = @doc.all_population_criteria
      assert_equal 4, all_population_criteria.length
    
      codes = all_population_criteria.collect {|p| p.code}
      %w(IPP DENOM NUMER DENEX).each do |c|
        assert codes.include?(c)
      end
    
      ipp = @doc.population_criteria_for_code('IPP')
      assert_equal 1, ipp.preconditions.length
      assert_equal 0, ipp.preconditions[0].preconditions.length
      assert_equal 'AND', ipp.preconditions[0].conjunction
      assert_equal '52A541D7-9C22-4633-8AEC-389611894672', ipp.preconditions[0].comparison.data_criteria_id
      assert_equal 1, ipp.preconditions[0].comparison.restrictions.length
      assert_equal 'SBS', ipp.preconditions[0].comparison.restrictions[0].type
      assert_equal 'F8D5AD22-F49E-4181-B886-E5B12BEA8966', ipp.preconditions[0].comparison.restrictions[0].target_id
      assert_equal '64', ipp.preconditions[0].comparison.restrictions[0].range.low.value
      assert_equal 'a', ipp.preconditions[0].comparison.restrictions[0].range.low.unit
      assert_equal true, ipp.preconditions[0].comparison.restrictions[0].range.low.inclusive?
      assert_equal nil, ipp.preconditions[0].comparison.restrictions[0].range.high

      den = @doc.population_criteria_for_code('DENOM')
      assert_equal 1, den.preconditions.length
      assert_equal 'AND', den.preconditions[0].conjunction
      assert_equal '3CF573A8-34AE-408E-88D7-26A1016A140D', den.preconditions[0].comparison.data_criteria_id
      assert_equal 1, den.preconditions[0].comparison.restrictions.length
      assert_equal 'DURING', den.preconditions[0].comparison.restrictions[0].type
      assert_equal 'F8D5AD22-F49E-4181-B886-E5B12BEA8966', den.preconditions[0].comparison.restrictions[0].target_id
    
      num = @doc.population_criteria_for_code('NUMER')
      assert_equal 1, num.preconditions.length
      assert_equal 'AND', num.preconditions[0].conjunction
      assert_equal nil, num.preconditions[0].comparison
      assert_equal 2, num.preconditions[0].preconditions.length
      assert_equal 1, num.preconditions[0].restrictions.length
      assert_equal 'DURING', num.preconditions[0].restrictions[0].type
      assert_equal 'F8D5AD22-F49E-4181-B886-E5B12BEA8966', num.preconditions[0].restrictions[0].target_id
      assert_equal 0, num.preconditions[0].preconditions[0].preconditions.length
      assert_equal 'OR', num.preconditions[0].preconditions[0].conjunction
      assert_equal '10165EC8-53EE-4242-A20D-B1D21CE0DC73', num.preconditions[0].preconditions[0].comparison.data_criteria_id
      assert_equal 0, num.preconditions[0].preconditions[1].preconditions.length
      assert_equal 'OR', num.preconditions[0].preconditions[1].conjunction
      assert_equal '482902EC-E214-4FB4-8C5A-85A41250573C', num.preconditions[0].preconditions[1].comparison.data_criteria_id
    
      excl = @doc.population_criteria_for_code('DENEX')
      assert_equal 0, excl.preconditions.length
    end
  
    def test_data_criteria
      data_criteria = @doc.all_data_criteria
      assert_equal 4, data_criteria.length
    
      assert_equal 'Patient characteristic: birth date', data_criteria[0].title
      assert_equal '52A541D7-9C22-4633-8AEC-389611894672', data_criteria[0].id
      assert_equal '2.16.840.1.113883.3.464.10001.14', data_criteria[0].code_list_id
    
      assert_equal 'Encounter: encounter outpatient', data_criteria[1].title
      assert_equal '3CF573A8-34AE-408E-88D7-26A1016A140D', data_criteria[1].id
      assert_equal '2.16.840.1.113883.3.464.10001.49', data_criteria[1].code_list_id
    
      assert_equal 'Procedure performed: Pneumococcal Vaccination all ages', data_criteria[2].title
      assert_equal '482902EC-E214-4FB4-8C5A-85A41250573C', data_criteria[2].id
      assert_equal '2.16.840.1.113883.3.464.10001.143', data_criteria[2].code_list_id
    
      assert_equal 'Medication administered: Pneumococcal Vaccine all ages', data_criteria[3].title
      assert_equal '10165EC8-53EE-4242-A20D-B1D21CE0DC73', data_criteria[3].id
      assert_equal '2.16.840.1.113883.3.464.10001.430', data_criteria[3].code_list_id
    
      criteria = @doc.data_criteria('10165EC8-53EE-4242-A20D-B1D21CE0DC73')
      assert_equal 'Medication administered: Pneumococcal Vaccine all ages', criteria.title
      assert_equal '10165EC8-53EE-4242-A20D-B1D21CE0DC73', criteria.id
      assert_equal '2.16.840.1.113883.3.464.10001.430', criteria.code_list_id

      begin
        criteria = @doc.data_criteria('foo')
        assert false, "Should raise exception for unknown data criteria"
      rescue => detail
      end
    end
  
  end
end