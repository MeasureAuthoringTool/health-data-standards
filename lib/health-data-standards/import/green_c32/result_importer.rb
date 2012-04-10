module HealthDataStandards
  module Import
    module GreenC32
      class ResultImporter < SectionImporter

        include Singleton
        
        #-------------------------------------------------------------------------------

        def initialize
          super
          @range = "./gc32:referenceRange"
          @interpretation = "./gc32:interpretation"
          @klass = LabResult
          @base_xpath = "./gc32:result"
        end
        
        #-------------------------------------------------------------------------------

        def import(result_xml)
          result_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          
          result_element = result_xml.xpath(@base_xpath)
          lab_result = @klass.new(reference_range: extract_node_text(result_element.xpath(@range)))
          
          extract_result(result_element, lab_result)
              
          lab_result
        end
        
        #-------------------------------------------------------------------------------
        private
        #-------------------------------------------------------------------------------
        
        def extract_result(result_element, lab_result)
          extract_entry(result_element, lab_result)
          extract_code(result_element, lab_result, @interpretation, :interpretation)
        end

      end
    end
  end
end