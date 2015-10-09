require 'test_helper'
require 'fileutils'

class MeasureValidatorTest < ActiveSupport::TestCase
  include HealthDataStandards::Validate

  setup do
    @cat1 = HealthDataStandards::Validate::Cat1Measure.instance
    @cat3 = HealthDataStandards::Validate::Cat3Measure.instance
    collection_fixtures('measures')
  end

  test "should have no errors if measure id is valid (cat 1)" do
    doc = File.new('test/fixtures/qrda/cat1_good.xml')
    errors = @cat1.validate(doc)
    assert_equal [], errors
  end

  test "should have an error if measure id is invalid (cat 1)" do
    doc = File.new('test/fixtures/qrda/cat1_bad_measure_id.xml')
    errors = @cat1.validate(doc)
    assert_equal 2, errors.length
  end

  test "should have no errors if measure id is valid (cat 3)" do
    doc = File.new('test/fixtures/qrda/cat3_good.xml')
    errors = @cat3.validate(doc)
    assert_equal [], errors
  end


  test "should have errors if the measure information is duplicate (cat 3)" do
    doc = File.new('test/fixtures/qrda/cat3_duplicate_measure.xml')
    errors = @cat3.validate(doc)
    assert_equal 6, errors.length
  end

  test "should have errors if the measure information is duplicate (cat 3), even if measure id is missing" do
    doc = File.new('test/fixtures/qrda/cat3_duplicate_measure_bad_measure_id.xml')
    errors = @cat3.validate(doc)
    assert_equal 6, errors.length
  end

  test "should have errors if the measure information is duplicate (cat 3), even if pop ids are invalid" do
    doc = File.new('test/fixtures/qrda/cat3_duplicate_measure_bad_pop_id.xml')
    errors = @cat3.validate(doc)
    assert_equal 6, errors.length
  end

  test "should have an error if measure id is invalid (cat 3)" do
    doc = File.new('test/fixtures/qrda/cat3_bad_measure_id.xml')
    errors = @cat3.validate(doc)
    assert_equal 2, errors.length
  end

  test "should have no errors if set id is valid (cat 1)" do
    doc = File.new('test/fixtures/qrda/cat1_setId_good.xml')
    errors = @cat1.validate(doc)
    assert_equal [], errors
  end

  test "should have an error if set id is invalid (cat 1)" do
    doc = File.new('test/fixtures/qrda/cat1_setId_bad.xml')
    errors = @cat1.validate(doc)
    assert_equal 1, errors.length
  end

  test "should have an error if set id is valid but for different measure (cat 1)" do
    doc = File.new('test/fixtures/qrda/cat1_setId_wrong.xml')
    errors = @cat1.validate(doc)
    assert_equal 1, errors.length
  end

  test "should have multiple errors for invalid and wrong set ids (cat 1)" do
    doc = File.new('test/fixtures/qrda/cat1_setId_1good_1bad_1wrong_1missing.xml')
    errors = @cat1.validate(doc)
    assert_equal 2, errors.length
  end

end
