module HealthDataStandards
  module Import
    module CCDA
      class ConditionImporter < C32::ConditionImporter
        
        def initialize
          super
          @entry_finder = CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.5' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.5.1']/cda:entry/cda:act/cda:entryRelationship/cda:observation[@duplicate='false']")
          @status_xpath = "./cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.6']/cda:value"
          @laterality_xpath = "./cda:targetSiteCode"
          #optional
          #health status
          #age at onset
        end
        
        def create_entries(doc, nrh = NarrativeReferenceHandler.new)
          mark_duplicate_entries(doc)
          super
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          condition = super
          extract_laterality(entry_element, condition)
          condition
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

        def extract_laterality(entry_element,condition)
          laterality = entry_element.at_xpath(@laterality_xpath)
          if laterality
            # kept to be backward compatible
            # UNISLINK
            # condition.laterality = { 'code_system' => CodeSystemHelper.code_system_for(laterality['codeSystem']), 'code' => laterality['code'] }
            condition.anatomical_location = { 'code_system' => CodeSystemHelper.code_system_for(laterality['codeSystem']), 'code' => laterality['code'] }
          end
        end

        private
        def mark_duplicate_entries(doc)
          ef = CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.5' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.5.1']/cda:entry/cda:act/cda:entryRelationship/cda:observation")
          entries = ef.entries(doc)
          qhMap = {}
          entries.each do |entry|
            keys = []
            statusCode = entry.xpath("cda:statusCode")[0]
            keys << statusCode.attributes["code"].value if statusCode && statusCode.attributes["code"]
          
            effectiveTime = entry.xpath("cda:effectiveTime")[0]
            keys << effectiveTime.attributes["value"].value if effectiveTime && effectiveTime.attributes["value"]
            
            effectiveLowTime = entry.xpath("../../cda:effectiveTime/cda:low | cda:effectiveTime/cda:low")[0]
            keys << effectiveLowTime.attributes["value"].value if effectiveLowTime && effectiveLowTime.attributes["value"]
            
            effectiveHighTime = entry.xpath("../../cda:effectiveTime/cda:high | cda:effectiveTime/cda:high")[0]
            keys << effectiveHighTime.attributes["value"].value if effectiveHighTime && effectiveHighTime.attributes["value"]
            
            icd10ValueNode = entry.xpath("cda:value[@codeSystem='2.16.840.1.113883.6.4']")[0]
            keys << icd10ValueNode.attributes["code"].value if icd10ValueNode && icd10ValueNode.attributes["code"]
            
            icd9ValueNode = entry.xpath("cda:value[@codeSystem='2.16.840.1.113883.6.103']")[0]
            keys << icd9ValueNode.attributes["code"].value if icd9ValueNode && icd9ValueNode.attributes["code"]
            
            snmdValueNode = entry.xpath("cda:value[@codeSystem='2.16.840.1.113883.6.96']")[0]
            keys << snmdValueNode.attributes["code"].value if snmdValueNode && snmdValueNode.attributes["code"]
            
            plainText = keys.flatten.reject { |c| c.blank? }.join(", ")
            qhash = Digest::MD5.hexdigest(plainText)
            entry["duplicate"] = qhMap[qhash] || false
            qhMap[qhash] = true     
          end
          Rails.logger.info "CCDA conditionimporter total #{entries.count} unique #{qhMap.keys.count}"
          qhMap = {}
        end
        
      end
    end
  end
end