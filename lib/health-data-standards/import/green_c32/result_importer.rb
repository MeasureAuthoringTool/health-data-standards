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
          
          lab_result = LabResult.new(reference_range: extract_node_text(result.xpath(@range)))
          
          extract_status(result, lab_result)
          extract_code(result, lab_result)
          extract_description(result, lab_result)
          extract_time(result, lab_result)
          extract_value(result, lab_result)
          extract_code(result, lab_result, @interpretation, :interpretation)
              
          lab_result
        end
        
      end
    end
  end
end