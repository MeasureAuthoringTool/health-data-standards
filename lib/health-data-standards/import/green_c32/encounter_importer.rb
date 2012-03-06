module HealthDataStandards
  module Import
    module GreenC32
      class EncounterImporter < SectionImporter
        include Singleton
        
        def initialize
          super
        end
        
        def import(encounter_xml)
          encounter = Encounter.new
          encounter_xml.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
          encounter_element = encounter_xml.xpath("/gc32:encounter")
          extract_entry(encounter_element, encounter)
          extract_code(encounter_element, encounter, "./gc32:dischargeDisposition", :discharge_disposition)
          extract_code(encounter_element, encounter, "./gc32:admissionType", :admit_type)
          extract_code(encounter_element, encounter, "./gc32:reasonForVisit", :reason)
          extract_code(encounter_element, encounter)
          extract_interval(encounter_element, encounter)
          extract_facility(encounter_element, encounter)
          
          free_text = encounter_element.xpath("./gc32:freeText").first

          if free_text
            encounter.free_text = free_text.content
          end
          
          encounter
        end
        
        def extract_facility(encounter_element, encounter)
          facility_element = encounter_element.xpath("./gc32:facility").first
          if facility_element
            organization = extract_organization(facility_element)
            organization_visit = OrganizationVisit.new(organization: organization)
            extract_interval(facility_element, organization_visit, "duration")
            encounter.facility = organization_visit
          end
        end
        
      end
    end
  end
end