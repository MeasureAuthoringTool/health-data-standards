require 'test_helper'
require 'fileutils'

class PerformanceRateValidatorTest < ActiveSupport::TestCase
  include HealthDataStandards::Validate

  setup do
    @prcat3 = HealthDataStandards::Validate::Cat3PerformanceRate.instance
    collection_fixtures('measures')
  end

  test "should have no errors if performance rates are valid (cat 3)" do
    doc = File.new('test/fixtures/qrda/cat3_good_performance_rate.xml')
    errors = @prcat3.validate(doc)
    assert_equal [], errors
  end

  test "should have errors if performance rates are not valid (cat 3)" do
    doc = File.new('test/fixtures/qrda/cat3_bad_performance_rate.xml')
    errors = @prcat3.validate(doc)
    #2 incorrect performance rates
    assert_equal 2, errors.length
  end
end