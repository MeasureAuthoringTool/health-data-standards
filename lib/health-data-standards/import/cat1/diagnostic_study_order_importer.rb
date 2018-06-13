module HealthDataStandards
  module Import
    module Cat1
      class DiagnosticStudyOrderImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.17']"))
          super(entry_finder)
          @entry_class = Procedure
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          procedure = super
          extract_reason_or_negation(entry_element, procedure)
          procedure
        end

        private

      end
    end
  end
end