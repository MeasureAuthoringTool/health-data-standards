require 'test_helper'

class CareGoalImporterTest < MiniTest::Unit::TestCase
  
  def setup
    doc = Nokogiri::XML(File.new('test/fixtures/c32_fragments/plan_of_care.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    @pi = HealthDataStandards::Import::C32::PatientImporter.instance
    @patient = @pi.parse_c32(doc)
  end
    
  def test_import_of_result
    assert_equal 2, @patient.care_goals.size
  end    

end