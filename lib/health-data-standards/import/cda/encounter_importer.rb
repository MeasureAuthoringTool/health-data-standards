module HealthDataStandards
  module Import
    module CDA
      # TODO Extract Discharge Disposition
      class EncounterImporter < SectionImporter
    
        def initialize(entry_finder=EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.127']/cda:entry/cda:encounter"))
          super(entry_finder)
          @reason_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:act"
          @entry_class = Encounter
        end
        
        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          encounter = super
          extract_performer(entry_element, encounter)
          extract_facility(entry_element, encounter)
          extract_reason(entry_element, encounter, nrh)
          extract_negation(entry_element, encounter)
          extract_admission(entry_element, encounter)
          extract_discharge_disposition(entry_element, encounter)
          extract_transfers(entry_element, encounter)
          encounter
        end
    
        private
    
        def extract_performer(parent_element, encounter)
          performer_element = parent_element.at_xpath("./cda:performer")
          encounter.performer = import_actor(performer_element) if performer_element
        end

        def extract_facility(parent_element, encounter)
          participant_element = parent_element.at_xpath("./cda:participant[@typeCode='LOC']/cda:participantRole[@classCode='SDLOC']")
          if (participant_element)
            facility = Facility.new(name: participant_element.at_xpath("./cda:playingEntity/cda:name").try(:text))
            facility.addresses = participant_element.xpath("./cda:addr").try(:map) {|ae| import_address(ae)}
            facility.telecoms = participant_element.xpath("./cda:telecom").try(:map) {|te| import_telecom(te)}
            facility.code = extract_code(participant_element, './cda:code')
            extract_dates(participant_element.parent, facility, "time")
            encounter.facility = facility
          end
        end
    
        def extract_reason(parent_element, encounter, nrh)
          reason_element = parent_element.at_xpath(@reason_xpath)
          if reason_element
            reason = Entry.new
            extract_codes(reason_element, reason)
            extract_reason_description(reason_element, reason, nrh)
            extract_status(reason_element, reason)
            extract_dates(reason_element, reason)
            encounter.reason = reason
          end
        end
    
        def extract_admission(parent_element, encounter)
          encounter.admit_type = extract_code(parent_element, "./cda:priorityCode")
        end

        def extract_discharge_disposition(parent_element, encounter)
          encounter.discharge_time = encounter.end_time
          encounter.discharge_disposition = extract_code(parent_element, "./sdtc:dischargeDispositionCode")
        end

        def extract_transfers(parent_element, encounter)
          transfer_from_element = parent_element.at_xpath("./cda:participant[@typeCode='ORG']")
          if (transfer_from_element)
            transfer_from = Transfer.new(time: transfer_from_element.at_xpath("./cda:time")['value'])
            transfer_from_subelement = transfer_from_element.at_xpath("./cda:participantRole[@classCode='LOCE']")
            raw_tf_code = extract_code(transfer_from_subelement, './cda:code')
            code_hash = {CodeSystemHelper.code_system_for(raw_tf_code["codeSystemOid"]) => [raw_tf_code["code"]]}
            transfer_from.codes = code_hash
            encounter.transfer_from = transfer_from
          end

          transfer_to_element = parent_element.at_xpath("./cda:participant[@typeCode='DST']")
          if (transfer_to_element)
            transfer_to = Transfer.new(time: transfer_to_element.at_xpath("./cda:time")['value'])
            transfer_to_subelement = transfer_to_element.at_xpath("./cda:participantRole[@classCode='LOCE']")
            raw_tt_code = extract_code(transfer_to_subelement, './cda:code')
            code_hash = {CodeSystemHelper.code_system_for(raw_tt_code["codeSystemOid"]) => [raw_tt_code["code"]]}
            transfer_to.codes = code_hash
            encounter.transfer_to = transfer_to
          end
        end
      end
    end
  end
end