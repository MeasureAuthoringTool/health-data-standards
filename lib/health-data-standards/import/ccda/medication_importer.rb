module HealthDataStandards
  module Import
    module CCDA
      
      class MedicationImporter < C32::MedicationImporter

        def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.1' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.1.1']/cda:entry/cda:substanceAdministration"
          @code_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code"
          @description_xpath = "./cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial/cda:code/cda:originalText/cda:reference[@value]"
          @indication_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.19']/cda:code"
          @vehicle_xpath = "./cda:participant/cda:participantRole[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.24']/cda:playingEntity/cda:code"
          @fill_number_xpath = './cda:repeatNumber'
        end

      end
    end
  end
end
