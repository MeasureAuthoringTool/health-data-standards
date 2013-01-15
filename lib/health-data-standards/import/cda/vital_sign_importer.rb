module HealthDataStandards
  module Import
    module CDA
      class VitalSignImporter < ResultImporter
        def initialize
          super(EntryFinder.new("//cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.14']"))
        end
      end
    end
  end
end