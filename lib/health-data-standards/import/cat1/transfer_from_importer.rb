module HealthDataStandards
  module Import
    module Cat1
      class TransferFromImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.81']"))
          super(entry_finder)
          @time_xpath = ""
          @entry_class = Encounter
        end
        
        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          encounter = super
          encounter[:start_time] = HL7Helper.timestamp_to_integer(entry_element.at_xpath("./cda:participant/cda:time/cda:low")['value'])
          extract_transfers(entry_element, encounter)
          encounter
        end
        
        private
        
        def extract_transfers(parent_element, encounter)
          transfer_from_element = parent_element.at_xpath("./cda:participant[@typeCode='ORG']")
          if (transfer_from_element)
            transfer_from = Transfer.new(time: HL7Helper.timestamp_to_integer(parent_element.at_xpath("./cda:participant/cda:time/cda:low")['value']))
            transfer_from_subelement = transfer_from_element.at_xpath("./cda:participantRole[@classCode='LOCE']")
            raw_tf_code = extract_code(transfer_from_subelement, './cda:code')
            code_hash = {CodeSystemHelper.code_system_for(raw_tf_code["codeSystemOid"]) => [raw_tf_code["code"]]}
            transfer_from['code_system'] = code_hash.keys.first
            transfer_from['code'] = code_hash[code_hash.keys.first].first
            encounter.transfer_from = transfer_from
          end
        end

      end
    end
  end
end
