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
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          communication = super
          communication.direction = find_communication_direction(entry_element)
          extract_negation(entry_element, communication)
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
      end
    end
  end
end