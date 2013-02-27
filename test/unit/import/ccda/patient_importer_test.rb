require 'test_helper'
module CCDA
  class PatientImporterTest < MiniTest::Unit::TestCase
    
    def setup
      @doc = Nokogiri::XML(File.new('test/fixtures/sample_ccda.xml'))
      @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      @doc.root.add_namespace_definition('sdtc', 'urn:hl7-org:sdtc')
    end

    def test_parse_ccda
      patient = HealthDataStandards::Import::CCDA::PatientImporter.instance.parse_ccda  (@doc)
      
      assert_equal 3, patient.allergies.size
      
      allergy = patient.allergies.first
      
      assert_equal "247472004", allergy.reaction['code']
      assert_equal "371924009", allergy.severity['code']
      assert_equal "416098002", allergy.type['code']
      assert_equal "active", allergy.status
      
      condition = patient.conditions.first
      
      refute_nil condition
      
      assert_equal "Complaint", condition.type
      
      assert_equal 0, patient.encounters.size
      assert_equal 4, patient.immunizations.size
      
      medication = patient.medications.first
      
      refute_nil  medication
      
      assert_equal "5955009", medication.vehicle["code"]
      refute_nil medication.order_information.first
      refute_nil medication.fulfillment_history.first
      
      
      assert_equal 3, patient.procedures.size
    end
  end
end
