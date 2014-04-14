require 'test_helper'

class PrefilterTest < ActiveSupport::TestCase
  setup do
    @prefilter = HealthDataStandards::CQM::Prefilter.new(record_field: 'birthdate',
                              effective_time_based: true, comparison: '$gte',
                              effective_time_offset: -(5 * 365 * 24 * 60 * 60))
  end

  test 'build query hash for effective time based prefilter' do
    query_hash = @prefilter.build_query_hash(1000)
    assert query_hash['birthdate']
    assert_equal 1000-(5 * 365 * 24 * 60 * 60), query_hash['birthdate']['$gte']
  end
end
