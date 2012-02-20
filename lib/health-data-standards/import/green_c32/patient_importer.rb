module HealthDataStandards
  module Import
    module GreenC32
      class PatientImporter
        include Singleton
            
        def initialize
          @importers[:results] = ResultImporter.new
        end
        
      end
    end
  end
end