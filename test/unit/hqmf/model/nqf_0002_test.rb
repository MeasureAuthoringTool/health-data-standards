require_relative '../../../test_helper'
module HQMFModel

  class NQF0002Test  < Test::Unit::TestCase
    def setup
      path = File.expand_path("../../../../fixtures/1.0/0002/0002.xml", __FILE__)
      @hqmf_contents = File.open(path).read
    end
  
    def test_to_json_0002
      
      codes = {
        "2.16.840.1.113883.3.560.100.2" => {"HL7"=>["F"]},
        "2.16.840.1.113883.1.11.1" => {"HL7" => ["M","F","UN"]},
        "2.16.840.1.113883.3.560.100.4" => {'LOINC'=>['21112-8']},
        '2.16.840.1.113883.3.464.10001.373' => {},
        '2.16.840.1.113883.3.464.10001.231' => {},
        '2.16.840.1.113883.3.464.10001.250' => {},
        '2.16.840.1.113883.3.464.10001.369' => {},
        '2.16.840.1.114222.4.11.836' => {},
        '2.16.840.1.114222.4.11.837' => {},
        '2.16.840.1.113883.221.5' => {}
      }
      
      hqmf = HQMF::Parser.parse(@hqmf_contents, HQMF::Parser::HQMF_VERSION_1, codes)
      
      json = hqmf.to_json
      
      json[:id].must_equal "0002"
      json[:title].must_equal "Appropriate Testing for Children with Pharyngitis"
      refute_nil json[:description]
            
      all_criteria = json[:data_criteria]
      refute_nil all_criteria
      all_criteria.length.must_equal 30
      all_criteria.length.must_equal hqmf.all_data_criteria.length

      [:PatientCharacteristicBirthDate, :EncounterEncounterAmbulatoryIncludingPediatrics, :LaboratoryTestPerformedGroupAStreptococcusTest,
       :DiagnosisActivePharyngitis, :MedicationActivePharyngitisAntibiotics, :MedicationDispensedPharyngitisAntibiotics,
       :MedicationOrderPharyngitisAntibiotics].each do |data_criteria_key|
         assert all_criteria.keys.grep(/#{data_criteria_key.to_s}/).size > 0, "Could not find any data criteria for #{data_criteria_key}"
      end
      
      expected_dc = {}
      expected_dc[:PatientCharacteristicBirthDate] = []
      expected_dc[:EncounterEncounterAmbulatoryIncludingPediatrics] = []
      expected_dc[:LaboratoryTestPerformedGroupAStreptococcusTest] = []
      expected_dc[:DiagnosisActivePharyngitis] = []
      expected_dc[:MedicationActivePharyngitisAntibiotics] = []
      expected_dc[:MedicationDispensedPharyngitisAntibiotics] = []
      expected_dc[:MedicationOrderPharyngitisAntibiotics] = []
      expected_dc[:GROUP_SBS] = []
      
      
      expected_dc[:MedicationDispensedPharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Dispensed: pharyngitis antibiotics",
         :standard_category=>"medication",:qds_data_type=>"medication_dispensed",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"dispensed", :negation=>false}
         
      expected_dc[:MedicationOrderPharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Order: pharyngitis antibiotics",
         :standard_category=>"medication",:qds_data_type=>"medication_order",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"ordered", :negation=>false}
         
      expected_dc[:MedicationActivePharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Active: pharyngitis antibiotics",
         :standard_category=>"medication",:qds_data_type=>"medication_active",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"active", :negation=>false}
         
      expected_dc[:EncounterEncounterAmbulatoryIncludingPediatrics] << {:title=>"Encounter ambulatory including pediatrics",:description=>"Encounter: Encounter ambulatory including pediatrics", :negation=>false,
         :standard_category=>"encounter",:qds_data_type=>"encounter",:code_list_id=>"2.16.840.1.113883.3.464.10001.231",:type=>:encounters,:patient_api_function=>:encounters,
         :temporal_references=>
          [{:type=>"DURING", :reference=>"MeasurePeriod"},
           {:type=>"SBS",:reference=>"GROUP_SBS",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"d", :value=>"3", inclusive?:true, derived?:false}}}]}
           
      expected_dc[:GROUP_SBS] << {:title=>"EncounterEncounterAmbulatoryIncludingPediatrics<=3 d",
         :description=>"", :negation=>false,
         :standard_category=>"",:qds_data_type=>"",
         :children_criteria=>["MedicationDispensedPharyngitisAntibiotics","MedicationOrderPharyngitisAntibiotics","MedicationActivePharyngitisAntibiotics"],
         :type=>:derived, :patient_api_function=>nil}
         
      expected_dc[:LaboratoryTestPerformedGroupAStreptococcusTest] << {:title=>"Group A Streptococcus Test",:description=>"Laboratory Test, Performed: Group A Streptococcus Test", :negation=>false,
         :standard_category=>"laboratory_test",:qds_data_type=>"laboratory_test",:code_list_id=>"2.16.840.1.113883.3.464.10001.250",:type=>:laboratory_tests, :patient_api_function=>:laboratoryTests,:status=>"performed",
         :temporal_references=>[{:type=>"SBE",:reference=>"EncounterEncounterAmbulatoryIncludingPediatrics",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"d", :value=>"3", inclusive?:true, derived?:false}}}]}
          
      expected_dc[:MedicationDispensedPharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Dispensed: pharyngitis antibiotics", :negation=>false,
         :standard_category=>"medication",:qds_data_type=>"medication_dispensed",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"dispensed"}
         
      expected_dc[:MedicationOrderPharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Order: pharyngitis antibiotics", :negation=>false,
          :standard_category=>"medication",:qds_data_type=>"medication_order",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"ordered"}
          
      expected_dc[:MedicationActivePharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Active: pharyngitis antibiotics", :negation=>false,
          :standard_category=>"medication",:qds_data_type=>"medication_active",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"active"}
          
      expected_dc[:EncounterEncounterAmbulatoryIncludingPediatrics] << {:title=>"Encounter ambulatory including pediatrics",:description=>"Encounter: Encounter ambulatory including pediatrics", :negation=>false,
          :standard_category=>"encounter",:qds_data_type=>"encounter",:code_list_id=>"2.16.840.1.113883.3.464.10001.231",:type=>:encounters,:patient_api_function=>:encounters,
          :temporal_references=>
           [{:type=>"DURING", :reference=>"MeasurePeriod"},
            {:type=>"SBS",:reference=>"GROUP_SBS",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"d", :value=>"3", inclusive?:true, derived?:false}}}]}
            
      expected_dc[:GROUP_SBS] << {:title=>"EncounterEncounterAmbulatoryIncludingPediatrics<=3 d",
          :description=>"", :negation=>false,
          :standard_category=>"",:qds_data_type=>"",
          :children_criteria=>["MedicationDispensedPharyngitisAntibiotics","MedicationOrderPharyngitisAntibiotics","MedicationActivePharyngitisAntibiotics"],
          :type=>:derived, :patient_api_function=>nil}
          
      expected_dc[:LaboratoryTestPerformedGroupAStreptococcusTest] << {:title=>"Group A Streptococcus Test",:description=>"Laboratory Test, Performed: Group A Streptococcus Test", :negation=>false,
          :standard_category=>"laboratory_test",:qds_data_type=>"laboratory_test",:code_list_id=>"2.16.840.1.113883.3.464.10001.250",:type=>:laboratory_tests, :patient_api_function=>:laboratoryTests,:status=>"performed",
          :temporal_references=>
           [{:type=>"SAE",:reference=>"EncounterEncounterAmbulatoryIncludingPediatrics",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"d", :value=>"3", inclusive?:true, derived?:false}}}]}
           
      expected_dc[:EncounterEncounterAmbulatoryIncludingPediatrics] << {:title=>"Encounter ambulatory including pediatrics",:description=>"Encounter: Encounter ambulatory including pediatrics", :negation=>false,
          :standard_category=>"encounter",:qds_data_type=>"encounter",:code_list_id=>"2.16.840.1.113883.3.464.10001.231",:type=>:encounters,:patient_api_function=>:encounters,
          :temporal_references=>[{:type=>"DURING", :reference=>"MeasurePeriod"}]}
          
      expected_dc[:EncounterEncounterAmbulatoryIncludingPediatrics] << {:title=>"Encounter ambulatory including pediatrics",:description=>"Encounter: Encounter ambulatory including pediatrics", :negation=>false,
          :standard_category=>"encounter",:qds_data_type=>"encounter",:code_list_id=>"2.16.840.1.113883.3.464.10001.231",:type=>:encounters,:patient_api_function=>:encounters,
          :temporal_references=>[{:type=>"DURING", :reference=>"MeasurePeriod"}]}
          
      expected_dc[:DiagnosisActivePharyngitis] << {:title=>"pharyngitis",:description=>"Diagnosis, Active: pharyngitis", :negation=>false,
           :standard_category=>"diagnosis_condition_problem",:qds_data_type=>"diagnosis_active",:code_list_id=>"2.16.840.1.113883.3.464.10001.369",:type=>:conditions, :patient_api_function=>:allProblems,:status=>"active",
           :temporal_references=>
            [{:type=>"DURING",:reference=>"EncounterEncounterAmbulatoryIncludingPediatrics"}]}
            
      expected_dc[:MedicationDispensedPharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Dispensed: pharyngitis antibiotics", :negation=>false,
           :standard_category=>"medication",:qds_data_type=>"medication_dispensed",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"dispensed"}
           
      expected_dc[:MedicationOrderPharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Order: pharyngitis antibiotics", :negation=>false,
           :standard_category=>"medication",:qds_data_type=>"medication_order",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"ordered"}
           
      expected_dc[:MedicationActivePharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Active: pharyngitis antibiotics", :negation=>false,
           :standard_category=>"medication",:qds_data_type=>"medication_active",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"active"}
           
      expected_dc[:EncounterEncounterAmbulatoryIncludingPediatrics] << {:title=>"Encounter ambulatory including pediatrics",:description=>"Encounter: Encounter ambulatory including pediatrics",
           :standard_category=>"encounter",:qds_data_type=>"encounter",:code_list_id=>"2.16.840.1.113883.3.464.10001.231",:type=>:encounters,:patient_api_function=>:encounters, :negation=>false,
           :temporal_references=>
            [{:type=>"DURING", :reference=>"MeasurePeriod"},
             {:type=>"SBS",:reference=>"GROUP_SBS",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"d", :value=>"3", inclusive?:true, derived?:false}}}]}
             
      expected_dc[:GROUP_SBS] << {:title=>"EncounterEncounterAmbulatoryIncludingPediatrics<=3 d", :negation=>false,
           :description=>"",
           :standard_category=>"",:qds_data_type=>"",
           :children_criteria=>["MedicationDispensedPharyngitisAntibiotics","MedicationOrderPharyngitisAntibiotics","MedicationActivePharyngitisAntibiotics"],
           :type=>:derived, :patient_api_function=>nil}
           
      expected_dc[:EncounterEncounterAmbulatoryIncludingPediatrics] << {:title=>"Encounter ambulatory including pediatrics",:description=>"Encounter: Encounter ambulatory including pediatrics", :negation=>false,
           :standard_category=>"encounter",:qds_data_type=>"encounter",:code_list_id=>"2.16.840.1.113883.3.464.10001.231",:type=>:encounters,:patient_api_function=>:encounters,
           :temporal_references=>[{:type=>"DURING", :reference=>"MeasurePeriod"}]}
           
      expected_dc[:MedicationDispensedPharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Dispensed: pharyngitis antibiotics", :negation=>false,
            :standard_category=>"medication",:qds_data_type=>"medication_dispensed",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"dispensed",
            :temporal_references=>[{:type=>"SBS",:reference=>"EncounterEncounterAmbulatoryIncludingPediatrics",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"d", :value=>"30", inclusive?:true, derived?:false}}}]}
            
      expected_dc[:MedicationOrderPharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Order: pharyngitis antibiotics", :negation=>false,
            :standard_category=>"medication",:qds_data_type=>"medication_order",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"ordered",
            :temporal_references=>[{:type=>"SBS",:reference=>"EncounterEncounterAmbulatoryIncludingPediatrics",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"d", :value=>"30", inclusive?:true, derived?:false}}}]}
            
      expected_dc[:MedicationActivePharyngitisAntibiotics] << {:title=>"pharyngitis antibiotics",:description=>"Medication, Active: pharyngitis antibiotics", :negation=>false,
            :standard_category=>"medication",:qds_data_type=>"medication_active",:code_list_id=>"2.16.840.1.113883.3.464.10001.373",:type=>:medications,:patient_api_function=>:allMedications,:status=>"active",
            :temporal_references=>[{:type=>"SBS",:reference=>"EncounterEncounterAmbulatoryIncludingPediatrics",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"d", :value=>"30", inclusive?:true, derived?:false}}}]}
            
      age_codes = {'LOINC'=>['21112-8']}      
      expected_dc[:PatientCharacteristicBirthDate] << {:title=>"birth date",:description=>"Patient Characteristic: birth date", :negation=>false,
            :standard_category=>"individual_characteristic",:qds_data_type=>"individual_characteristic",:code_list_id=>"2.16.840.1.113883.3.560.100.4",:property=>:birthtime,:inline_code_list=>age_codes,:type=>:characteristic, :patient_api_function=>nil,
            :temporal_references=>[{:type=>"SBS",:reference=>"MeasurePeriod",:range=>{:type=>'IVL_PQ', :low=>{:type=>'PQ', :unit=>"a", :value=>"2", inclusive?:true, derived?:false}}}]}
            
      expected_dc[:PatientCharacteristicBirthDate] << {:title=>"birth date",:description=>"Patient Characteristic: birth date", :negation=>false,
            :standard_category=>"individual_characteristic",:qds_data_type=>"individual_characteristic",:code_list_id=>"2.16.840.1.113883.3.560.100.4",:property=>:birthtime,:inline_code_list=>age_codes,:type=>:characteristic, :patient_api_function=>nil,
            :temporal_references=>[{:type=>"SBS",:reference=>"MeasurePeriod",:range=>{:type=>'IVL_PQ', :high=>{:type=>'PQ', :unit=>"a", :value=>"17", inclusive?:true, derived?:false}}}]}
       
      
