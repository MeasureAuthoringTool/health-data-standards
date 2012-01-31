module HealthDataStandards
  module Import
    module GreenCda
      class ResultImporter < SectionImporter
        include Singleton
        
        def initialize
          @range = "./green:resultReferenceRange"
          @code = "./green:resultType"
          @status = "./green:resultStatus"
          @description = "./green:resultType"
          @interpretation = "./green:resultInterpretation"
        end
        
        def import(result)
          range = extract_node_text(result.xpath(@range).first)
          status = extract_attribute(result.xpath(@status).first, "code")
          description = extract_attribute(result.xpath(@description), 'displayName')
          
          lab_result = LabResult.new(description: description, reference_range: range, status: status, interpretation: {})
          
          extract_code(result.xpath(@interpretation).first, lab_result, :interpretation)
          extract_code(result.xpath(@code).first, lab_result)
          
          extract_value(result, lab_result)
          lab_result
        end
        
      end
    end
  end
end