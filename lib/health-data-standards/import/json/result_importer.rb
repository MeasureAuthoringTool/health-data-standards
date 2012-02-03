require "json"

module HealthDataStandards
  module Import
    module Json
      class ResultImporter < SectionImporter
        def initialize
          # Empty
        end

        #---------------------------------------------------------------------------------
        # Import a JSON entry
        #
        # Comments on validations:
        # 1. this code enforces the presence of a code, a time and a description
        # 2. the time must be numeric, although the number may represent a nonsense time
        # 3. the code key must be valid according to the utility code
        # 4. the code values are not checked, but the value array is checked for type
        def create_entries(doc,id_map = {})
          result_list = []
          data = JSON.parse(doc)

          # Validate the presence of required data
          return nil unless validate_code data
          return nil unless validate_time data
          return nil unless validate_required data, DESCRIPTION

          result_list << LabResult.new(data)

          return result_list
        end
      end
    end
  end
end