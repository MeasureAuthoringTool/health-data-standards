module HealthDataStandards
  module Import
    module Cat1
      class ProcedureOrderImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.63']"))
          super(entry_finder)
          @entry_class = Procedure
        end
        
        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          procedure = super
          procedure.status_code = {'HL7 ActStatus' => ['ordered']}
          extract_performer(entry_element, procedure)
          extract_site(entry_element, procedure)
          extract_negation(entry_element, procedure)
          procedure
        end

        private

        def extract_dates(parent_element, entry, element_name="author")
          if parent_element.at_xpath("cda:#{element_name}/cda:time/@value")
            entry.start_time = HL7Helper.timestamp_to_integer(parent_element.at_xpath("cda:#{element_name}/cda:time")['value'])
          end
        end

        def extract_performer(parent_element, procedure)
          performer_element = parent_element.at_xpath("./cda:performer")
          procedure.performer = import_actor(performer_element) if performer_element
        end

        def extract_site(parent_element, procedure)
          procedure.site = extract_code(parent_element, "./cda:targetSiteCode")
        end
      end
    end
  end
end