require 'test_helper'
require 'pry'

module GreenC32
  class EntryTest < MiniTest::Unit::TestCase

    def setup
      collection_fixtures('records', '_id')
      @record = Record.first
    end

    #-------------------------------------------------------------------------------

    def test_results
      result = @record.results.first
      result.reference_range = "< 500ml"

      xml = HealthDataStandards::Export::GreenC32::Entry.export(result, :result)
      
      doc = Nokogiri::XML(xml)
      
      result_instance = HealthDataStandards::Import::GreenC32::ResultImporter.instance
      
      result2 = result_instance.import(doc)
      
      assert_equal result.value,            result2.value
      assert_equal result.description,      result2.description
      assert_equal result.codes,            result2.codes
      assert_equal result.time,             result2.time
      assert_equal result.status,           result2.status
      assert_equal result.reference_range,  result2.reference_range
    end

    #-------------------------------------------------------------------------------
  
    def test_vital_signs
      vital_sign = FactoryGirl.build(:vital_sign)
      
      xml = HealthDataStandards::Export::GreenC32::Entry.export(vital_sign, :vital_sign)
      
      doc = Nokogiri::XML(xml)
      
      vital_sign_instance = HealthDataStandards::Import::GreenC32::VitalSignImporter.instance
      
      vital_sign2 = vital_sign_instance.import(doc)

      assert_equal vital_sign.value,        vital_sign2.value
      assert_equal vital_sign.description,  vital_sign2.description
      assert_equal vital_sign.codes,        vital_sign2.codes
      assert_equal vital_sign.time,         vital_sign2.time
      assert_equal vital_sign.status,       vital_sign2.status
    end
    
    #-------------------------------------------------------------------------------
  
    def test_conditions
      condition = FactoryGirl.build(:condition)
      refute_nil condition
  
      xml = HealthDataStandards::Export::GreenC32::Entry.export(condition, :condition)
  
      doc = Nokogiri::XML(xml)
      doc.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
  
      condition_instance = HealthDataStandards::Import::GreenC32::ConditionImporter.instance
  
      condition2 = condition_instance.import(doc)

      assert_equal condition.cause_of_death,  condition2.cause_of_death
      assert_equal condition.start_time,      condition2.start_time
      assert_equal condition.end_time,        condition2.end_time
      assert_equal condition.codes,           condition2.codes
      assert_equal condition.type,            condition2.type\
      
    end
  
    #-------------------------------------------------------------------------------
  
    def test_procedures
      procedure = FactoryGirl.build(:procedure)
      refute_nil procedure
      
      xml = HealthDataStandards::Export::GreenC32::Entry.export(procedure, :procedure)

      doc = Nokogiri::XML(xml)
      doc.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
  
      procedure_instance = HealthDataStandards::Import::GreenC32::ProcedureImporter.instance
  
      procedure2 = procedure_instance.import(doc)
  
      assert_equal procedure.start_time,  procedure2.start_time
      assert_equal procedure.end_time,    procedure2.end_time
      assert_equal procedure.codes,       procedure2.codes
      assert_equal procedure.site,        procedure2.site
    end
    
    #-------------------------------------------------------------------------------
    
    def test_encounters
      record = FactoryGirl.create(:record)
      encounter = record.encounters.first
      refute_nil encounter
      
      xml = HealthDataStandards::Export::GreenC32::Entry.export(encounter, :encounter) 
    end
    
    #-------------------------------------------------------------------------------
    
    def test_medications
      med = FactoryGirl.build(:medication)
    
      refute_nil med
      
      xml = HealthDataStandards::Export::GreenC32::Entry.export(med, :medication)
    end
    
    #-------------------------------------------------------------------------------
    
    def test_allergies
      allergy = FactoryGirl.build(:allergy)
    
      refute_nil allergy
      
      xml = HealthDataStandards::Export::GreenC32::Entry.export(allergy, :allergy)
    end
    
    def test_immunizations
      im = FactoryGirl.build(:immunization)
      
      xml = HealthDataStandards::Export::GreenC32::Entry.export(im, :immunization)
    end
    
    def test_support
      s = FactoryGirl.build(:support)
      
      xml = HealthDataStandards::Export::GreenC32::Entry.export(s, :support)
    end
    
    def test_ad
      ad = FactoryGirl.build(:advance_directive)
      xml = HealthDataStandards::Export::GreenC32::Entry.export(ad, :advance_directive)
    end
    
    
    def test_me
      me = FactoryGirl.build(:medical_equipment)
      xml = HealthDataStandards::Export::GreenC32::Entry.export(me, :medical_equipment)
    end
    
    def test_entry
      e = FactoryGirl.build(:entry)
      xml = HealthDataStandards::Export::GreenC32::Entry.export(e, :entry)
    end
    
    def test_care_goals
      pr = FactoryGirl.build(:procedure)
      r = FactoryGirl.build(:lab_result)
      xml = HealthDataStandards::Export::GreenC32::Entry.export(pr, :care_goal)
      xml2 = HealthDataStandards::Export::GreenC32::Entry.export(r, :care_goal)
    end
  
  end
  
end

