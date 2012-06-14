module HealthDataStandards
  module Import
    module GreenC32
      class ConditionImporter < SectionImporter
        include Singleton
        
        def initialize
          super
        end
        
        def import(condition_xml)
          condition_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          condition_element = condition_xml.xpath("./gc32:condition")
          
          condition = Condition.new

          extract_entry(condition_element, condition)
          extract_cause_of_death(condition_element, condition)
          extract_type(condition_element, condition)
          
          condition
        end
        
        private
        
        def extract_type(condition_xml, condition)
          type = condition_xml.xpath("./gc32:type").first
          condition.type = extract_node_text(type)
        end
        
        def extract_cause_of_death(condition_xml, condition)
          condition.cause_of_death = extract_node_attribute(condition_xml, "causeOfDeath")
        end
        
      end
    end
  end
end