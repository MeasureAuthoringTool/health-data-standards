module HealthDataStandards
  module Import
    module CCDA
      # TODO Extract Discharge Disposition
      class EncounterImporter < C32::EncounterImporter
    
        def initialize
          @entry_xpath = "//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.22' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.22.1']/cda:entry/cda:encounter"
          @code_xpath = "./cda:code"
          @status_xpath = "./cda:statusCode"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value] "
          @reason_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:observation"
        end
        
      end
    end
  end
end