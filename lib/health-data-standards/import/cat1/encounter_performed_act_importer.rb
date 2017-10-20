module HealthDataStandards
  module Import
    module Cat1
      class EncounterPerformedActImporter < EncounterPerformedImporter

        def initialize
          super(CDA::EntryFinder.new("./cda:entry/cda:act[./cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.133']/cda:entryRelationship/cda:encounter[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.23']"))
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          encounter = super
          extract_reason_or_negation(entry_element.parent.parent, encounter)
          encounter
        end

      end
    end
  end
end