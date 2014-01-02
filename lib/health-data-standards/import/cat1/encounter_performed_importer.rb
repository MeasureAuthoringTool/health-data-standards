module HealthDataStandards
  module Import
    module Cat1
      class EncounterPerformedImporter < CDA::EncounterImporter
        def initialize(entry_finder=CDA::EntryFinder.new("//cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']"))
          super(entry_finder)
          @reason_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:observation"
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          encounter = super
          extract_admit_time(entry_element, encounter)
          extract_reason(entry_element, encounter, nrh)
          encounter
        end

        private

        def extract_reason(parent_element, encounter, nrh)
          reason_element = parent_element.at_xpath(@reason_xpath)
          if reason_element
            reason = Entry.new
            extract_codes(reason_element, reason)
            extract_description(reason_element, reason, nrh)
            extract_status(reason_element, reason)
            extract_dates(reason_element, reason)
            encounter.reason = reason
          end
        end

        def extract_admit_time(parent_element, encounter)
          encounter.admit_time = encounter.start_time
        end

      end
    end
  end
end