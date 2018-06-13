module HealthDataStandards
  module Import
    module Cat1
      class LabOrderImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.37']"))
          super(entry_finder)
          @entry_class = LabResult
        end
        
        private

      end
    end
  end
end