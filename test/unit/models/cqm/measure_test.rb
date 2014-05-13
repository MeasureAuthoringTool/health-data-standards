require 'test_helper'

class MeasureTest < ActiveSupport::TestCase
  setup do
    dump_database

    collection_fixtures('measures')

    @measure = HealthDataStandards::CQM::Measure.where(:hqmf_id => "0001").first
  end

  def test_categories
    categories = HealthDataStandards::CQM::Measure.categories
    assert categories.any? {|c| c['category'] == 'Core' && c['measures'].size == 1}
    assert categories.any? {|c| c['category'] == 'General Practice Adult' && c['measures'].size == 1}
    assert categories.any? do |c|
      c['category'] == 'General Practice Adult' &&
      c['measures'].first['title'] == "Pneumonia Vaccination Status for Older Adults"
    end

  end

  test "Should have key" do
    assert @measure.key == "0001"
  end

  test "Should have measure id" do
    assert @measure.measure_id == "0001"
  end

  test "Should list installed measures" do
    measures = HealthDataStandards::CQM::Measure.installed

    assert_equal 23, measures.count, "there should be 23 measures"
    assert measures.index{|m| m.measure_id=="0001"} != nil
    assert measures.index{|m| m.measure_id=="0002"} != nil
    assert measures.index{|m| m.measure_id=="0348"} != nil
  end

  test "Should list top levels" do
    measures = HealthDataStandards::CQM::Measure.top_level

    assert_equal 12, measures.count, "should count 12 top level measures "
    assert measures.where(:hqmf_id=>"0001").count() == 1, "Top level measure 0001 Not Found"
    assert measures.where(:hqmf_id=>"0002").count() == 1, "Top level measure 0002 Not Found"
    assert measures.where(:hqmf_id=>"0348").count() == 1, "Top level measure 0348 Not Found"
  end


  test "all data criteria" do
    adc = @measure.all_data_criteria
    assert adc.any? {|dc| dc.title == "Office Visit"}
  end

  test 'building prefilters' do
    measure = HealthDataStandards::CQM::Measure.where(nqf_id: '0043').first
    assert measure
    measure.build_pre_filters!
    assert_equal 1, measure.prefilters.count
    pf = measure.prefilters.first
    assert_equal 'birthdate', pf.record_field
    assert_equal '$lte', pf.comparison
    assert_equal 66, pf.effective_time_offset
  end

  test 'prefilter hash' do
    measure = HealthDataStandards::CQM::Measure.where(hqmf_id: '8A4D92B2-397A-48D2-0139-7CC6B5B8011E').first
    assert measure
    query_hash = measure.prefilter_query!(0)
    lte = Time.at(0).years_ago(4).to_i
    gte = Time.at(0).years_ago(18).to_i
    assert_equal({'birthdate' => {'$lte' => lte, '$gte' => gte}}, query_hash)
  end
end
