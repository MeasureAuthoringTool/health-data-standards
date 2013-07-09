require_relative '../../../test_helper'
module HQMF1

  class NQF0002Test  < Test::Unit::TestCase
    def setup
      path = File.expand_path("../../../../fixtures/1.0/0002/0002.xml", __FILE__)
      @hqmf_contents = File.open(path).read
    end
  
    def test_to_json_0002
      hqmf = HQMF1::Document.new(@hqmf_contents)
      
      json = hqmf.to_json
      
      all_criteria = json[:data_criteria]
      refute_nil all_criteria
      all_criteria.length.must_equal 11
      all_criteria.length.must_equal hqmf.all_data_criteria.length
      
      ["PATIENT_CHARACTERISTIC_BIRTH_DATE","ENCOUNTER_ENCOUNTER_AMBULATORY_INCLUDING_PEDIATRICS","LABORATORY_TEST_PERFORMED_GROUP_A_STREPTOCOCCUS_TEST",
       "DIAGNOSIS_ACTIVE_PHARYNGITIS","MEDICATION_ACTIVE_PHARYNGITIS_ANTIBIOTICS","MEDICATION_DISPENSED_PHARYNGITIS_ANTIBIOTICS",
       "MEDICATION_ORDER_PHARYNGITIS_ANTIBIOTICS"].each do |data_criteria_key|
         refute_nil all_criteria[data_criteria_key]
      end
      
      check_data_criteria(all_criteria, "PATIENT_CHARACTERISTIC_BIRTH_DATE", {:id=>"E929E9CB-E788-47C3-A467-4AB732D0606C",:title=>"Patient Characteristic: birth date",:code_list_id=>"2.16.840.1.113883.3.560.100.4"})
      check_data_criteria(all_criteria, "ENCOUNTER_ENCOUNTER_AMBULATORY_INCLUDING_PEDIATRICS", {:id=>"CA71325F-084A-4F5A-9214-229D925F836D",:title=>"Encounter: Encounter ambulatory including pediatrics",:code_list_id=>"2.16.840.1.113883.3.464.10001.231"})
      check_data_criteria(all_criteria, "LABORATORY_TEST_PERFORMED_GROUP_A_STREPTOCOCCUS_TEST", {:id=>"AF9EE784-50CF-413F-9082-41A3330511A1",:title=>"Laboratory Test, Performed: Group A Streptococcus Test",:code_list_id=>"2.16.840.1.113883.3.464.10001.250",:status=>"performed"})
      check_data_criteria(all_criteria, "DIAGNOSIS_ACTIVE_PHARYNGITIS", {:id=>"F33D9CE9-A084-4BA1-AB0E-1CBEF3934C88",:title=>"Diagnosis, Active: pharyngitis",:code_list_id=>"2.16.840.1.113883.3.464.10001.369",:status=>"active"})
      check_data_criteria(all_criteria, "MEDICATION_ACTIVE_PHARYNGITIS_ANTIBIOTICS", {:id=>"6A3F288D-B565-4BE9-B6DD-DCDEAB2E6DD4",:title=>"Medication, Active: pharyngitis antibiotics",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:status=>"active"})
      check_data_criteria(all_criteria, "MEDICATION_DISPENSED_PHARYNGITIS_ANTIBIOTICS", {:id=>"C5239EC0-B769-476F-B79E-6927ED720A03",:title=>"Medication, Dispensed: pharyngitis antibiotics",:code_list_id=>"2.16.840.1.113883.3.464.10001.373"})
      check_data_criteria(all_criteria, "MEDICATION_ORDER_PHARYNGITIS_ANTIBIOTICS", {:id=>"B2EC949E-E9FD-4184-941E-F1F73470CB21",:title=>"Medication, Order: pharyngitis antibiotics",:code_list_id=>"2.16.840.1.113883.3.464.10001.373"})
      
      logic = json[:logic]
      refute_nil logic
      ["NUMER", "DENOM", "IPP"].each do |logic_key|
        refute_nil logic[logic_key]
      end
      
      population_criteria = logic["NUMER"][:preconditions]
      population_criteria.size.must_equal 2
      refute_nil population_criteria[0][:comparison]
      assert_nil(population_criteria[0][:preconditions])
      assert_nil(population_criteria[0][:restrictions])
      population_criteria[0][:comparison][:restrictions].size.must_equal 1

      refute_nil population_criteria[1][:comparison]
      assert_nil(population_criteria[1][:preconditions])
      assert_nil(population_criteria[1][:restrictions])
      population_criteria[1][:comparison][:restrictions].size.must_equal 1
      
      population_criteria[0][:comparison][:restrictions][0][:type].must_equal "EAS"
      assert population_criteria[0][:comparison][:restrictions][0][:negation]
      
      population_criteria = logic["IPP"][:preconditions]
      
      population_criteria.size.must_equal 2
      refute_nil population_criteria[0][:comparison]
      population_criteria[0][:conjunction].must_equal "AND"
      assert_nil(population_criteria[0][:preconditions])
      assert_nil(population_criteria[0][:restrictions])
      population_criteria[0][:comparison][:data_criteria_id].must_equal "E929E9CB-E788-47C3-A467-4AB732D0606C"
      population_criteria[0][:comparison][:title].must_equal "Patient Characteristic: birth date"
      population_criteria[0][:comparison][:restrictions].size.must_equal 1
      population_criteria[0][:comparison][:restrictions][0][:type].must_equal "SBS"
      assert !population_criteria[0][:comparison][:restrictions][0][:negation]
      population_criteria[0][:comparison][:restrictions][0][:target_id].must_equal "D578142D-F78F-4BF4-8194-82015DE21A7F"
      population_criteria[0][:comparison][:restrictions][0][:range][:low][:value].must_equal "2"
      population_criteria[0][:comparison][:restrictions][0][:range][:low][:unit].must_equal "a"
      population_criteria[0][:comparison][:restrictions][0][:range][:low][:inclusive?].must_equal true

      refute_nil population_criteria[1][:comparison]
      population_criteria[1][:conjunction].must_equal "AND"
      assert_nil(population_criteria[1][:preconditions])
      assert_nil(population_criteria[1][:restrictions])
      population_criteria[1][:comparison][:data_criteria_id].must_equal "E929E9CB-E788-47C3-A467-4AB732D0606C"
      population_criteria[1][:comparison][:title].must_equal "Patient Characteristic: birth date"
      population_criteria[1][:comparison][:restrictions].size.must_equal 1
      population_criteria[1][:comparison][:restrictions][0][:type].must_equal "SBS"
      population_criteria[1][:comparison][:restrictions][0][:target_id].must_equal "D578142D-F78F-4BF4-8194-82015DE21A7F"
      population_criteria[1][:comparison][:restrictions][0][:range][:high][:value].must_equal "17"
      population_criteria[1][:comparison][:restrictions][0][:range][:high][:unit].must_equal "a"
      population_criteria[1][:comparison][:restrictions][0][:range][:high][:inclusive?].must_equal true

      population_criteria = logic["DENOM"][:preconditions]

      population_criteria.size.must_equal 4
      
      population_criteria[0][:conjunction].must_equal "AND"
      population_criteria[0][:comparison][:data_criteria_id].must_equal "CA71325F-084A-4F5A-9214-229D925F836D"
      population_criteria[0][:comparison][:title].must_equal "Encounter: Encounter ambulatory including pediatrics"
      population_criteria[0][:comparison][:restrictions].size.must_equal 1
      population_criteria[0][:comparison][:restrictions][0][:type].must_equal "DURING"
      population_criteria[0][:comparison][:restrictions][0][:target_id].must_equal "D578142D-F78F-4BF4-8194-82015DE21A7F"

      assert !population_criteria[2][:negation]
      population_criteria[2][:preconditions][0][:conjunction].must_equal "OR"
      population_criteria[2][:preconditions][0][:comparison][:restrictions].size.must_equal 1
      population_criteria[2][:preconditions][0][:comparison][:restrictions][0][:type].must_equal "DURING"
      population_criteria[2][:preconditions][0][:comparison][:restrictions][0][:target_id].must_equal "D578142D-F78F-4BF4-8194-82015DE21A7F"

      assert population_criteria[3][:negation]
      
    end
    
    private 
    
    def check_data_criteria(all_criteria, key, values)
      data_criteria = all_criteria[key]
      data_criteria[:id].must_equal values[:id]
      data_criteria[:title].must_equal values[:title]
      data_criteria[:code_list_id].must_equal values[:code_list_id]
    end
    
  end
end
