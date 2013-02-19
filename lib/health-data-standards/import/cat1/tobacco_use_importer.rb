module HealthDataStandards
  module Import
    module Cat1
      class TobaccoUseImporter < CDA::SectionImporter
        def initialize(entry_finder=CDA::EntryFinder.new("//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.22.4.85']"))
          super(entry_finder)
          @entry_class = Entry
        end
        
        def create_entry(entry_element, nrh = CDA::NarrativeReferenceHandler.new)
          history = super
          codehash = extract_code(entry_element, "./cda:value")
          history.add_code(codehash['code'], CodeSystemHelper.code_system_for(codehash['codeSystemOid']))
          history
        end
      end
    end
  end
end