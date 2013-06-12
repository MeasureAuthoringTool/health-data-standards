require_relative '../../../test_helper'
module HQMF1
  
  # 0033 has patient characteristic gender, so it is used to verify the backfilling of the gender as part of the conversion

  class NQF0033Test  < Test::Unit::TestCase
    def setup
      path = File.expand_path("../../../../fixtures/1.0/0033/0033.xml", __FILE__)
      @hqmf_contents = File.open(path).read
      
      @codes = {
        "2.16.840.1.113883.3.560.100.2" => {"HL7"=>["F"]},
        "2.16.840.1.113883.1.11.1" => {"HL7" => ["M","F","UN"]},
        "2.16.840.1.113883.3.560.100.4" => {'LOINC'=>['21112-8']},
        # just to prevent debug output during test run
        "2.16.840.1.113883.3.464.3.11.2.11" => {},
        '2.16.840.1.113883.3.464.0003.96.02.0143' => {},
        '2.16.840.1.113883.3.464.0003.98.02.0034' => {},
        '2.16.840.1.113883.3.464.0003.10.02.0052' => {},
        '2.16.840.1.113883.3.464.0003.11.02.0006' => {},
        '2.16.840.1.113883.3.464.0003.10.02.0049' => {},
        '2.16.840.1.113883.3.464.0003.08.02.0017' => {},
        '2.16.840.1.113883.3.464.0003.11.02.0008' => {},
        '2.16.840.1.113883.3.464.0003.11.02.0009' => {},
        '2.16.840.1.113883.3.464.0003.11.02.0010' => {},
        '2.16.840.1.113883.3.526.03.393' => {},
        '2.16.840.1.113883.3.464.0003.96.02.0080' => {},
        '2.16.840.1.113883.3.464.0003.20.02.0004' => {},
        '2.16.840.1.113883.3.464.0003.20.02.0003' => {},
        '2.16.840.1.113883.3.464.0003.20.02.0002' => {},
        '2.16.840.1.113883.3.464.0003.20.02.0001' => {},
        '2.16.840.1.113883.3.464.0003.11.02.0012' => {},
        '2.16.840.1.113883.3.526.03.465' => {},
        '2.16.840.1.113883.3.464.0003.11.02.0007' => {},
        '2.16.840.1.113883.3.464.0003.10.02.0051' => {}
      }
      
    end
  
    def test_patient_criteria_backfill
      hqmf = HQMF::Parser.parse(@hqmf_contents, HQMF::Parser::HQMF_VERSION_1,@codes)
      
      gender_female = hqmf.data_criteria(hqmf.all_data_criteria.map(&:id).grep(/PatientCharacteristicGenderAdministrativeGenderFemale/).first)
      gender_female.value.code.must_equal "F"
      gender_female.value.system.must_equal "Administrative Sex"
      gender_female.value.type.must_equal "CD"
    end
      

    
  end
end
