module HealthDataStandards
  module Import
    module CDA
      class MedicalEquipmentImporter < SectionImporter
        def initialize(entry_finder=EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.128']/cda:entry/cda:supply"))
          super(entry_finder)
          @code_xpath = "./cda:participant/cda:participantRole/cda:playingDevice/cda:code"
          @anatomical_xpath = "./cda:targetSiteCode"
          @entry_class = MedicalEquipment
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          medical_equipment = super
          extract_manufacturer(entry_element, medical_equipment)
          extract_anatomical_structure(entry_element, medical_equipment)
          extract_removal_time(entry_element, medical_equipment)
          extract_reason_or_negation(entry_element, medical_equipment)
          medical_equipment
        end

        def extract_manufacturer(entry_element, entry)
          manufacturer = entry_element.at_xpath("./cda:participant/cda:participantRole/cda:scopingEntity/cda:desc").try(:inner_text)
          entry.manufacturer = manufacturer.strip if manufacturer
        end

        def extract_removal_time(entry_element, entry)
          if entry_element.at_xpath("cda:effectiveTime/cda:high")
            entry.removal_time = HL7Helper.timestamp_to_integer(entry_element.at_xpath("cda:effectiveTime/cda:high")['value'])
          end
        end

        def extract_anatomical_structure(entry_element, entry)
          site = entry_element.at_xpath(@anatomical_xpath)
          if site
            entry.anatomical_structure = {"code" => site['code'], "code_system" => CodeSystemHelper.code_system_for(site['codeSystem']), "codeSystemName" => CodeSystemHelper.code_system_for(site['codeSystem']), CodeSystemHelper.code_system_for(site['codeSystem']) => [site['code']]}
          end
        end
      end
    end
  end
end