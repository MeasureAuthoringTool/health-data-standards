module HealthDataStandards
  module Import
    module C32
      class MedicalEquipmentImporter < SectionImporter
        
        def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.128']/cda:entry/cda:supply"
          @code_xpath = "./cda:participant/cda:participantRole/cda:playingDevice/cda:code"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value]"
          @check_for_usable = true
        end
        
        def create_entries(doc,id_map = {})
          entry_list = []
          entry_elements = doc.xpath(@entry_xpath)
          entry_elements.each do |entry_element|
            entry = create_entry(entry_element, id_map)
            if @check_for_usable
              entry_list << entry if entry.usable?
            else
              entry_list << entry
            end
          end
          entry_list
        end
        
        def create_entry(entry_element, id_map={})
          entry = MedicalEquipment.new
          extract_codes(entry_element, entry)
          extract_dates(entry_element, entry)
          extract_value(entry_element, entry)
          
          extract_description(entry_element, entry, id_map)
          extract_manufacturer(entry_element, entry)
          entry
        end
        
        def extract_manufacturer(entry_element, entry)
          manufacturer = entry_element.at_xpath("./cda:participant/cda:participantRole/cda:scopingEntity/cda:desc").try(:inner_text)
          entry.manufacturer = manufacturer.strip if manufacturer
        end
      end
    end
  end
end