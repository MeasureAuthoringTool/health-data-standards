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
        
        def extract_code(element, entry, xpath="./gc32:code", attribute=:codes)
          
          code_element = element.xpath(xpath).first

          return unless code_element

          codes = build_code(code_element)
          
          code_element.xpath("./gc32:translation").each do |trans|
            codes.merge!(build_code(trans))
          end
          
          entry.send("#{attribute}=", codes)
        end
        
        def extract_description(element, entry)
          description = element.xpath(@description).first
          entry.description = extract_node_text(description)
        end
        
        def extract_status(element, entry)
          status = extract_node_text(element.xpath(@status).first)
          return unless status
          entry.status = status
        end
        
        def extract_time(element, entry, xpath = "./gc32:effectiveTime", attribute = "time")
          datetime = element.xpath(xpath).first
          return unless datetime && !datetime.inner_text.empty?
          entry.send("#{attribute}=", Time.parse(datetime.inner_text).to_i)
        end
        
        def extract_interval(element, entry)
          extract_time(element, entry, "./gc32:effectiveTime/gc32:start", "start_time")
          extract_time(element, entry, "./gc32:effectiveTime/gc32:end", "end_time")
        end
        
        def extract_value(element, entry)
          
          value_element = element.xpath(@value).first
          
          return unless value_element
          
          node_value = extract_node_attribute(value_element, "amount", true)
          node_units = extract_node_attribute(value_element, "unit")
          
          entry.value = {'scalar' => node_value, "unit" => node_units} if node_value

        end
        
        def extract_entry(element, entry)
          extract_code(element, entry)
          extract_description(element, entry)
          extract_status(element, entry)
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