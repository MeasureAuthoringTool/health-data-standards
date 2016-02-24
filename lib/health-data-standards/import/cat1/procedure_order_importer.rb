module HealthDataStandards
  module Import
    module Cat1
      class ProcedureOrderImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.63']"))
          super(entry_finder)
          @entry_class = Procedure
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          procedure = super
          procedure.status_code = {'HL7 ActStatus' => ['ordered']}
          extract_performer(entry_element, procedure)
          extract_anatomical_target(entry_element, procedure)
          extract_reason_or_negation(entry_element, procedure)
          procedure
        end

        private

        def extract_dates(parent_element, entry, element_name="author")
          if parent_element.at_xpath("cda:#{element_name}/cda:time/@value")
            entry.time = HL7Helper.timestamp_to_integer(parent_element.at_xpath("cda:#{element_name}/cda:time")['value'])
          end
        end

        def extract_performer(parent_element, procedure)
          performer_element = parent_element.at_xpath("./cda:performer")
          procedure.performer = import_actor(performer_element) if performer_element
        end

        def extract_anatomical_target(parent_element, procedure)
          procedure.anatomical_target = extract_code(parent_element, "./cda:targetSiteCode")
        end
      end
    end
  end
end