module HealthDataStandards
  module Import
    module CCDA
      class ImmunizationImporter < C32::ImmunizationImporter

        def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.2' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.2.1']/cda:entry/cda:substanceAdministration"
          @code_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code"
          @description_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference[@value]"
          @refusal_reason_xpath = "./cda:entryRelationship[@typeCode='MFST']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.9']/cda:value"
        end
        
      end
    end
  end
end