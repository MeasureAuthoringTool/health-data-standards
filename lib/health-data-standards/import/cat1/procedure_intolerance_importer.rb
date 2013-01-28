module HealthDataStandards
  module Import
    module Cat1
      class ProcedureIntoleranceImporter < CDA::SectionImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.62']/cda:entryRelationship/cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.64']"))
          @entry_class = Allergy
        end
      end
    end
  end
end