module HealthDataStandards
  module Import
    module Cat1
      class EncounterPerformedImporter < CDA::EncounterImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:encounter[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.23']"))
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          encounter = super
          extract_discharge_disposition(entry_element, encounter)
          encounter
        end

        private

        def extract_discharge_disposition(parent_element, encounter)
          encounter.discharge_disposition = extract_code(parent_element, "./sdtc:dischargeDispositionCode")
        end
      end
    end
  end
end