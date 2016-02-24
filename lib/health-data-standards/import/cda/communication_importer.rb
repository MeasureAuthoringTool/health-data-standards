module HealthDataStandards
  module Import
    module CDA
      class CommunicationImporter < SectionImporter

        #scoped to not look in the plan of care section so planned procedures do not end up mixed with
        #past procedures
        def initialize(entry_finder=EntryFinder.new("./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.2'] | ./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.3'] | ./cda:entry/cda:act[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.4']"))
          super(entry_finder)
          @entry_class = Communication
          @template_xpath = "./cda:templateId/@root"
          @reference_xpath = "./sdtc:inFulfillmentOf1"
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          communication = super
          communication.direction = find_communication_direction(entry_element)
          extract_reason_or_negation(entry_element, communication)
          extract_references(entry_element, communication)
          communication
        end

        private

        def find_communication_direction(entry_element)
          case entry_element.at_xpath(@template_xpath).value
          when "2.16.840.1.113883.10.20.24.3.3"
            return "communication_from_provider_to_patient"
          when "2.16.840.1.113883.10.20.24.3.2"
            return "communication_from_patient_to_provider"
          when "2.16.840.1.113883.10.20.24.3.4"
            return "communication_from_provider_to_provider"
          end
        end

        def extract_references(parent_element, entry)
          parent_element.xpath(@reference_xpath).each do |ref_xml|
            ref = Reference.new
            ref.type = case ref_xml.at_xpath("./@typeCode").value
            when "FLFS"
              "fulfills"
            end
            ref.referenced_type = case ref_xml.at_xpath("./sdtc:actReference/@classCode").value
            when "ACT"
              "Procedure"
            end
            id_element = ref_xml.at_xpath("./sdtc:actReference/sdtc:id")
            ref.referenced_id = id_element['extension']
            entry.references << ref
          end
        end
      end
    end
  end
end