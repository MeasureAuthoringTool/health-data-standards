module HealthDataStandards
  module Import
    module Cat1
      class DiagnosisActiveImporter < CDA::ConditionImporter

        def initialize
          super(CDA::EntryFinder.new("./cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.11']"))
          @status_xpath = nil # We'll hardcode this to active in create entry because this is from the 
                              # diagnosis active template
          @severity_xpath = "./cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.8']/cda:value"                    
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          condition = super(entry_element,nrh)
          extract_severity(entry_element,condition)
          condition
        end

        def extract_severity(entry_element,condition)
          severity = entry_element.at_xpath(@severity_xpath)
          if(severity)
            condition.severity = {CodeSystemHelper.code_system_for(severity['codeSystem']) => [severity['code']]}
          end
        end
      end
    end
  end
end