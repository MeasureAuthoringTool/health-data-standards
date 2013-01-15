module HealthDataStandards
  module Import
    module CCDA
      class InsuranceProviderImporter < C32::InsuranceProviderImporter
        
        def initialize
          super(CDA::EntryFinder.new("//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.61']"))
        end
        
      end
    end
  end
  
end