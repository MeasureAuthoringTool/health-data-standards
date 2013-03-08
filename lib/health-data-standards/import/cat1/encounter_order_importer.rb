module HealthDataStandards
  module Import
    module Cat1
      class EncounterOrderImporter < CDA::EncounterImporter
        def initialize(entry_finder=CDA::EntryFinder.new("//cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.22']"))
          super(entry_finder)
        end

        private

        def extract_dates(parent_element, entry, element_name="author")
          if parent_element.at_xpath("cda:#{element_name}/cda:time/@value")
            entry.start_time = HL7Helper.timestamp_to_integer(parent_element.at_xpath("cda:#{element_name}/cda:time")['value'])
          end
        end
      end
    end
  end
end