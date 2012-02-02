module HealthDataStandards
  module Import
    module GreenCda
      class SectionImporter
        
        def initialize()
          
        end
        
        def extract_code(element, entry, attribute=:codes)
          return unless element
          
          code_system_oid = extract_attribute(element, "codeSystem")
          code = extract_attribute(element, "code")
          code_system = HealthDataStandards::Util::CodeSystemHelper.code_system_for(code_system_oid)
          codes = {code_system => [code]}
          if entry.is_a?(Hash)
            entry.send(attribute).merge!(codes)
          else
            entry.send("#{attribute}=", codes)
          end
        end
        
        
        def extract_attribute(node, attribute_name, to_num=false)
          return if node.nil? || (node.respond_to?(:empty?) && node.empty?)
          # binding.pry
          attribute = node.attribute(attribute_name.to_s)
          value = attribute ? attribute.value : nil
          return unless value && value != ""
          to_num ? value.to_f : value
        end
        
        def extract_node_text(node)
          node ? node.inner_text : nil
        end
        
        def extract_value(element, entry)
          value_element = element.xpath("./green:resultValue[1]/*").first
          
          return unless value_element
          
          node_value = extract_attribute(value_element, "value", true)
          
          value = case value_element.name
            when "physicalQuantity"

                {"scalar" => node_value, "units" => extract_attribute(value_element, "unit") }
            when "integer"
              node_value ? {'scalar' => node_value.to_i} : {}
            else
              puts "Value type #{value_element.name} not yet supported"  
            end
          entry.value = value
        end
      end
    end
  end
end