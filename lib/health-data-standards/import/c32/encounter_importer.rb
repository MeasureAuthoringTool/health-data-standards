module HealthDataStandards
  module Import
    module C32
      # TODO Extract Discharge Disposition
      class EncounterImporter < SectionImporter
    
        def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.127']/cda:entry/cda:encounter"
          @code_xpath = "./cda:code"
          @status_xpath = "./cda:statusCode"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value]"
          @reason_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:act"
          @check_for_usable = true               # Pilot tools will set this to false
          @id_map = {}
        end
    
        # Traverses that HITSP C32 document passed in using XPath and creates an Array of Entry
        # objects based on what it finds                          
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        #        measure definition
        # @return [Array] will be a list of Entry objects
        def create_entries(doc,id_map = {})
          encounter_list = []
          entry_elements = doc.xpath(@entry_xpath)
          entry_elements.each do |entry_element|
            encounter = create_entry(entry_element, id_map={})
            if @check_for_usable
              encounter_list << encounter if encounter.usable?
            else
              encounter_list << encounter
            end
          end
          encounter_list
        end
        
        def create_entry(entry_element, id_map={})
          encounter = Encounter.new
          extract_codes(entry_element, encounter)
          extract_dates(entry_element, encounter)
          extract_description(entry_element, encounter, id_map)
          extract_performer(entry_element, encounter)
          extract_facility(entry_element, encounter)
          extract_reason(entry_element, encounter, id_map)
          extract_admission(entry_element, encounter)
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
            org = Organization.new(name: participant_element.at_xpath("./cda:playingEntity/cda:name").try(:text))
            org.addresses = participant_element.xpath("./cda:addr").try(:map) {|ae| import_address(ae)}
            org.telecoms = participant_element.xpath("./cda:telecom").try(:map) {|te| import_telecom(te)}
            encounter.facility = org
          end
        end
    
        def extract_reason(parent_element, encounter, id_map)
          reason_element = parent_element.at_xpath(@reason_xpath)
          if reason_element
            reason = Entry.new
            extract_codes(reason_element, reason)
            extract_description(reason_element, reason, id_map)
            extract_status(reason_element, reason)
            extract_dates(reason_element, reason)
            encounter.reason = reason
          end
        end
    
        def extract_admission(parent_element, encounter)
          encounter.admit_type = extract_code(parent_element, "./cda:priorityCode")
        end
      end
    end
  end
end