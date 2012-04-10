module HealthDataStandards
  module Import
    module GreenC32
      class SocialHistoryImporter < SectionImporter
        include Singleton
        
        def import(sh_xml)
          sh_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          sh_element = sh_xml.at_xpath("./gc32:socialHistory")
          sh = SocialHistory.new
          extract_entry(sh_element, sh)
          extract_code(sh_element, sh, "./gc32:type", :type)
          sh
        end
      end
    end
  end
end