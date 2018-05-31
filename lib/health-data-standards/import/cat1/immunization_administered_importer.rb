module HealthDataStandards
  module Import
    module Cat1
      class ImmunizationAdministeredImporter < CDA::MedicationImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.22.4.52']"))
          super(entry_finder)
          #@code_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code"
          #@entry_class = Medication
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          medication = super
          medication.start_time = medication.time
          medication
        end

      end
    end
  end
end