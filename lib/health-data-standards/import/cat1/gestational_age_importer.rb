module HealthDataStandards
  module Import
    module Cat1
      class GestationalAgeImporter < CDA::SectionImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.101']"))

        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          ga_entry = super
          swap_code_based_on_value(ga_entry)
          ga_entry
        end
    
        private

        # QRDA Cat 1 represents gestational age by using the SNOMED code for length
        # of gestation and then providing the length in weeks in a value element.
        # The measure value sets use the SNOMED codes that correspond to an actual
        # gestational length. This method uses the value to replace the SNOMED code
        # in the entry.
        def swap_code_based_on_value(ga_entry)
          value = ga_entry.values.first
          if value.present?
            case value.scalar
            when "39"
              ga_entry.codes = {'SNOMED-CT' => ['80487005']}
            when "38"
              ga_entry.codes = {'SNOMED-CT' => ['13798002']}
            when "37"
              ga_entry.codes = {'SNOMED-CT' => ['43697006']}
            when "36"
              ga_entry.codes = {'SNOMED-CT' => ['931004']}
            end
          end
        end
      end
    end
  end
end