expected_dc[:PatientCharacteristicGenderGender] =[
  {:title=>"Gender",
   :description=>"Patient Characteristic Gender: Gender",
   :standard_category=>"individual_characteristic",
   :qds_data_type=>"individual_characteristic",
   :code_list_id=>"2.16.840.1.113883.1.11.1",
   :property=>:gender,
   :type=>:characteristic,
   :definition=>"patient_characteristic_gender",
   :hard_status=>false,
   :negation=>false,
   :source_data_criteria=>"PatientCharacteristicGenderGender",
   :value=>{:type=>"CD", :system=>"Administrative Sex", :code=>"M"}}]

expected_dc[:PatientCharacteristicRaceRace] = [
  {:title=>"Race",
   :description=>"Patient Characteristic Race: Race",
   :standard_category=>"individual_characteristic",
   :qds_data_type=>"individual_characteristic",
   :code_list_id=>"2.16.840.1.114222.4.11.836",
   :property=>:race,
   :type=>:characteristic,
   :definition=>"patient_characteristic_race",
   :hard_status=>false,
   :negation=>false,
   :inline_code_list=>{},
   :source_data_criteria=>"PatientCharacteristicRaceRace"}]

expected_dc[:PatientCharacteristicEthnicityEthnicity] = [
  {:title=>"Ethnicity",
   :description=>"Patient Characteristic Ethnicity: Ethnicity",
   :standard_category=>"individual_characteristic",
   :qds_data_type=>"individual_characteristic",
   :code_list_id=>"2.16.840.1.114222.4.11.837",
   :property=>:ethnicity,
   :type=>:characteristic,
   :definition=>"patient_characteristic_ethnicity",
   :hard_status=>false,
   :negation=>false,
   :inline_code_list=>{},
   :source_data_criteria=>"PatientCharacteristicEthnicityEthnicity"}]

