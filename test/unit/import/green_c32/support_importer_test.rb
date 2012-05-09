require 'test_helper'
module GreenC32
  class SupportImporterTest < MiniTest::Unit::TestCase
    def setup
      @support = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/support.xml'))
      @si = HealthDataStandards::Import::GreenC32::SupportImporter.instance
    end
    
    def test_extraction
      support = @si.import(@support)
      assert support.valid?
      assert_equal "Tully", support.mothers_maiden_name
      assert_equal "Stark", support.family_name
      assert_equal "Robert", support.given_name
      assert_equal "Mr.", support.title
      assert_equal "Next of Kin", support.type
      assert_equal "Son", support.relationship

    end
  end
end