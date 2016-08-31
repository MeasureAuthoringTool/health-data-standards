module HealthDataStandards
  module Import
    module CDA
      class ProcedureImporter < SectionImporter

        #scoped to not look in the plan of care section so planned procedures do not end up mixed with
        #past procedures
        def initialize(entry_finder=EntryFinder.new("//cda:section[cda:templateId/@root!='2.16.840.1.113883.3.88.11.83.124']//cda:procedure"))
          super(entry_finder)
          @entry_class = Procedure
          @value_xpath = "./cda:value | ./cda:entryRelationship[@typeCode='REFR']/cda:observation/cda:value"
          @ordinality_xpath = "./cda:priorityCode"
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          procedure = super
          extract_ordinality(entry_element, procedure)
          extract_performer(entry_element, procedure)
          extract_anatomical_target(entry_element, procedure)
          extract_reason_or_negation(entry_element, procedure)
          extract_scalar(entry_element, procedure)
          procedure
        end

        private

        def extract_ordinality(parent_element, procedure)
          ordinality_element = parent_element.at_xpath(@ordinality_xpath)
          if ordinality_element
            procedure.ordinality = {"code" => ordinality_element['code'], "code_system" => CodeSystemHelper.code_system_for(ordinality_element['codeSystem']), "codeSystemName" => CodeSystemHelper.code_system_for(ordinality_element['codeSystem']), CodeSystemHelper.code_system_for(ordinality_element['codeSystem']) => [ordinality_element['code']]}
          end
        end

        def extract_performer(parent_element, procedure)
          performer_element = parent_element.at_xpath("./cda:performer")
          procedure.performer = import_actor(performer_element) if performer_element
        end

        def extract_anatomical_target(parent_element, procedure)
          procedure.anatomical_target = extract_code(parent_element, "./cda:targetSiteCode")
        end

        def extract_scalar(parent_element, procedure)
          return unless scalar_element = parent_element.at_xpath("./cda:value")
          case scalar_element["xsi:type"]
          when "PQ"
            procedure.set_value scalar_element['value'].to_i, scalar_element['unit']
          when "BL"
            procedure.set_value scalar_element['value']
          when "ST"
            procedure.set_value scalar_element.content
          end
        end
      end
    end
  end
end