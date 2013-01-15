module HealthDataStandards
  module Import
    module CCDA
      class PatientImporter < C32::PatientImporter
        
        def initialize(check_usable = true)
          @section_importers = {}
          @section_importers[:encounters] = EncounterImporter.new
          @section_importers[:procedures] = ProcedureImporter.new
          @section_importers[:results] = ResultImporter.new
          @section_importers[:vital_signs] = VitalSignImporter.new
          @section_importers[:medications] = MedicationImporter.new
          @section_importers[:conditions] = ConditionImporter.new
          @section_importers[:social_history] = CDA::SectionImporter.new(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.38' or cda:templateId/@root='2.16.840.1.113883.10.20.15.3.8']"))
          @section_importers[:care_goals] = CareGoalImporter.new
          @section_importers[:medical_equipment] = MedicalEquipmentImporter.new
          @section_importers[:allergies] = AllergyImporter.new
          @section_importers[:immunizations] = ImmunizationImporter.new
          @section_importers[:insurance_providers] = InsuranceProviderImporter.new
        end
        
        def parse_ccda(doc)
          parse_c32(doc)
        end

      end
    end
  end
end
