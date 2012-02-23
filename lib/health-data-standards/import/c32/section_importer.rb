module HealthDataStandards
  module Import
    module C32
      # Class that can be used to create an importer for a section of a HITSP C32 document. It usually
      # operates by selecting all CDA entries in a section and then creates entries for them.
      class SectionImporter
        include HealthDataStandards::Util
        
        attr_accessor :check_for_usable
        # Creates a new SectionImporter
        # @param [Hash] id_map A hash of all ID tags to values for the enclosing document.  Used to look up descriptions.
        # @param [String] entry_xpath An XPath expression that can be used to find the desired entries
        # @param [String] code_xpath XPath expression to find the code element as a child of the desired CDA entry.
        #        Defaults to "./cda:code"
        # @param [String] status_xpath XPath expression to find the status element as a child of the desired CDA
        #        entry. Defaults to nil. If not provided, a status will not be checked for since it is not applicable
        #        to all enrty types
        def initialize(entry_xpath, code_xpath="./cda:code", status_xpath=nil, description_xpath="./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] ")
          @entry_xpath = entry_xpath
          @code_xpath = code_xpath
          @status_xpath = status_xpath
          @description_xpath = description_xpath
          @check_for_usable = true               # Pilot tools will set this to false
        end

        # @param [String] tag
        # @param [Hash] id_map A map of ids to all tagged text in the narrative portion of a document
        # @return [String] text description of tag
        def lookup_tag(tag, id_map)
           value = id_map[tag]
           # Not sure why, but sometimes the reference is #<Reference> and the ID value is <Reference>, and 
           # sometimes it is #<Reference>.  We look for both.
           if !value and tag[0] == '#'  
             tag = tag[1,tag.length]
             value = id_map[tag]
           end

           value
         end

        # Traverses that HITSP C32 document passed in using XPath and creates an Array of Entry
        # objects based on what it finds                          
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        #        measure definition
        # @return [Array] will be a list of Entry objects
        def create_entries(doc,id_map = {})
          entry_list = []
          entry_elements = doc.xpath(@entry_xpath)
          entry_elements.each do |entry_element|
            entry = Entry.new
            extract_codes(entry_element, entry)
            extract_dates(entry_element, entry)
            extract_value(entry_element, entry)
            if @status_xpath
              extract_status(entry_element, entry)
            end
            if @description_xpath
              extract_description(entry_element, entry, id_map)
            end
            if @check_for_usable
              entry_list << entry if entry.usable?
            else
              entry_list << entry
            end
          end
          entry_list
        end

        private

        def extract_status(parent_element, entry)
          status_element = parent_element.at_xpath(@status_xpath)
          if status_element
            case status_element['code']
            when '55561003'
              entry.status = :active
            when '73425007'
              entry.status = :inactive
            when '413322009'      
              entry.status = :resolved
            end
          end
        end

        def extract_description(parent_element, entry, id_map)
          code_elements = parent_element.xpath(@description_xpath)
          code_elements.each do |code_element|
            tag = code_element['value']
            entry.description = lookup_tag(tag, id_map)
          end
        end

        def extract_codes(parent_element, entry)
          code_elements = parent_element.xpath(@code_xpath)
          code_elements.each do |code_element|
            add_code_if_present(code_element, entry)
            translations = code_element.xpath('cda:translation')
            translations.each do |translation|
              add_code_if_present(translation, entry)
            end
          end
        end

        def add_code_if_present(code_element, entry)
          if code_element['codeSystem'] && code_element['code']
            entry.add_code(code_element['code'], CodeSystemHelper.code_system_for(code_element['codeSystem']))
          end
        end

        def extract_dates(parent_element, entry)
          if parent_element.at_xpath('cda:effectiveTime')
            entry.time = HL7Helper.timestamp_to_integer(parent_element.at_xpath('cda:effectiveTime')['value'])
          end
          if parent_element.at_xpath('cda:effectiveTime/cda:low')
            entry.start_time = HL7Helper.timestamp_to_integer(parent_element.at_xpath('cda:effectiveTime/cda:low')['value'])
          end
          if parent_element.at_xpath('cda:effectiveTime/cda:high')
            entry.end_time = HL7Helper.timestamp_to_integer(parent_element.at_xpath('cda:effectiveTime/cda:high')['value'])
          end
          if parent_element.at_xpath('cda:effectiveTime/cda:center')
            entry.time = HL7Helper.timestamp_to_integer(parent_element.at_xpath('cda:effectiveTime/cda:center')['value'])
          end
        end

        def extract_value(parent_element, entry)
          value_element = parent_element.at_xpath('cda:value')
          if value_element
            value = value_element['value']
            unit = value_element['unit']
            if value
              entry.set_value(value, unit)
            end
          end
        end
        
        def import_actor(actor_element)
          actor_hash = {}
          npi = actor_element.xpath("./cda:assignedEntity/cda:id[@root='2.16.840.1.113883.4.6' or @root='2.16.840.1.113883.3.72.5.2']/@extension")
          actor_hash[:npi] = npi.text if npi && Provider.valid_npi?(npi)
          addresses = actor_element.xpath("./cda:assignedEntity/cda:addr").try(:map) {|ae| import_address(ae)}
          telecoms = actor_element.xpath("./cda:assignedEntity/cda:telecom").try(:map) {|te| import_telecom(te)}
          person_element = actor_element.at_xpath("./cda:assignedEntity/cda:assignedPerson")
          if person_element
            actor_hash['person'] = import_person(person_element)
            actor_hash['person']['addresses'] = addresses
            actor_hash['person']['telecoms'] = telecoms
          end
          organization_element = actor_element.at_xpath("./cda:assignedEntity/cda:assignedOrganization")
          if organization_element
            actor_hash['organization'] = import_organization(organization_element)
          end

          actor_hash
        end

        def import_person(person_element)
          person_hash = {}
          name_element = person_element.at_xpath("./cda:name")
          person_hash['name'] = name_element.try(:text)
          person_hash['first'] = name_element.at_xpath("./cda:given").try(:text)
          person_hash['last'] = name_element.at_xpath("./cda:family").try(:text)
          person_hash
        end

        def import_address(address_element)
          address_hash = {}
          address_hash['streetAddress'] = [address_element.at_xpath("./cda:streetAddressLine").try(:text)]
          address_hash['city'] = address_element.at_xpath("./cda:city").try(:text)
          address_hash['stateOrProvince'] = address_element.at_xpath("./cda:state").try(:text)
          address_hash['zip'] = address_element.at_xpath("./cda:postalCode").try(:text)
          address_hash['country'] = address_element.at_xpath("./cda:country").try(:text)
          address_hash
        end

        def import_telecom(telecom_element)
          telecom_hash = {}
          telecom_hash['value'] = telecom_element['value']
          telecom_hash['use'] = telecom_element['use']
          telecom_hash
        end

        def import_organization
          # TODO: Implement when the Patient API has an implementation of
          # organization
        end

        def extract_code(parent_element, code_xpath, code_system=nil)
          code_element = parent_element.at_xpath(code_xpath)
          code_hash = nil
          if code_element
            code_hash = {'code' => code_element['code']}
            if code_system
              code_hash['codeSystem'] = code_system
            else
              code_hash['codeSystemOid'] = code_element['codeSystem']
              code_hash['codeSystem'] = CodeSystemHelper.code_system_for(code_hash['codeSystemOid'])
            end
          end

          code_hash
        end

        def extract_scalar(parent_element, scalar_xpath)
          scalar_element = parent_element.at_xpath(scalar_xpath)
          if scalar_element
            {'unit' => scalar_element['unit'], 'value' => scalar_element['value'].to_i}
          else
            nil
          end
        end
      end
    end
  end
end

