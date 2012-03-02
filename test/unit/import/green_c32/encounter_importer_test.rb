require 'test_helper'

module GreenC32
  class EncounterImporterTest < MiniTest::Unit::TestCase

    def setup
      @encounter = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/encounter.xml'))
      @importer = HealthDataStandards::Import::GreenC32::EncounterImporter.instance
    end
    
    def test_import
      encounter = @importer.import(@encounter)
      
      refute_nil encounter
      refute_nil encounter.start_time
      refute_nil encounter.end_time
      assert_equal "Routine Check Up", encounter.free_text
      
      refute_nil encounter.admit_type
      refute encounter.admit_type.empty?
      
      refute_nil encounter.discharge_disposition
      refute encounter.discharge_disposition.empty?
      
      refute_nil encounter.facility
      facility = encounter.facility
      refute_nil facility.start_time
      refute_nil facility.end_time
      organization = facility.organization
      
      refute_nil organization
      
      assert_equal "Muffin Man Healthcare Associated", facility.organization.name
      
      
      telecom = organization.telecoms.first
      
      refute_nil telecom
      
      assert_equal "fax", telecom.use
      refute_nil telecom.value
      assert telecom.preferred
    end
  end
end

