module HealthDataStandards
  module Import
    module Cat1
      class TransferToImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.82']"))
          super(entry_finder)
          @entry_class = Encounter
        end
        
        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          encounter = super
          extract_transfers(entry_element, encounter)
          encounter[:start_time] = HL7Helper.timestamp_to_integer(entry_element.at_xpath("./cda:participant/cda:time/cda:low")['value'])
          encounter
        end
        
        private
        
        def extract_transfers(parent_element, encounter)
          transfer_to_element = parent_element.at_xpath("./cda:participant[@typeCode='DST']")
          if (transfer_to_element)
            transfer_to = Transfer.new(time: HL7Helper.timestamp_to_integer(parent_element.at_xpath("./cda:participant/cda:time/cda:low")['value']))
            transfer_to_subelement = transfer_to_element.at_xpath("./cda:participantRole[@classCode='LOCE']")
            raw_tt_code = extract_code(transfer_to_subelement, './cda:code')
            code_hash = {CodeSystemHelper.code_system_for(raw_tt_code["codeSystemOid"]) => [raw_tt_code["code"]]}
            transfer_to['code_system'] = code_hash.keys.first
            transfer_to['code'] = code_hash[code_hash.keys.first].first
            encounter.transfer_to = transfer_to
          end
        end
      end
    end
  end
end
