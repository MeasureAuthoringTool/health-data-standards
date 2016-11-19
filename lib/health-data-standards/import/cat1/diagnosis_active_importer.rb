module HealthDataStandards
  module Import
    module Cat1
      class DiagnosisActiveImporter < CDA::ConditionImporter

        def initialize(entry_finder=CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.11']"))
          super(entry_finder)
          @status_xpath = nil # We'll hardcode this to active in create entry because this is from the 
                              # diagnosis active template
          @severity_xpath = "./cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.8']/cda:value"                    
          @laterality_xpath = "./cda:value/cda:qualifier[cda:name/@code='182353008']/cda:value"
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          condition = super(entry_element,nrh)
          extract_severity(entry_element,condition)
          extract_laterality(entry_element,condition)
          condition
        end
      end
    end
  end
end