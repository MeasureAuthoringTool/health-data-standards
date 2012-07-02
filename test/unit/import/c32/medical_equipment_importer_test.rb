require 'test_helper'

class MedicalEquipmentImporterTest < MiniTest::Unit::TestCase
  def test_me_importing
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    
    patient = pi.parse_c32(doc)

    assert_equal 3, patient.medical_equipment.size

    me = patient.medical_equipment[0]
  
    assert_equal( {"SNOMED-CT" => ["72506001"]}, me.codes)
    
    me2 = patient.medical_equipment[1]
    
    assert_equal( {"SNOMED-CT" => ["304120007"]}, me2.codes)
    assert_equal "Good Health Prostheses Company", me2.manufacturer
    
  end
end