expected_dc[:PatientCharacteristicPayerPayer] = [
  {:title=>"Payer",
   :description=>"Patient Characteristic Payer: Payer",
   :standard_category=>"individual_characteristic",
   :qds_data_type=>"individual_characteristic",
   :code_list_id=>"2.16.840.1.113883.221.5",
   :property=>:payer,
   :type=>:characteristic,
   :definition=>"patient_characteristic_payer",
   :hard_status=>false,
   :negation=>false,
   :inline_code_list=>{},
   :source_data_criteria=>"PatientCharacteristicPayerPayer"}]







      all_criteria.keys.each do |key|
        orig_key = key
        key = key.to_s.gsub(/_precondition_\d+.*/, '').to_sym
        key = key.to_s.gsub(/_CHILDREN_\d+.*/, '').to_sym
        found_matching = false

        if expected_dc[key]
          expected_dc[key].each do |expected|
            data_criteria = all_criteria[orig_key]
            
            model = hqmf.data_criteria(orig_key.to_s)
            data_criteria.merge! ({:standard_category=>model.standard_category,:qds_data_type=>model.qds_data_type,:type=>model.type, :patient_api_function=>model.patient_api_function,:status=>model.status})
            data_criteria[:property] = model.property unless model.property.nil?
            
            found_matching ||= data_criteria_matches(expected, data_criteria)
          end
        end
        assert found_matching, "could not find matching expected criteria for #{orig_key}"
      end
      
      
      logic = json[:population_criteria]
      refute_nil logic
      [:NUMER, :DENOM, :IPP].each do |logic_key|
        refute_nil logic[logic_key]
      end
      
      population_criteria = logic[:NUMER]
      population_criteria[:conjunction?].must_equal true
      population_criteria[:preconditions].size.must_equal 1

      numerator = 
      {conjunction?:true,
       title: 'Numerator',
       type: 'NUMER',
       :preconditions=>
        [{:preconditions=>
           [{:reference=>"LaboratoryTestPerformedGroupAStreptococcusTest"}, 
           {:reference=>"LaboratoryTestPerformedGroupAStreptococcusTest"}],
          :conjunction_code=>"allTrue"},
        ],
        hqmf_id: '1E223193-25A4-4464-9D7E-89B5DCBFC513'}
      
      diff = numerator.diff_hash(population_criteria,true)
      assert diff.empty?, "differences: #{diff.to_json}"
      
      population_criteria = logic[:IPP]
      
      ipp = 
      {
        conjunction?:true,
        title: 'Initial Patient Population',
        type: 'IPP',
        :preconditions=>[
          {:preconditions=>[{:reference=>"PatientCharacteristicBirthDate"}, {:reference=>"PatientCharacteristicBirthDate"}],:conjunction_code=>"allTrue"}],
          hqmf_id: '45A1DEFB-0271-4277-B84C-F6DED6B6FD8E'
      }
      
      diff = ipp.diff_hash(population_criteria,true)
      assert diff.empty?, "differences: #{diff.to_json}"

      population_criteria = logic[:DENOM]
      
      denom = 
      {conjunction?:true,
        title: 'Denominator',
        type: 'DENOM',
       :preconditions=>
        [{:preconditions=>
           [{:reference=>"EncounterEncounterAmbulatoryIncludingPediatrics"},
            {:reference=>"DiagnosisActivePharyngitis"},
            {:preconditions=>
              [{:reference=>"EncounterEncounterAmbulatoryIncludingPediatrics"}],
             :conjunction_code=>"atLeastOneTrue"},
            {:preconditions=>
              [{:preconditions=>
                 [{:reference=>"MedicationDispensedPharyngitisAntibiotics"},
                  {:reference=>"MedicationOrderPharyngitisAntibiotics"},
                  {:reference=>"MedicationActivePharyngitisAntibiotics"}],
                :conjunction_code=>"atLeastOneTrue"}],
             :conjunction_code=>"atLeastOneTrue",
             :negation=>true}],
          :conjunction_code=>"allTrue"}],
          hqmf_id: '66D82442-4198-44A1-A489-EE9F819F1636'}
      
      diff = denom.diff_hash(population_criteria,true)
      assert diff.empty?, "differences: #{diff.to_json}"
    end
    
    def test_json_round_trip
       
      codes = {
        "2.16.840.1.113883.3.560.100.2" => {"HL7"=>["F"]},
        "2.16.840.1.113883.1.11.1" => {"HL7" => ["M","F","UN"]},
        "2.16.840.1.113883.3.560.100.4" => {'LOINC'=>['21112-8']},
        '2.16.840.1.113883.3.464.10001.373' => {},
        '2.16.840.1.113883.3.464.10001.231' => {},
        '2.16.840.1.113883.3.464.10001.250' => {},
        '2.16.840.1.113883.3.464.10001.369' => {},
        '2.16.840.1.114222.4.11.836' => {},
        '2.16.840.1.114222.4.11.837' => {},
        '2.16.840.1.113883.221.5' => {}
      }
      
                
      hqmf = HQMF::Parser.parse(@hqmf_contents, HQMF::Parser::HQMF_VERSION_1, codes)
      
      json = hqmf.to_json
      
      model = HQMF::Document.from_json(JSON.parse(json.to_json))
      
      json2 = model.to_json
      diff = json.diff_hash(json2)
      assert diff.empty?, "differences: #{diff.to_json}"
    
    end

    def test_finders
      
      
      codes = {
        "2.16.840.1.113883.3.560.100.2" => {"HL7"=>["F"]},
        "2.16.840.1.113883.1.11.1" => {"HL7" => ["M","F","UN"]},
        "2.16.840.1.113883.3.560.100.4" => {'LOINC'=>['21112-8']},
        '2.16.840.1.113883.3.464.10001.373' => {},
        '2.16.840.1.113883.3.464.10001.231' => {},
        '2.16.840.1.113883.3.464.10001.250' => {},
        '2.16.840.1.113883.3.464.10001.369' => {},
        '2.16.840.1.114222.4.11.836' => {},
        '2.16.840.1.114222.4.11.837' => {},
        '2.16.840.1.113883.221.5' => {}
      }
      
                
      model = HQMF::Parser.parse(@hqmf_contents, HQMF::Parser::HQMF_VERSION_1, codes)
      
      model.all_data_criteria.size.must_equal 30
      
      model.all_data_criteria.map(&:id).each do |key|
        
        refute_nil model.data_criteria(key)
      end

      model.all_population_criteria.size.must_equal 4
      
      ["NUMER", "DENOM", "IPP"].each do |key|
        refute_nil model.population_criteria(key)
      end
    
    end
    
    def data_criteria_matches(expected, actual)
      matches = true
      
      matches &&= actual[:description] == expected[:description]
      matches &&= expected[:standard_category] == actual[:standard_category]
      matches &&= expected[:qds_data_type] == actual[:qds_data_type]
      matches &&= expected[:code_list_id] == actual[:code_list_id]
      matches &&= expected[:property] == actual[:property]
      matches &&= expected[:type] == actual[:type]
      matches &&= expected[:status] == actual[:status]
      matches &&= expected[:value] == actual[:value]
      matches &&= expected[:effective_time] == actual[:effective_time]
      matches &&= expected[:inline_code_list] == actual[:inline_code_list]
      matches &&= expected[:negation] == actual[:negation]
      
      return false if actual[:children_criteria].nil? != expected[:children_criteria].nil?
       
      actual[:children_criteria].each do |criteria_key|
        key = criteria_key.to_s.gsub(/_precondition_\d+.*/, '')
        matches &&= expected[:children_criteria].include? key
      end unless (actual[:children_criteria] == expected[:children_criteria])

      
      return false if actual[:temporal_references].nil? != expected[:temporal_references].nil?
      
      actual[:temporal_references].each do |reference|
        found = false
        expected[:temporal_references].each do |expected_ref|
          this_matches = true
          this_matches &&= expected_ref[:type] == reference[:type]
          this_matches &&= expected_ref[:range] == reference[:range]
          key1 = reference[:reference].to_s.gsub(/_precondition_\d+.*/, '')
          key2 = reference[:reference].to_s.gsub(/_CHILDREN_\d+.*/, '')
          this_matches &&= (expected_ref[:reference] == key1 || expected_ref[:reference] == key2)
          found ||= this_matches
        end
        matches &&= found
      end unless (actual[:temporal_references] == expected[:temporal_references])

      
      return false if actual[:subset_operators].nil? != expected[:subset_operators].nil?
      
      actual[:subset_operators].each do |reference|
        found = false
        expected[:subset_operators].each do |expeced_ref|
          this_matches = true
          this_matches &&= expected_ref[:type] == reference[:type]
          this_matches &&= expected_ref[:value] == reference[:value]
          found ||= this_matches
        end
        matches &&= found
      end unless (actual[:subset_operators] == expected[:subset_operators])

      
      matches
    end
    
    
    def test_all_code_set_oids
      hqmf = HQMF::Parser.parse(@hqmf_contents, HQMF::Parser::HQMF_VERSION_1, nil)
      oids = hqmf.all_code_set_oids
      oids.length.must_equal 9
    end
    
  end
end
