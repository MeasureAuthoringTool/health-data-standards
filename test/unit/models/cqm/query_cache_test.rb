require 'test_helper'

class QueryCacheTest < Minitest::Test
  def test_aggregate_measure
    collection_fixtures('query_cache')
    aggregate_count = HealthDataStandards::CQM::QueryCache.aggregate_measure("8A4D92B2-397A-48D2-0139-C648B33D5582" ,1356998340)
    ipp_pop = aggregate_count.populations.find{|p| p.type == 'IPP'}
    assert_equal 3, ipp_pop.value
    assert_equal "155518F5-8B70-49AB-A3CB-E53037D5442D", ipp_pop.id
    assert_equal 1, aggregate_count.populations.find{|p| p.type == 'NUMER'}.value
    assert_equal 1, ipp_pop.stratifications.size
    strat = ipp_pop.stratifications.first
    assert_equal "924D8CB7-57B2-40EC-B136-820CEA0D7436", strat.id
  end
end