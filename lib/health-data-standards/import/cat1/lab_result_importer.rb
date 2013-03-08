module HealthDataStandards
  module Import
    module Cat1
      class LabResultImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.40']"))
          super(entry_finder)
          @entry_class = LabResult
        end
      end
    end
  end
end