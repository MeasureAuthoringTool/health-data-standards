module HealthDataStandards
  module Import
    module GreenC32
      class VitalSignImporter < ResultImporter
        
        def import(vital_sign_xml)
          vital_sign_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          vital_sign_element = vital_sign.xpath("./gc32:vitalSign")
          vital_sign = VitalSign.new(reference_range: extract_node_text(vital_sign_element.xpath(@range)))
          
          extract_result(vital_sign_element, vital_sign)
              
          vital_sign
        end
        
        #-------------------------------------------------------------------------------
        private
        #-------------------------------------------------------------------------------

        def setup_extraction(vital_sign)
          vital_sign_element = vital_sign.xpath("./gc32:vitalSign")
          VitalSign.new(reference_range: extract_node_text(vital_sign_element.xpath(@range)))
        end
        
      end
    end
  end
end
