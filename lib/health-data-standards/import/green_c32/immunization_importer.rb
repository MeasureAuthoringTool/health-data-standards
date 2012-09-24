module HealthDataStandards
  module Import
    module GreenC32
      class ImmunizationImporter < SectionImporter
        include Singleton
        
        def import(immunization_xml)
          immunization_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          immunization_element = immunization_xml.at_xpath("./gc32:immunization")
          immunization = Immunization.new
          extract_entry(immunization_element, immunization)
          extract_time(immunization_element, immunization, "./gc32:effectiveTime")
          extract_code(immunization_element, immunization, "./gc32:refusalReason")
          series_number = extract_node_text(immunization_element.at_xpath("./gc32:seriesNumber"))
          immunization.series_number = series_number.to_i if series_number
          immunization.refusal_ind = extract_node_attribute(immunization_element, :refused, true)
          immunization
        end
        
      end
    end
  end
end