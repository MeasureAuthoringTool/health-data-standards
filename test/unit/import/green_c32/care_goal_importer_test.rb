require 'test_helper'

module GreenC32
  class CareGoalImporterTest < MiniTest::Unit::TestCase

    def setup
      @encounter = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/encounter.xml'))
      @procedure = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/procedure.xml'))
      @medication = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/medication.xml'))
      @immunization = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/immunization.xml'))
      @med_equipment = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/medical_equipment.xml'))
      @entry = Nokogiri::XML(File.new('test/fixtures/green_c32_fragments/entry.xml'))
      @importer = HealthDataStandards::Import::GreenC32::CareGoalImporter.instance
    end
    
    def test_import_of_encounter
      @importer.import(@encounter)
    end
    
    def test_import_of_procedure
      @importer.import(@procedure)
    end
    
    def test_import_of_medication
      @importer.import(@medication)
    end
    
    def test_import_of_immunization
      @importer.import(@immunization)
    end
    
    def test_import_of_medical_equipment
      @importer.import(@med_equipment)
    end
    
    def test_import_of_entry
      @importer.import(@entry)
    end
  end
end
