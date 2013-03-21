require 'test_helper'

class MeasureTest < MiniTest::Unit::TestCase
  def test_categories
    collection_fixtures('measures')
    categories = HealthDataStandards::CQM::Measure.categories
    assert categories.any? {|c| c['category'] == 'Core' && c['measures'].size == 2}
    assert categories.any? {|c| c['category'] == 'General Practice Adult' && c['measures'].size == 1}
    assert categories.any? do |c| 
      c['category'] == 'General Practice Adult' && 
      c['measures'].first['title'] == "Pneumonia Vaccination Status for Older Adults"
    end
    
  end
end