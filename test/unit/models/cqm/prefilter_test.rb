require 'test_helper'

class PrefilterTest < ActiveSupport::TestCase
  setup do
    @prefilter = HealthDataStandards::CQM::Prefilter.new(record_field: 'birthdate',
                              effective_time_based: true, comparison: '$gte',
                              effective_time_offset: 5)
  end

  test 'build query hash for effective time based prefilter' do
    query_hash = @prefilter.build_query_hash(1000)
    expexted_time = Time.at(1000).years_ago(5).to_i
    assert query_hash['birthdate']
    assert_equal expexted_time, query_hash['birthdate']['$gte']
  end
end
