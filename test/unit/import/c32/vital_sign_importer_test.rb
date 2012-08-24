require 'test_helper'

class VitalSignImporterTest < MiniTest::Unit::TestCase
  
  def test_vital_sign_importing
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    patient = pi.parse_c32(doc)
    
    vital_sign = patient.vital_signs[0]
    
    assert_equal 'N', vital_sign.interpretation['code']
    assert_equal "177", vital_sign.values.first.scalar
    assert_equal "cm", vital_sign.values.first.units
    assert_equal 'HITSP C80 Observation Status', vital_sign.interpretation['codeSystem']
  end

end
