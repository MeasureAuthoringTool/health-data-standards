require 'test_helper'

class ImmunizationImporterTest < MiniTest::Unit::TestCase
  def test_immunization_importing
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    patient = pi.parse_c32(doc)
    
    immunization = patient.immunizations[0]
    assert immunization.codes['CVX'].include? '88'
    assert immunization.codes['CVX'].include? '111'
    
    immunization = patient.immunizations[1]
    assert_equal false, immunization.refusal_ind
    
    immunization = patient.immunizations[3]
    assert_equal true, immunization.refusal_ind
    assert_equal 'PATOBJ', immunization.refusal_reason['code']
    assert_equal true, immunization.negation_ind
    assert_equal 'PATOBJ', immunization.negation_reason['code']

    assert_equal immunization.performer.given_name, 'FirstName'
    assert_equal '100 Bureau Drive', immunization.performer.addresses.first.street.first
  end
end