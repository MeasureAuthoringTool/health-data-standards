require 'test_helper'
module GreenC32
  class ConditionImporterTest < MiniTest::Unit::TestCase

    def setup
      @condition = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/condition.xml'))
      @importer = HealthDataStandards::Import::GreenC32::ConditionImporter.instance
    end

    def test_extraction

      condition = @importer.import(@condition)
      refute_nil condition

      code_system = condition.codes.keys[0]
      assert_equal "SNOMED-CT", code_system
      assert_equal ["24930006"],  condition.codes[code_system]

      assert_equal Time.parse('2012-01-30T09:00:00').utc.to_i, condition.start_time
      assert_equal Time.parse('2012-01-31T09:00:00').utc.to_i, condition.end_time
      assert_equal "active", condition.status

      assert_equal "404684003", condition.type
    end
  end
end
