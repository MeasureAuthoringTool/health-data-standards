module HealthDataStandards
  module Import
    module Cat1
      class TransferFromImporter < CDA::EncounterImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.81']"))
          super(entry_finder)
          @time_xpath = ""
          @entry_class = Encounter
        end
        
        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          encounter = super
          transfer_time = HL7Helper.timestamp_to_integer(entry_element.at_xpath("./cda:participant/cda:time/cda:low")['value'])
          encounter[:start_time] = transfer_time
          encounter[:end_time] = transfer_time
          transfer_from_element = entry_element.at_xpath("./cda:participant[@typeCode='ORG']")
          extract_transfer(transfer_from_element, encounter)
          encounter
        end

      end
    end
  end
end