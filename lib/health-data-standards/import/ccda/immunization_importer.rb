module HealthDataStandards
  module Import
    module CCDA
      class ImmunizationImporter < C32::ImmunizationImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.2' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.2.1']/cda:entry/cda:substanceAdministration"))
          @refusal_reason_xpath = "./cda:entryRelationship[@typeCode='MFST']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.9']/cda:value"
        end

        def extract_dates(parent_element, entry, element_name="effectiveTime")
          super
          if entry[:start_time] && !entry[:end_time]
            entry[:end_time] = entry[:start_time]
          end          
        end
        
      end
    end
  end
end