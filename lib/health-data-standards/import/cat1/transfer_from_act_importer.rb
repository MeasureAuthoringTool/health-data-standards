module HealthDataStandards
  module Import
    module Cat1
      class TransferFromActImporter < TransferFromImporter

        def initialize
          super(CDA::EntryFinder.new("./cda:entry/cda:act[./cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.141']/cda:entryRelationship/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.81']"))
          @time_xpath = ""
          @entry_class = Encounter
        end
      end
    end
  end
end