require 'test_helper'

class CDAProviderImporterTest < Minitest::Test

  class HealthDataStandards::Provider
    def resolve_provider(p, q)
      HealthDataStandards::Provider.first
    end
  end

	def setup
    HealthDataStandards::Provider.where({}).delete
    @importer =  HealthDataStandards::Import::CDA::ProviderImporter.instance
	end

  def teardown
    HealthDataStandards::Provider.where({}).delete
  end

  def test_import_existing_npi
    provider = HealthDataStandards::Provider.create(:npi=>"808401234567893")
    assert_equal 1, HealthDataStandards::Provider.count, "Should be 1 provider in the DB"
    provider = HealthDataStandards::Provider.first
    assert_equal "808401234567893", provider.npi , "Expected provider npi number to be 808401234567893"
    doc = Nokogiri::XML(File.read('test/fixtures/health_data_standards_providers/one_provider_with_npi.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    providers = @importer.extract_providers(doc)

    assert_equal 1, providers.length, "Should have found 1 provider in the file"
    assert_equal provider, providers[0].provider, "Provider in file should have been the same one in the db"
  end

  def test_import_non_existant_npi
    assert_equal 0, HealthDataStandards::Provider.count, "Should be 0 providers in the DB"
    provider = HealthDataStandards::Provider.first

    doc = Nokogiri::XML(File.read('test/fixtures/health_data_standards_providers/one_provider_with_npi.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    providers = @importer.extract_providers(doc)

    assert_equal 1, providers.length, "Should have found 1 provider in the file"
    assert_equal 1, HealthDataStandards::Provider.count, "Should be 1 provider in database"
    assert_equal '808401234567893', HealthDataStandards::Provider.first.npi, "Provider should have  NPI number 808401234567893"

  end

  def test_import_no_npi
    assert_equal 0, HealthDataStandards::Provider.count, "Should be 0 providers in the DB"
    doc = Nokogiri::XML(File.read('test/fixtures/health_data_standards_providers/one_provider_no_npi.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    providers = @importer.extract_providers(doc)
    assert_equal 1, providers.length, "should have found 1 provider in the file"
    assert_equal HealthDataStandards::Provider.count , providers.length, "should be as many providers in db as parsed"

    providers2 = @importer.extract_providers(doc)
    assert_equal HealthDataStandards::Provider.count , providers2.length, "should not have created any new providers"

    assert_equal providers.collect{|p| p.provider},providers2.collect{|p| p.provider}, "should be the same providers after repatsing"

  end

  def test_import_of_cda_identifier
    assert_equal 0, HealthDataStandards::Provider.count, "Should be 0 providers in the DB"
    doc = Nokogiri::XML(File.read('test/fixtures/health_data_standards_providers/one_provider_cda_ident.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
    providers = @importer.extract_providers(doc)
    assert_equal 1, providers.length, "should have found 1 provider in the file"
    assert_equal HealthDataStandards::Provider.count , providers.length, "should be as many providers in db as parsed"
    assert_equal 1, HealthDataStandards::Provider.where("cda_identifiers.root" => "Division", "cda_identifiers.extension" => "12345").count
  end

  def test_import_resolve_provider
    assert_equal 0, HealthDataStandards::Provider.count, "Should be 0 providers in the DB"
    provider = HealthDataStandards::Provider.create(npi: "808401234567893")

    assert_equal 1, HealthDataStandards::Provider.count, "Should be 1 providers in the DB"
    doc = Nokogiri::XML(File.read('test/fixtures/health_data_standards_providers/two_providers.xml'))
    doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')

    providers = @importer.extract_providers(doc)
    providers = providers.collect{|p| provider}.uniq!
    assert_equal 1, providers.length, "should have found 1 unique provider in the file"
    assert_equal HealthDataStandards::Provider.count , providers.length, "should be 1 provider in the db"
    assert_equal provider, providers[0], "should be the same unique provider"


  end


end
