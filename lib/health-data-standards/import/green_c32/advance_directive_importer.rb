module HealthDataStandards
  module Import
    module GreenC32
      class AdvanceDirectiveImporter < SectionImporter
        include Singleton
        
        def import(ad_xml)
          ad_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          
          ad = Entry.new
          advance_directive_element = ad_xml.at_xpath("./gc32:advanceDirective")
          
          extract_entry(advance_directive_element, ad)
          extract_free_text(advance_directive_element, ad)
          ad
        end
        
      end
    end
  end
end