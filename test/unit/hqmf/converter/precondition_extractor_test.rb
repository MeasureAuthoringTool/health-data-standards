require_relative '../../../test_helper'

module HQMF

  class PreconditionExtractorTest  < Minitest::Test

    def setup
      @data_criteria_converter_stub = OpenStruct.new({ v1_data_criteria_by_id: {
                                                         "af419470-8365-4dd4-8ab0-8245de8ada73" => OpenStruct.new(id: "MeasurePeriod"),
                                                         "099fe199-fe83-42fa-8e68-c19067499edf" => OpenStruct.new(id: "MeasurePeriod")
                                                       },
                                                       measure_period_v1_keys: {
                                                         measure_start: "af419470-8365-4dd4-8ab0-8245de8ada73",
                                                         measure_end: "099fe199-fe83-42fa-8e68-c19067499edf"
                                                       }
                                                     })
    end

    # Make sure that an "Ends Concurrent With Measurement Period Start" is correctly converted to "Ends
    # Concurrent With Start of Measurement Period"
    def test_extract_preconditions_from_restrictions_ends_concurrent_with
      restrictions = [{ type: "ECW", target_id: "af419470-8365-4dd4-8ab0-8245de8ada73", negation: false }]
      preconditions = HQMF::PreconditionExtractor.extract_preconditions_from_restrictions(restrictions, @data_criteria_converter_stub)
      preconditions.length.must_equal 1
      preconditions.first.operator.category.must_equal "TEMPORAL"
      preconditions.first.operator.type.must_equal "ECWS"
    end

    # Make sure that a "Starts Concurrent With Measurement Period End" is correctly converted to "Starts
    # Concurrent With End of Measurement Period"
    def test_extract_preconditions_from_restrictions_starts_concurrent_with
      restrictions = [{ type: "SCW", target_id: "099fe199-fe83-42fa-8e68-c19067499edf", negation: false }]
      preconditions = HQMF::PreconditionExtractor.extract_preconditions_from_restrictions(restrictions, @data_criteria_converter_stub)
      preconditions.length.must_equal 1
      preconditions.first.operator.category.must_equal "TEMPORAL"
      preconditions.first.operator.type.must_equal "SCWE"
    end

  end
end
