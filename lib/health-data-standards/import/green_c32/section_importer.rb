require "time"

module HealthDataStandards
  module Import
    module GreenC32
      class SectionImporter
        
        def initialize
          @description = "./gc32:code/gc32:originalText"
          @status = "./gc32:status"
          @value = "./gc32:value"
        end
        
        
        def import(entry_xml)
          generic_import(entry_xml)
        end
        
        def generic_import(element_xml, element_name="entry")
          entry = Entry.new
          element_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          element = element_xml.at_xpath("./gc32:#{element_name}")
          extract_entry(element, entry)
          entry
        end
        
        def extract_code(element, entry, xpath="./gc32:code", attribute=:codes)
          
          code_element = element.at_xpath(xpath)

          return unless code_element

          codes = build_code(code_element)
          
          code_element.xpath("./gc32:translation").each do |trans|
            codes.merge!(build_code(trans))
          end
          
          entry.send("#{attribute}=", codes)
        end
        
        def extract_description(element, entry)
          description = element.at_xpath(@description)
          entry.description = extract_node_text(description)
        end
        
        def extract_status(element, entry)
          status = extract_node_text(element.at_xpath(@status))
          return unless status
          entry.status = status
        end
        
        def extract_effective_time(element, entry)
          if element.at_xpath("./gc32:effectiveTime/gc32:start")
            extract_interval(element,entry)  
          else
            extract_time(element, entry)
          end
        end
        
        def extract_name(element, entry, name_element="name")
          name_element = element.at_xpath("./gc32:#{name_element}")
          return unless name_element
          entry.title = name_element.at_xpath("./gc32:title").try(:content)
          entry.given_name = name_element.at_xpath("./gc32:givenName").try(:content)
          entry.family_name = name_element.at_xpath("./gc32:familyName").try(:content)
        end
        
        def extract_time(element, entry, xpath = "./gc32:effectiveTime", attribute = "time")
          datetime = element.at_xpath(xpath)
          
          return unless datetime && datetime['value']
          
          entry.send("#{attribute}=", Time.parse(datetime['value']).utc.to_i)
        end
        
        def extract_interval(element, entry, element_name="effectiveTime")
          extract_time(element, entry, "./gc32:#{element_name}/gc32:start", "start_time")
          extract_time(element, entry, "./gc32:#{element_name}/gc32:end", "end_time")
        end
        
        def extract_quantity(element, xpath)
          value_element = element.at_xpath(xpath)
          
          return unless value_element
          
          node_value = extract_node_attribute(value_element, "amount", true)
          node_units = extract_node_attribute(value_element, "unit")
          
          return {} unless node_value
          
          {"scalar" => node_value, "units" => node_units}
        end
        
        def extract_value(element, entry)
          pq = extract_quantity(element, @value)
          if pq.present?
            entry.values << PhysicalQuantityResultValue.new(pq)
          end
        end
        
        def extract_entry(element, entry)
          extract_code(element, entry)
          extract_description(element, entry)
          extract_status(element, entry)
          extract_value(element, entry)
          extract_effective_time(element, entry)
          entry.free_text = element.at_xpath("./gc32:freeText").try(:inner_text)
          entry
        end
        
        def extract_organization(organization_element)
          org_id = extract_node_text(organization_element.xpath("./gc32:id"))
          organization = org_id ? Organization.find(org_id) : Organization.new
          organization ||= Organization.new
          # if organization.new_record?
          # else
            organization.name = extract_node_text(organization_element.xpath("./gc32:name"))
            organization.addresses = organization_element.xpath("./gc32:address").map { |addr| extract_address(addr)  }
            organization.telecoms = organization_element.xpath("./gc32:telecom").map { |tele| extract_telecom(tele) }
            # organization.save!
          # end
          
          return organization
        end

        def extract_facility(facility_element)
          facility = Facility.new
          facility.name = extract_node_text(facility_element.xpath("./gc32:name"))
          facility.addresses = facility_element.xpath("./gc32:address").map { |addr| extract_address(addr)  }
          facility.telecoms = facility_element.xpath("./gc32:telecom").map { |tele| extract_telecom(tele) }
          start_time = facility_element.at_xpath("./gc32:duration/gc32:start").try(:text)
          if start_time
            facility.start_time = Time.parse(start_time).utc.to_i
          end
          end_time = facility_element.at_xpath("./gc32:duration/gc32:end").try(:text)
          if end_time
            facility.end_time = Time.parse(end_time).utc.to_i
          end
          facility
        end
        
        def extract_address(address_element)
          return unless address_element
          address = Address.new
          address.use = address_element['use']
          address.street = address_element.xpath("./gc32:street").map { |st| extract_node_text(st)  }
          address.city = extract_node_text(address_element.xpath("./gc32:city"))
          address.state = extract_node_text(address_element.xpath("./gc32:state"))
          address.zip = extract_node_text(address_element.xpath("./gc32:postalCode"))
          address
        end
        
        def extract_telecom(telecom_element)
          return unless telecom_element
          telecom = Telecom.new
          telecom.use = extract_node_attribute(telecom_element, :type)
          telecom.value = extract_node_attribute(telecom_element, :value)
          telecom.preferred = extract_node_attribute(telecom_element, :preferred)
          telecom
        end
        
        def extract_free_text(element, entry, free_text_element="freeText")
          entry.free_text = extract_node_text(element.at_xpath("./gc32:#{free_text_element}"))
        end
                
        private
        
        def build_code(code_element)
          code_system_oid = extract_node_attribute(code_element, "codeSystem")
          code = extract_node_attribute(code_element, "code")
          code_system = HealthDataStandards::Util::CodeSystemHelper.code_system_for(code_system_oid)
          {code_system => [code]}
        end
        
        def extract_node_attribute(node, attribute_name, to_num=false)
          return if node.nil? || (node.respond_to?(:empty?) && node.empty?)
          attribute = node.attribute(attribute_name.to_s)
          value = attribute ? attribute.value : nil
          return unless value && value != ""
          to_num ? value.to_f : value
        end
        
        def extract_node_text(node)
          node ? node.inner_text : nil
        end
      end
    end
  end
end