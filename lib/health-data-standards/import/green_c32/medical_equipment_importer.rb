module HealthDataStandards
  module Import
    module GreenC32
      class MedicalEquipmentImporter < SectionImporter
        include Singleton
        
        def initialize
          super
          @value = "./gc32:quantity"
        end
        
        def import(me_xml)
          me_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          me_element = me_xml.at_xpath("./gc32:medicalEquipment")
          me = MedicalEquipment.new
          extract_entry(me_element, me)
          me.manufacturer = extract_node_text(me_element.at_xpath("./gc32:manufacturer")).try(:strip)
          me
        end
        
       end
     end
   end 
end
