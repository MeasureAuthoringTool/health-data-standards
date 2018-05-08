module HealthDataStandards
  module Import
    module Cat1
      class MedicationSubstanceAdministeredImporter < CDA::MedicationImporter

        def initialize
          super(CDA::EntryFinder.new("./cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.16']"))
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          medication = super
          medication
        end
      end
    end
  end
end