module HealthDataStandards
  module Import
    module GreenC32
      class AllergyImporter < SectionImporter
        include Singleton
        
        def import(allergy_xml)
          allergy_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          allergy_element = allergy_xml.xpath("./gc32:allergy")
          allergy = Allergy.new
          extract_entry(allergy_element, allergy)
          extract_code(allergy_element, allergy, "./gc32:type", :type)
          extract_code(allergy_element, allergy, "./gc32:reaction", :reaction)
          extract_code(allergy_element, allergy, "./gc32:severity", :severity)
          allergy
        end
      end
    end
  end
end