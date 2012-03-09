require 'test_helper'

module CCR
  class ProviderImporterTest < MiniTest::Unit::TestCase
  
    def setup
      Provider.all.each(&:destroy)
      @ccr = Nokogiri::XML(File.new('test/fixtures/ccr_fragments/patient_with_providers.xml'))
      @ccr.root.add_namespace_definition('ccr', 'urn:astm-org:CCR')
      @pi = HealthDataStandards::Import::CCR::ProviderImporter.instance
    end
    
    def test_provider_extraction
     results =  @pi.extract_providers(@ccr)
     
     npi_provider = results.map(&:provider).detect { |pv| pv[:npi] != nil }
     
     refute_nil npi_provider

     assert_equal "Sam", npi_provider[:given_name]
     assert_equal "Willis", npi_provider[:family_name]
     assert_equal "808401234567893", npi_provider[:npi]
    end
  end
end