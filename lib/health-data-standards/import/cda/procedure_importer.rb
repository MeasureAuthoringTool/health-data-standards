module HealthDataStandards
  module Import
    module CDA
      class ProcedureImporter < SectionImporter

        #scoped to not look in the plan of care section so planned procedures do not end up mixed with
        #past procedures
        def initialize(entry_finder=EntryFinder.new("//cda:section[cda:templateId/@root!='2.16.840.1.113883.3.88.11.83.124']//cda:procedure"))
          super(entry_finder)
          @entry_class = Procedure
          @value_xpath = nil
        end
        
        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          procedure = super
          extract_performer(entry_element, procedure)
          extract_site(entry_element, procedure)
          extract_negation(entry_element, procedure)
          procedure
        end

        private

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