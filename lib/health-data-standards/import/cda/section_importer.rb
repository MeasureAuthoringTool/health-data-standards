module HealthDataStandards
  module Import
    module CDA
      class SectionImporter
        attr_accessor :check_for_usable, :status_xpath, :code_xpath

        include HealthDataStandards::Util
        include LocatableImportUtils

        def initialize(entry_finder)
          @entry_finder = entry_finder
          @code_xpath = "./cda:code"
          @id_xpath = "./cda:id"
          @status_xpath = nil
          @priority_xpath = nil
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value]"
          @check_for_usable = true
          @entry_class = Entry
          @value_xpath = 'cda:value'
        end

        # Traverses an HL7 CDA document passed in and creates an Array of Entry
        # objects based on what it finds                          
        # @param [Nokogiri::XML::Document] doc It is expected that the root node of this document
        #        will have the "cda" namespace registered to "urn:hl7-org:v3"
        #        measure definition
        # @return [Array] will be a list of Entry objects
        def create_entries(doc, nrh = NarrativeReferenceHandler.new)
          entry_list = []
          entry_elements = @entry_finder.entries(doc)
          entry_elements.each do |entry_element|
            entry = create_entry(entry_element, nrh)
            if @check_for_usable
              entry_list << entry if entry.usable?
            else
              entry_list << entry
            end
          end
          entry_list
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          entry = @entry_class.new
          extract_id(entry_element, entry)
          extract_codes(entry_element, entry)
          extract_dates(entry_element, entry)
          if @value_xpath
            extract_value(entry_element, entry)
          end
          entry.free_text = entry_element.at_xpath("./cda:text").try("text")
          if @status_xpath
            extract_status(entry_element, entry)
          end
          if @description_xpath
            extract_description(entry_element, entry, nrh)
          end
          entry
        end

        private

        def extract_status(parent_element, entry)
          status_element = parent_element.at_xpath(@status_xpath)
          if status_element
            entry.status_code = {CodeSystemHelper.code_system_for(status_element['codeSystem']) => [status_element['code']]}
          end
        end

        def extract_id(parent_element, entry)
          id_element = parent_element.at_xpath(@id_xpath)
          if id_element
            identifier = CDAIdentifier.new
            identifier.root = id_element['root']
            identifier.extension = id_element['extension']
            entry.cda_identifier = identifier
          end
        end

        def extract_description(parent_element, entry, nrh)
          code_elements = parent_element.xpath(@description_xpath)
          code_elements.each do |code_element|
            tag = code_element['value']
            entry.description = nrh.lookup_tag(tag)
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
          if parent_element.at_xpath("cda:#{element_name}/@value")
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
          value_element = parent_element.at_xpath(@value_xpath)
          if value_element
            value = value_element['value']
            if value.present?
              unit = value_element['unit']
              entry.set_value(value.strip, unit)
            elsif value_element['code'].present?
              crv = CodedResultValue.new
              add_code_if_present(value_element, crv)
              entry.values << crv
            else
              value = value_element.text
              unit = value_element['unit']
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

        def extract_negation(parent_element, entry)
          negation_indicator = parent_element['negationInd']
          unless negation_indicator.nil?
            entry.negation_ind = negation_indicator.eql?('true')
            if entry.negation_ind
              negation_reason_element = parent_element.at_xpath("./cda:entryRelationship[@typeCode='RSON']/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.27']/cda:code")
              if negation_reason_element
                code_system_oid = negation_reason_element['codeSystem']
                code = negation_reason_element['code']
                code_system = HealthDataStandards::Util::CodeSystemHelper.code_system_for(code_system_oid)
                entry.negation_reason = {'code' => code, 'codeSystem' => code_system}
              end
            end
          end
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