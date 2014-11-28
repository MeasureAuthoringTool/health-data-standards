require 'test_helper'

module GreenC32
  class ImmunizationImporterTest < Minitest::Test

  def setup
    @immunization = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/immunization.xml'))
    @importer = HealthDataStandards::Import::GreenC32::ImmunizationImporter.instance
  end

  def test_extraction
    immunization = @importer.import(@immunization)
    refute_nil immunization
    assert immunization.is_a?(HealthDataStandards::Immunization)
  end

  end
end