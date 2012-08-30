require 'test_helper'

module GreenC32
  class MeasureImporterTest < MiniTest::Unit::TestCase
    
    def setup
      @medication = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/medication.xml'))
      @importer = HealthDataStandards::Import::GreenC32::MedicationImporter.instance
    end
    
    def test_extraction
      result = @importer.import(@medication)
      assert_equal({"RxNorm" => ["122"]}, result.codes)
      assert_equal({"NCI Thesaurus" => ["C38675"]}, result.route)
      assert_equal({"SNOMED-CT" => ["12354-2"]}, result.site)
      assert_equal({"scalar" => 2.0, "units" => "pills"}, result.dose)
      assert_equal({"scalar" => 1.0, "units" => "2h"}, result.administration_timing['period'])
      assert_equal({"scalar" => 5.0, "units" => "pills"}, result.dose_restriction["numerator"])
      assert_equal({"scalar" => 1.0, "units" => "day"}, result.dose_restriction["denominator"])
      refute_nil result.fulfillment_history.first
    end
  end
end