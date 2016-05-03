module HealthDataStandards
  module Import
    module Cat1
      class TransferToImporter < CDA::EncounterImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.82']"))
          super(entry_finder)
          @entry_class = Encounter
        end
        
        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          encounter = super
          transfer_to_element = entry_element.at_xpath("./cda:participant[@typeCode='DST']")
          extract_transfer(transfer_to_element, encounter)
          transfer_time = HL7Helper.timestamp_to_integer(entry_element.at_xpath("./cda:participant/cda:time/cda:low")['value'])
          encounter[:start_time] = transfer_time
          encounter[:end_time] = transfer_time
          encounter
        end
        
      end
    end
  end
end