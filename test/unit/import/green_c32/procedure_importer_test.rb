require 'test_helper'

module GreenC32
  class ProcedureImporterTest < MiniTest::Unit::TestCase

    def setup
      @procedure = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/procedure.xml'))
      @importer = HealthDataStandards::Import::GreenC32::ProcedureImporter.instance
    end

    def test_extraction
      procedure = @importer.import(@procedure)
      refute_nil procedure

      code_system = procedure.codes.keys[0]

      assert_equal "CPT", code_system
      assert_equal ["30400"],  procedure.codes[code_system]
      assert_equal Time.parse('2012-01-30T09:00:00').utc.to_i, procedure.start_time
      assert_equal Time.parse('2012-01-31T09:00:00').utc.to_i, procedure.end_time

      assert_equal "completed", procedure.status
      
      code_system = procedure.site.keys[0]
      assert_equal "SNOMED-CT", code_system
      assert_equal ["42650002"],  procedure.site[code_system]
    end
  end 
end
