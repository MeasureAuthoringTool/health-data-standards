module HealthDataStandards
  module Import
    module Cat1
      class EncounterOrderImporter < CDA::EncounterImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.22']"))
          super(entry_finder)
        end

        private

      end
    end
  end
end