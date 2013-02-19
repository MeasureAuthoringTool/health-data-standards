require 'test_helper'

class ResultImporterTest < MiniTest::Unit::TestCase
  def test_result_importing
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    patient = pi.parse_c32(doc)
    
    result = patient.results[0]
    assert_equal 'N', result.interpretation['code']
    assert_equal 'HITSP C80 Observation Status', result.interpretation['codeSystem']
    assert_equal "M 13-18 g/dl; F 12-16 g/dl", result.reference_range
    assert_equal 'HGB (M 13-18 g/dl; F 12-16 g/dl)', result.description
  end
end