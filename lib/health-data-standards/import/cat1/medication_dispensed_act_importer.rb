module HealthDataStandards
  module Import
    module Cat1
      class MedicationDispensedActImporter < MedicationDispensedImporter

        def initialize
          super(CDA::EntryFinder.new("./cda:entry/cda:act[./cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.139']/cda:entryRelationship/cda:supply[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.45']"))
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          medication = super
          extract_reason_or_negation(entry_element.parent.parent, medication)
          medication
        end
      end
    end
  end
end