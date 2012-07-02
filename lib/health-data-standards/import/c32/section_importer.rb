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
        def initialize(entry_xpath, code_xpath="./cda:code", status_xpath=nil,priority_xpath=nil, description_xpath="./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] ")
          @entry_xpath = entry_xpath
          @code_xpath = code_xpath
          @status_xpath = status_xpath
          @priority_xpath = priority_xpath
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
            entry = create_entry(entry_element, id_map)
            if @check_for_usable
              entry_list << entry if entry.usable?
            else
              entry_list << entry
            end
          end
          entry_list
        end
        
        def create_entry(entry_element, id_map={})
          entry = Entry.new
          extract_codes(entry_element, entry)
          extract_dates(entry_element, entry)
          extract_value(entry_element, entry)
          if @status_xpath
            extract_status(entry_element, entry)
          end
          if @priority_xpath
              extract_priority(entry_element, entry)
            end
          if @description_xpath
            extract_description(entry_element, entry, id_map)
          end
          entry
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

        def extract_priority(parent_element, entry)
          priority_element = parent_element.at_xpath(@priority_xpath)
          if priority_element
            case priority_element['code']
            when '8319008'
              entry.ordinality = :principal
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

        def extract_dates(parent_element, entry, element_name="effectiveTime")
          if parent_element.at_xpath("cda:#{element_name}")
            entry.time = HL7Helper.timestamp_to_integer(parent_element.at_xpath("cda:#{element_name}")['value'])
          end
          if parent_element.at_xpath("cda:#{element_name}/cda:low")
            entry.start_time = HL7Helper.timestamp_to_integer(parent_element.at_xpath("cda:#{element_name}/cda:low")['value'])
          end
          if parent_element.at_xpath("cda:#{element_name}/cda:high")
            entry.end_time = HL7Helper.timestamp_to_integer(parent_element.at_xpath("cda:#{element_name}/cda:high")['value'])
          end
          if parent_element.at_xpath("cda:#{element_name}/cda:center")
            entry.time = HL7Helper.timestamp_to_integer(parent_element.at_xpath("cda:#{element_name}/cda:center")['value'])
          end
        end

        def extract_value(parent_element, entry)
          value_element = parent_element.at_xpath('cda:value')
          if value_element
            value = value_element['value']
            unit = value_element['unit']
            value ||= value_element.text 
            if value
              entry.set_value(value.strip, unit)
            end
            
          end
        end
        
        def import_actor(actor_element)
          return ProviderImporter.instance.extract_provider(actor_element)
        end
        
        def import_organization(organization_element)
          return OrganizationImporter.instance.extract_organization(organization_element)
        end

        def import_person(person_element)
          return unless person_element
          person = Person.new
          name_element = person_element.at_xpath("./cda:name")
          if name_element
            person.title = name_element.at_xpath("./cda:title").try(:text)
            person.given_name = name_element.at_xpath("./cda:given").try(:text)
            person.family_name = name_element.at_xpath("./cda:family").try(:text)
          end
          person.addresses = person_element.xpath("./cda:addr").map { |addr| import_address(addr) }
          person.telecoms = person_element.xpath("./cda:telecom").map { |tele| import_telecom(tele) } 
          return person
        end

        def import_address(address_element)
          address = Address.new
          address.street = [address_element.at_xpath("./cda:streetAddressLine").try(:text)]
          address.city = address_element.at_xpath("./cda:city").try(:text)
          address.state = address_element.at_xpath("./cda:state").try(:text)
          address.zip = address_element.at_xpath("./cda:postalCode").try(:text)
          address.country = address_element.at_xpath("./cda:country").try(:text)
          address
        end

        def import_telecom(telecom_element)
          tele = Telecom.new
          tele.value = telecom_element['value']
          tele.use = telecom_element['use']
          tele
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

