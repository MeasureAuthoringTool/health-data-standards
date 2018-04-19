module HealthDataStandards
  module Import
    module CCDA
      class MedicationOrderImporter < CDA::MedicationImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:entry/cda:substanceAdministration/cda:entryRelationship/cda:supply[cda:templateId/@root = '2.16.840.1.113883.10.20.22.4.17']"))
          @status_xpath = "./cda:statusCode"
          @code_xpath = "./cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code"
          @description_xpath = "./cda:product/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference[@value]"
        end

        def extract_dates(parent_element, entry, element_name="effectiveTime")
          super
          if entry[:start_time] && !entry[:end_time]
            entry[:end_time] = entry[:start_time]
          end
          if entry[:end_time] && !entry[:start_time]
            entry[:start_time] = entry[:end_time]
          end          
        end

      end
    end
  end
end