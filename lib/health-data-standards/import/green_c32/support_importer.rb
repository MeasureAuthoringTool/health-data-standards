module HealthDataStandards
  module Import
    module GreenC32
      class SupportImporter < SectionImporter
        include Singleton
        
        def import(support_doc)
          support_doc.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          support_element = support_doc.at_xpath("./gc32:support")
          support = Support.new(type: support_element.at_xpath("./gc32:type").try(:content),
                                relationship: support_element.at_xpath("./gc32:relationship").try(:text))
          extract_name(support_element, support)
          support.address = extract_address(support_element.at_xpath("./gc32:address"))
          support.telecom = extract_telecom(support_element.at_xpath("./gc32:telecom"))
          support.mothers_maiden_name = support_element.at_xpath("./gc32:mothersMaidenName").try(:text)
          support
        end
        
      end
    end
  end
end