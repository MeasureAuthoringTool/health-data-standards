require_relative '../../../test_helper'
module HQMFModel

  class DataCriteriaTest < Minitest::Test
    def setup
    end

    def test_fields_definitions

      fields = HQMF::DataCriteria::FIELDS
      mismatches = []

      fields.each do |field, value|
        title = value[:title].upcase.gsub('/','').gsub(' ','_')
        field_title = "#{field} - #{title}"
        mismatches << field_title unless field == title
      end

      
      expected_mismatches = [
        # ignore custom fulfills and previous ordinal field values
        "FLFS - FULFILLS",
        "ORDINAL - ORDINALITY",
        # the following represent display name changes that were necessary for the QDM 5.0 update
        "DISCHARGE_STATUS - DISCHARGE_DISPOSITION",
        "DOSE - DOSAGE",
        "FACILITY_LOCATION_ARRIVAL_DATETIME - LOCATION_PERIOD_START_DATETIME",
        "FACILITY_LOCATION_DEPARTURE_DATETIME - LOCATION_PERIOD_END_DATETIME",
        "REFERENCE_RANGE_HIGH - REFERENCE_RANGE_-_HIGH",
        "REFERENCE_RANGE_LOW - REFERENCE_RANGE_-_LOW"
      ]
      assert_equal mismatches.sort, expected_mismatches.sort
    end

    def test_value_fields

      fields = HQMF::DataCriteria::FIELDS
      values = HQMF::DataCriteria::VALUE_FIELDS
      mismatches = []

      values.each do |value, field|
        entry = "#{value} -> #{field}"
        mismatches << entry unless fields[field] && fields[field][:code] == value
      end

      # ignore backwards compatible values
      mismatches -= ["363819003 -> CUMULATIVE_MEDICATION_DURATION",
                     "260864003 -> FREQUENCY"]

      assert mismatches.empty?, "Mismatches found: #{mismatches}."

      mismatches = []
      fields.each do |field, value|
        next unless value[:code]
        entry = "#{value[:code]} -> #{field}"
        mismatches << entry unless values[value[:code]] && values[value[:code]] == field
      end

      # ignore previous ordinal value
      mismatches -= ["117363000 -> ORDINAL"]

      assert mismatches.empty?, "Mismatches found: #{mismatches}."

    end
  end
end
