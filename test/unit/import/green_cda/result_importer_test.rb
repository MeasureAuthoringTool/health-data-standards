require 'test_helper'

class ResultImporterTest < MiniTest::Unit::TestCase
  def setup
    doc = Nokogiri::XML(File.new('test/fixtures/green_ccd.xml'))
    doc.root.add_namespace_definition('green', "urn:hl7-org:greencda:c32")
    @results = doc.xpath("/green:greenCCD/green:body/green:results/green:resultsOrganizer/green:result")
    @importer = HealthDataStandards::Import::GreenCda::ResultImporter.instance
  end
  
  def test_extraction
    assert_equal 3, @results.size
    
    lab_results = @results.map { |result| @importer.import(result) }
    result = lab_results[0]
    
    refute_nil result
    
    code_system = result.codes.keys[0]
    assert_equal "LOINC", code_system
    assert_equal ["14647-2"], result.codes[code_system]
    
    assert_equal 135, result.value["scalar"]
    assert_equal "mg/dl", result.value["units"]
    
    assert_equal "<200 mg/dl", result.reference_range
    assert_equal "completed", result.status
    
    interpretation_code_system = result.interpretation.keys[0]
    assert_equal "HITSP C80 Observation Status", interpretation_code_system
    assert_equal ["N"], result.interpretation[interpretation_code_system]
  
    result2 = lab_results[1]
    
    refute_nil result2
    
    assert_equal "Triglyceride [Mass/volume] in Blood", result2.description
    
    
  end
  
  
end