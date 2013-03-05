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
            extract_description(reason_element, reason, nrh)
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
      end
    end
  end
end