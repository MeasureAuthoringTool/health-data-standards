module HealthDataStandards
  module Import
    module CCDA
      class MedicalEquipmentImporter < C32::MedicalEquipmentImporter
        
        def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.50']/cda:entry/cda:supply"
          @code_xpath = "./cda:participant/cda:participantRole/cda:playingDevice/cda:code"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value]"

        end
  
      end
    end
  end
end