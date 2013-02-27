module HealthDataStandards
  module Import
    module CDA
      class MedicalEquipmentImporter < SectionImporter
        def initialize(entry_finder=EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.128']/cda:entry/cda:supply"))
          super(entry_finder)
          @code_xpath = "./cda:participant/cda:participantRole/cda:playingDevice/cda:code"
          @entry_class = MedicalEquipment
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          medical_equipment = super
          extract_manufacturer(entry_element, medical_equipment)
          medical_equipment
        end

        def extract_manufacturer(entry_element, entry)
          manufacturer = entry_element.at_xpath("./cda:participant/cda:participantRole/cda:scopingEntity/cda:desc").try(:inner_text)
          entry.manufacturer = manufacturer.strip if manufacturer
        end
      end
    end
  end
end