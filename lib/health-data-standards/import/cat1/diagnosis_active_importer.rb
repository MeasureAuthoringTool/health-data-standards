module HealthDataStandards
  module Import
    module Cat1
      class DiagnosisActiveImporter < CDA::ConditionImporter

        def initialize
          super(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.24.3.11']"))
          @status_xpath = nil # We'll hardcode this to active in create entry because this is from the 
                              # diagnosis active template
        end
      end
    end
  end
end