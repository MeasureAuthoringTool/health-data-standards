module HealthDataStandards
  module Import
    module GreenC32
      class CareGoalImporter
        include Singleton
        
        def initialize
        end
        
        def import(care_goal_xml)
          importer = case care_goal_xml.at_xpath("/*").try(:name)
                     when "medication" then MedicationImporter.instance
                     when "immunization" then ImmunizationImporter.instance
                     when "procedure" then ProcedureImporter.instance
                     when "encounter" then EncounterImporter.instance
                     when "medicalEquipment" then MedicalEquipmentImporter.instance
                     else SectionImporter.new
                     end
                
          return importer.import(care_goal_xml)
        end
        
      end
    end
  end
end