module HealthDataStandards
  module Import
    module C32
      class ImmunizationImporter < CDA::SectionImporter

        def initialize(entry_finder=CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.117']/cda:entry/cda:substanceAdministration"))
          super(entry_finder)
          @code_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code"
          @description_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference[@value]"
          @entry_class = Immunization
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          immunization = super
          extract_negation(entry_element, immunization)
          extract_performer(entry_element, immunization)
          immunization
        end
    
        private
    
        def extract_performer(parent_element, immunization)
          performer_element = parent_element.at_xpath("./cda:performer")
          immunization.performer = import_actor(performer_element) if performer_element
        end
      end
    end
  end
end