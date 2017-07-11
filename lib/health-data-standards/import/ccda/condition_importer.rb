module HealthDataStandards
  module Import
    module CCDA
      class ConditionImporter < C32::ConditionImporter
        
        def initialize
          super
          @entry_finder = CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.5' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.5.1']/cda:entry/cda:act/cda:entryRelationship/cda:observation")
          @status_xpath = "./cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.6']/cda:value"
          
          #optional
          #health status
          #age at onset
        end

        def extract_dates(parent_element, entry, element_name="effectiveTime")
          super
          if parent_element.at_xpath("../../cda:#{element_name}/cda:low")
            entry[:start_time] = HL7Helper.timestamp_to_integer(parent_element.at_xpath("../../cda:#{element_name}/cda:low")['value'])
          end
          if parent_element.at_xpath("../../cda:#{element_name}/cda:high")
            entry[:end_time] = HL7Helper.timestamp_to_integer(parent_element.at_xpath("../../cda:#{element_name}/cda:high")['value'])
          end
        end
        
      end
    end
  end
end