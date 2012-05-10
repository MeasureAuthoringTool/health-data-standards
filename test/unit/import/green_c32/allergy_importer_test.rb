require 'test_helper'

module GreenC32
  class AllergyImporterTest < MiniTest::Unit::TestCase
    
    def setup
      @allergy = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/allergy.xml'))
      @importer = HealthDataStandards::Import::GreenC32::AllergyImporter.instance
    end
    
    def test_extraction
      allergy = @importer.import(@allergy)
      refute_nil allergy
      assert allergy.is_a?(Allergy)
      refute_nil allergy.type
      assert allergy.codes.keys.include?("FDA")
      refute_nil allergy.severity
      refute_nil allergy.reaction
    end
    
  end
end