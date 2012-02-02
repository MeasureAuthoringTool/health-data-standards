module HealthDataStandards
  module Import
    module GreenCda
      class PatientImporter
        include Singleton
            
        def initialize
          @importers[:results] = ResultImporter.new
        end
        
      end
    end
  end
end