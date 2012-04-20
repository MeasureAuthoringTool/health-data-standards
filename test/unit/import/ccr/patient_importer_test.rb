require 'test_helper'

module CCR
  class PatientImporterTest < MiniTest::Unit::TestCase
    
    def setup
      @ccr = Nokogiri::XML(File.new('test/fixtures/ccr_fragments/sample_ccr.xml'))
      @ccr.root.add_namespace_definition('ccr', 'urn:astm-org:CCR')
      
      @ccr2 = Nokogiri::XML(File.new('test/fixtures/ccr_fragments/patient_with_providers.xml'))
      @ccr2.root.add_namespace_definition('ccr', 'urn:astm-org:CCR')

      @pi = HealthDataStandards::Import::CCR::PatientImporter.instance
    end
    
    def test_parse_first_document
   
      record = @pi.parse_ccr(@ccr)
      assert_equal 3, record.conditions.size
      assert_equal 2, record.vital_signs.size
      assert_equal 4, record.encounters.size
      assert_equal 2, record.procedures.size
      assert_equal 7, record.medications.size
      assert_equal "2110-5", record.race["code"]
      assert_equal "2110-5", record.ethnicity["code"]
    end
    
    def test_parse_second_document
      record = @pi.parse_ccr(@ccr2)

      assert_equal 1, record.conditions.size
      assert_equal 2, record.medications.size
      assert_equal 5, record.procedures.size
      assert_equal 1, record.encounters.size
      
      # ensure no uncoded data is being imported
      assert_equal 0, record.vital_signs.size
      assert_equal 0, record.social_history.size
      assert_equal 0, record.allergies.size
      assert_equal 0, record.immunizations.size
      


    end

  end
end
