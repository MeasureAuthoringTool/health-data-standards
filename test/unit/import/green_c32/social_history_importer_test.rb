require 'test_helper'
module GreenC32
  class SocialHistoryImporterTest < MiniTest::Unit::TestCase
    def setup
      @sh = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/social_history.xml'))
      @shi = HealthDataStandards::Import::GreenC32::SocialHistoryImporter.instance
    end
    
    def test_extraction
      result = @shi.import(@sh)
      refute_nil result
      assert result.is_a?(Entry)
    end
  end
end