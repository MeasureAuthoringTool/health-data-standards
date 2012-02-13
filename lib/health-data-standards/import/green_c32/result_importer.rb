module HealthDataStandards
  module Import
    module GreenC32
      class ResultImporter < SectionImporter
        include Singleton
        
        def initialize
          super
          @range = "./gc32:referenceRange"
          @interpretation = "./gc32:interpretation"
        end
        
        def import(result)
          result.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          
          result_element = result.xpath("./gc32:result")
          lab_result = LabResult.new(reference_range: extract_node_text(result_element.xpath(@range)))
          
          extract_entry(result_element, lab_result)
          extract_time(result_element, lab_result)
          extract_value(result_element, lab_result)
          extract_code(result_element, lab_result, @interpretation, :interpretation)
              
          lab_result
        end
        
      end
    end
  end
end