module HealthDataStandards
  module Import
    module C32
      class CareGoalImporter < CDA::SectionImporter

        def initialize(entry_finder=CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.124']/cda:entry/cda:*[cda:templateId/@root='2.16.840.1.113883.10.20.1.25']"))
          super(entry_finder)
        end
        
        def create_entry(goal_element, nrh = CDA::NarrativeReferenceHandler.new)
          importer = case goal_element.name
                       when "observation" then CDA::ResultImporter.new
                       when "supply" then CDA::MedicalEquipment.new
                       when "substanceAdministration" then CDA::MedicationImporter.new
                       when "encounter" then CDA::EncounterImporter.new
                       when "procedure" then CDA::ProcedureImporter.new
                       else CDA::SectionImporter.new(nil) #don't need entry xpath, since we already have the entry
                       end
            
          entry = importer.create_entry(goal_element, nrh)
          extract_negation(goal_element, entry)

          entry
        end
      end
    end
  end
end