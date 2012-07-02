module HealthDataStandards
  module Import
    module CCDA
      class AllergyImporter < C32::AllergyImporter
        
        
        def initialize
          @entry_xpath = "//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.7']"
          @code_xpath = "./cda:participant/cda:participantRole/cda:playingEntity/cda:code"
          @description_xpath = "./cda:code/cda:originalText/cda:reference[@value] | ./cda:text/cda:reference[@value]"
          @type_xpath = "./cda:code"
          @reaction_xpath = "./cda:entryRelationship[@typeCode='MFST']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.9']/cda:value"
          @severity_xpath = "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.8']/cda:value"
          @status_xpath   = "./cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.28']/cda:value"
        end
        
      end
    end
  end
end