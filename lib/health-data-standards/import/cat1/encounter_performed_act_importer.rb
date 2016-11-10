module HealthDataStandards
  module Import
    module Cat1
      class EncounterPerformedActImporter < EncounterPerformedImporter

        def initialize
          super(CDA::EntryFinder.new("./cda:entry/cda:act[./cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.133']/cda:entryRelationship/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']"))
          @reason_xpath = "./cda:entryRelationship[@typeCode='RSON']/cda:observation"
          @principal_diagnosis_xpath = "./cda:entryRelationship/cda:observation[cda:code/@code='8319008']"
          @diagnosis_xpath = "./cda:entryRelationship/cda:act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']"
        end
      end
    end
  end
end