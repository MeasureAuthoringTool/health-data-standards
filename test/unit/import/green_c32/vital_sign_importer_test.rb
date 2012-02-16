# require 'test_helper'
# 
# class VitalSignImporterTest < MiniTest::Unit::TestCase
#   
#   def setup
#     @result = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/vital_sign.xml'))
#     @importer = HealthDataStandards::Import::GreenC32::VitalSignImporter.instance
#   end
#   
#   def test_extraction
#     result = @importer.import(@result)
#     
#     refute_nil result
#     
#     code_system = result.codes.keys[0]
#     
#     assert_equal "LOINC", code_system
#     assert_equal ["14647-2"], result.codes[code_system]
#     
#     translation = result.codes.keys[1]
#     
#     assert_equal "SNOMED-CT", translation
#     assert_equal ["12345"], result.codes[translation]
#     
#     assert_equal 135, result.value["scalar"]
#     assert_equal "mg/dl", result.value["unit"]
#     
#     assert_equal "<200 mg/dl", result.reference_range
#     assert_equal "completed", result.status
#     
#     assert_equal 1327932000, result.time
#     
#     interpretation_code_system = result.interpretation.keys[0]
#     
#     assert_equal "HITSP C80 Observation Status", interpretation_code_system
#     assert_equal ["N"], result.interpretation[interpretation_code_system]
#   end
#   
# end
