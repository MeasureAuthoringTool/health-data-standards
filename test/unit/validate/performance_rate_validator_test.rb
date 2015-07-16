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

  test "Performance Rate equals NA reported 1" do
    errorsList = []
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 1
    reported_result['DENEX'] = 1
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 0
    reported_result['PR'] = {}
    reported_result['PR']['nullFlavor'] = "1"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    errorsList << errors
    #1 incorrect performance rates
    assert_equal 1, errorsList.length
  end

  test "Performance Rate equals 1 reported 1" do
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 1
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 1
    reported_result['PR'] = {}
    reported_result['PR']['value'] = "1"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    assert_equal nil, errors
  end

  test "Performance Rate equals 0 reported 0" do
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 1
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 0
    reported_result['PR'] = {}
    reported_result['PR']['value'] = "0"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    assert_equal nil, errors
  end

  test "Performance Rate equals 1 reported 1.0" do
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 1
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 1
    reported_result['PR'] = {}
    reported_result['PR']['value'] = "1.0"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    assert_equal nil, errors
  end

  test "Performance Rate equals .285714 reported 0.285714" do
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 7
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 2
    reported_result['PR'] = {}
    reported_result['PR']['value'] = "0.285714"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    assert_equal nil, errors
  end

  test "Performance Rate equals .285714 reported 1.285714" do
    errorsList = []
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 7
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 2
    reported_result['PR'] = {}
    reported_result['PR']['value'] = "1.285714"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    errorsList << errors
    #1 incorrect performance rates
    assert_equal 1, errorsList.length
  end

  test "Performance Rate equals .285714 reported .285715" do
    errorsList = []
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 7
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 2
    reported_result['PR'] = {}
    reported_result['PR']['value'] = ".285715"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    errorsList << errors
    #1 incorrect performance rates
    assert_equal 1, errorsList.length
  end

  test "Performance Rate equals .285714 reported 28.5714" do
    errorsList = []
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 7
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 2
    reported_result['PR'] = {}
    reported_result['PR']['value'] = "28.5714"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    errorsList << errors
    #1 incorrect performance rates
    assert_equal 1, errorsList.length
  end

  test "Performance Rate equals .285714 reported .2857142857" do
    errorsList = []
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 7
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 2
    reported_result['PR'] = {}
    reported_result['PR']['value'] = ".2857142857"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    errorsList << errors
    #1 incorrect performance rates
    assert_equal 1, errorsList.length
  end

  test "Performance Rate equals .571429 reported .571428" do
    errorsList = []
    population_ids = {}
    population_ids['NUMER'] = "test_numer"
    reported_result = {}
    reported_result['DENOM'] = 7
    reported_result['DENEX'] = 0
    reported_result['DENEXCEP'] = 0
    reported_result['NUMER'] = 4
    reported_result['PR'] = {}
    reported_result['PR']['value'] = ".571428"
    errors = @prcat3.check_performance_rates(reported_result, population_ids,nil,file_name: "test")
    errorsList << errors
    #1 incorrect performance rates
    assert_equal 1, errorsList.length
  end

end