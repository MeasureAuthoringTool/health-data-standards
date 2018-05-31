module HealthDataStandards
  module Import
    module CDA
      class ResultImporter < SectionImporter
        def initialize(entry_finder=EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.15.1'] | //cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.15']"))
          super(entry_finder)
          @entry_class = LabResult
          @value_xpath = "cda:value | ./cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.87']/cda:value"
        end
        
        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          result = super
          extract_interpretation(entry_element, result)
          extract_reference_range(entry_element, result)
          extract_reason_or_negation(entry_element, result)
          extract_reason_description(entry_element, result, nrh)
          result
        end
    
        private
        def extract_interpretation(parent_element, result)
          interpretation_element = parent_element.at_xpath("./cda:interpretationCode")
          if interpretation_element
            code = interpretation_element['code']
            code_system = CodeSystemHelper.code_system_for(interpretation_element['codeSystem'])
            result.interpretation = {'code' => code, 'codeSystem' => code_system}
          end
        end

        def extract_reference_range(parent_element, result)
          result.reference_range = parent_element.at_xpath("./cda:referenceRange/cda:observationRange/cda:text").try(:text)
        end
    
      end
    end
  end
end