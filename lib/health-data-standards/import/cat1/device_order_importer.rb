module HealthDataStandards
  module Import
    module Cat1
      class DeviceOrderImporter < CDA::MedicalEquipmentImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.130']/cda:entryRelationship/cda:supply[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.9']"))
        end

        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          medical_equipment = super
          # the negation is at the level of the encapsulating Device Order Act Template (parent.parent)
          extract_reason_or_negation(entry_element.parent.parent, medical_equipment, entry_element)
          medical_equipment
        end

      end
    end
  end
end