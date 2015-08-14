module HealthDataStandards
  module Import
    module Cat1
      class ClinicalTrialParticipantImporter < CDA::ConditionImporter

        def initialize(entry_finder=CDA::EntryFinder.new("./cda:entry/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.24.3.51']"))
          super(entry_finder)
          @code_xpath = './cda:value'
        end

        def create_entry(entry_element, nrh = NarrativeReferenceHandler.new)
          entry = super
          entry.description ||= 'Patient Characteristic Clinical Trial Participant'
          entry
        end

      end
    end
  end
end
