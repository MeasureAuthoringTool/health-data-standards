module HealthDataStandards
  module Import
    module CCDA
      # TODO Extract Discharge Disposition
      class EncounterImporter < CDA::EncounterImporter
    
        def initialize
          super(CDA::EntryFinder.new("//cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.22' or cda:templateId/@root='2.16.840.1.113883.10.20.22.2.22.1']/cda:entry/cda:encounter"))
          @reason_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:observation"
        end
        
      end
    end
  end
end