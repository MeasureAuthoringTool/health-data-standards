module HealthDataStandards
  module Import
    module Cat1
      class ProcedurePerformedImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("//cda:procedure[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.64']"))
          super(entry_finder)
          @entry_class = Procedure
          @ordinality_xpath = "./cda:priorityCode"
        end
        
        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          procedure = super
          extract_ordinality(entry_element, procedure)
          procedure
        end

        private

        def extract_ordinality(parent_element, procedure)
          ordinality_element = parent_element.at_xpath(@ordinality_xpath)
          if ordinality_element
            procedure.ordinality = {CodeSystemHelper.code_system_for(ordinality_element['codeSystem']) => [ordinality_element['code']]}
          end
        end
      end
    end
  end
end