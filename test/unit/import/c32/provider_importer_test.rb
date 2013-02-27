require 'test_helper'

class ProviderImporterTest < MiniTest::Unit::TestCase
  
  def setup
    Provider.all.each(&:destroy)
    @doc = Nokogiri::XML(File.new("test/fixtures/provider_importer_sample.xml"))
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    
    @nist_doc = Nokogiri::XML(File.new("test/fixtures/NISTExampleC32.xml"))
    @nist_doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    @importer = HealthDataStandards::Import::CDA::ProviderImporter.instance
  end
  
  def test_document_provider_extraction
    providers = @importer.extract_providers(@doc)

    assert_equal 2, providers.size
    
    provider_perf = providers.first
    provider = provider_perf.provider
    refute_nil provider
    
    assert_equal "Dr.", provider.title
    assert_equal "Stanley", provider.given_name
    assert_equal "Strangelove", provider.family_name
    refute_nil provider.addresses.first
    assert_equal '808401234567893', provider.npi
    # assert_equal "Kubrick Permanente", provider[:organization]
    assert_equal "200000000X", provider.specialty
    
    provider_perf2 = providers.last 
    provider2 = provider_perf2.provider
    refute_nil provider2

    assert_equal "Dr.", provider2.title
    assert_equal "Teddy", provider2.given_name
    assert_equal "Seuss", provider2.family_name
    assert_equal '1234567893', provider2.npi
    # assert_equal "Redfish Labs", provider2[:organization]
    assert_equal "230000000X", provider2.specialty
    assert_nil provider2.phone
  end
  
  def test_nist_example_provider_extraction
    
    providers = @importer.extract_providers(@nist_doc)

    assert_equal 2, providers.size
    
    provider_perf = providers.first
    provider = provider_perf.provider
    refute_nil provider

    assert_equal "Dr.", provider.title
    assert_equal "Pseudo", provider.given_name
    assert_equal "Physician-1", provider.family_name
    assert_equal '808401234567893', provider.npi
    # assert_equal "NIST HL7 Test Laboratory", provider[:organization]
    assert_equal "200000000X", provider.specialty
    
    provider_perf2 = providers.last
    provider2 = provider_perf2.provider
    refute_nil provider2
    
    assert_equal "Dr.", provider2.title
    assert_equal "Pseudo", provider2.given_name
    assert_equal "Physician-3", provider2.family_name
    # assert_equal "NIST HL7 Test Laboratory", provider2[:organization]
    assert_equal "200000000X", provider2.specialty
    assert_nil provider2.npi
  end
    # 
    # def test_encounter_provider_extraction
    #   providers = @importer.extract_providers(@doc, true)
    #   provider = providers.first
    #   refute_nil provider
    #   assert_equal "John", provider[:given_name]
    #   assert_equal "Johnson", provider[:family_name]
    #   assert_equal "808401234567893", provider[:npi]
    #   assert_equal "Family Doctors", provider[:organization]
    #   assert_equal 4084574400, provider[:start]
    #   assert_equal "+1-301-555-5555", provider[:phone]
    # end
  
end