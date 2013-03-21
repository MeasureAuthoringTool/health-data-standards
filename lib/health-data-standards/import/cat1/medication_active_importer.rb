module HealthDataStandards
  module Import
    module Cat1
      class MedicationActiveImporter < CDA::MedicationImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:substanceAdministration[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.41']"))
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          medication = super
          calculate_cumulative_medication_duration(medication)
          medication
        end

        private

        def calculate_cumulative_medication_duration(medication)
          if medication.start_time.present? && medication.end_time.present?
            duration_in_days = ((medication.end_time - medication.start_time) / (60*60*24)).floor + 1
            medication.cumulative_medication_duration = {'scalar' => duration_in_days, 'units' => 'days'}
          end
        end
      end
    end
  end
end