require 'test_helper'

module GreenC32
  class MedicalEquipmentImporterTest < MiniTest::Unit::TestCase
    
    def setup
      @equipment = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/medical_equipment.xml'))
      @importer = HealthDataStandards::Import::GreenC32::MedicalEquipmentImporter.instance
    end
    
    def test_extraction
      me = @importer.import(@equipment)
      assert_equal 5.0, me.value["scalar"], me.value
      assert_equal "strips", me.value["unit"], me.value
      refute_nil me.manufacturer
      assert_equal "Medical Supply Co.", me.manufacturer
    end
    
  end
end