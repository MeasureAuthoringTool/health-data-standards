module HealthDataStandards
  module Import
    module GreenC32
      class ProcedureImporter < SectionImporter
        
        include Singleton
        
        def initialize
          super
        end
        
        def import(procedure_xml)
          procedure_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          
          procedure_element = procedure_xml.xpath("./gc32:procedure")
          
          procedure = Procedure.new
          
          extract_entry(procedure_element, procedure)
          extract_code(procedure_element, procedure, xpath="./gc32:site", attribute=:site)
          procedure
        end

      end
    end
  end
end