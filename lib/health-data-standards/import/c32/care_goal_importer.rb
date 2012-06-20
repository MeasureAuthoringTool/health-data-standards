module HealthDataStandards
  module Import
    module C32
      class CareGoalImporter < SectionImporter

        def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.124']/cda:entry/cda:*[cda:templateId/@root='2.16.840.1.113883.10.20.1.25']"
          @status_xpath = "./cda:statusCode"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] "
        end
        
        def create_entries(doc, id_map = {})
          goal_list = []
          goal_elements = doc.xpath(@entry_xpath)
          goal_elements.each do |goal_element|
            
            importer = case goal_element.name
                       when "observation" then ResultImporter.new
                       when "supply" then MedicalEquipment.new
                       when "substanceAdministration" then MedicationImporter.new
                       when "encounter" then EncounterImporter.new
                       when "procedure" then ProcedureImporter.new
                       else SectionImporter.new
                       end
            
            entry = importer.create_entry(goal_element, id_map={})
            
            
            
            if @check_for_usable
              goal_list << entry if entry.usable?
            else
              goal_list << entry
            end
          end
          goal_list
        end
      end
    end
  end
end