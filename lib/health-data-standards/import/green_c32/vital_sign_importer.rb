module HealthDataStandards
  module Import
    module GreenC32
      class VitalSignImporter < SectionImporter

        include Singleton
        
        #-------------------------------------------------------------------------------

        def initialize
          super
        end
        
        #-------------------------------------------------------------------------------

        def import(vital_sign_xml)
          vital_sign_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          
          vital_sign_element = vital_sign_xml.xpath("./gc32:vitalSign")
          vital_sign = VitalSign.new
          
          extract_vital_sign(vital_sign_element, vital_sign)
              
          vital_sign
        end
        
        #-------------------------------------------------------------------------------
        private
        #-------------------------------------------------------------------------------
        
        def extract_vital_sign(vital_sign_element, vital_sign)
          extract_entry(vital_sign_element, vital_sign)
          extract_time(vital_sign_element, vital_sign)
          extract_value(vital_sign_element, vital_sign)
        end

      end
    end
  end
end
