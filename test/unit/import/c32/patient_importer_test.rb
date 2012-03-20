require 'test_helper'

class PatientImporterTest < MiniTest::Unit::TestCase
  def test_get_demographics
    doc = Nokogiri::XML(File.new('test/fixtures/c32_fragments/demographics.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    
    patient = Record.new
    HealthDataStandards::Import::C32::PatientImporter.instance.get_demographics(patient, doc)

    assert_equal 'Joe', patient.first
    assert_equal 'Smith', patient.last
    assert_equal -87696000, patient.birthdate
    assert_equal 'M', patient.gender
    assert_equal '24602', patient.medical_record_number
    assert_equal 1199189385, patient.effective_time
    
    assert_equal ['en-US'], patient.languages
    
    assert_equal "2108-9", patient.race[:code]
    assert_equal "CDC-RE", patient.race[:code_set]
    assert_equal "2137-8", patient.ethnicity[:code]
    assert_equal "CDC-RE", patient.ethnicity[:code_set]
    
  end
  
  def test_parse_c32
    doc = Nokogiri::XML(File.new('test/fixtures/c32_fragments/0032/numerator.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    
    patient = HealthDataStandards::Import::C32::PatientImporter.instance.parse_c32(doc)
    patient.save!
    
    assert_equal 'FirstName', patient.first
    assert_equal 1, patient.encounters.size
    
    assert_equal 1270598400, patient.encounters.first.time
  end
end