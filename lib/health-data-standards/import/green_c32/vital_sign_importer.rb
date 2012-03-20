module HealthDataStandards
  module Import
    module GreenC32
      # This really needs to get refactored to share code with result importer
      class VitalSignImporter < ResultImporter

        include Singleton
        
        #-------------------------------------------------------------------------------

        def initialize
          super
          @range = "./gc32:referenceRange"
          @klass = VitalSign
          @base_xpath = "./gc32:vitalSign"
        end

      end
    end
  end
end
