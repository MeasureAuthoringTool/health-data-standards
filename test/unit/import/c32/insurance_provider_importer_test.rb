require 'test_helper'

class InsuranceProviderImporterTest < MiniTest::Unit::TestCase
  
  def test_insurance_providers
    doc = Nokogiri::XML(File.new('test/fixtures/NISTExampleC32.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    pi = HealthDataStandards::Import::C32::PatientImporter.instance
    patient = pi.parse_c32(doc)
    ip = patient.insurance_providers.first
    refute_nil ip
    g = ip.guarantors.first
    refute_nil g
    assert_equal 1260316800, g.start_time
    assert_equal 1355011200, g.end_time
  end
end