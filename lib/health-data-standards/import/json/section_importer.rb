module HealthDataStandards
  module Import
    module Json
      class SectionImporter
        AGE_AT_ONSET = "ageAtOnset"
        CODE = "code"
        CODES = "codes"
        CODE_SYSTEM = "codeSystem"
        COMMENT = "comment"
        DESCRIPTION = "description"
        PROBLEM_STATUS = "problemStatus"
        SCALAR = "scalar"
        START_TIME = "startTime"
        STATUS = "status"
        TIME = "time"
        UNITS = "units"
        VALUE = "value"


        #----------------------------------------------------------------------------
        # Test the code information in the JSON data for validity
        #
        # @return a boolean indicating if the code information is valid or not
        def validate_code data
          codes = data[CODES]
          return false if codes.nil? || codes.size == 0

          key = codes.keys[0]
          code_vals = codes[key]
          oid = HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system(key)
          return false if oid.nil?
          return false if code_vals.nil?
          return false unless code_vals.class == Array
          return true
        end

        #----------------------------------------------------------------------------
        # Test the time information in the JSON data for validity
        #
        # @return a boolean indicating if the time information is valid
        def validate_time data
          validate_time_field data, TIME
        end

        #----------------------------------------------------------------------------
        # Test if a named field is present
        #
        # @param data the JSON data
        # @param fieldname the key
        # @return a boolean indicating if the field is present
        def validate_required data, fieldname
          return !data[fieldname].nil?
        end

        #----------------------------------------------------------------------------
        # Test a specified time field for validity
        #
        # @param data the JSON data
        # @param fieldname the key
        # @return a boolean indicating if the time information is valid
        def validate_time_field data, fieldname
          time = data[fieldname]
          return false if time.nil?
          return time.class == Fixnum
        end
      end
    end
  end
end