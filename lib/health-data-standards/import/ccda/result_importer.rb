module HealthDataStandards
  module Import
    module CCDA
      class ResultImporter < CDA::ResultImporter
        def initialize
          super(CDA::EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.2']"))
        end
      end
    end
  end
end