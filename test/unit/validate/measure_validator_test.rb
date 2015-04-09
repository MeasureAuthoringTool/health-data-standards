require 'test_helper'
require 'fileutils'

class MeasureValidatorTest < ActiveSupport::TestCase
  if RUBY_PLATFORM != "java"
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
      assert_equal 1, errors.length
    end

    test "should have no errors if measure id is valid (cat 3)" do
      doc = File.new('test/fixtures/qrda/cat3_good.xml')
      errors = @cat3.validate(doc)
      assert_equal [], errors
    end

    test "should have an error if measure id is invalid (cat 3)" do
      doc = File.new('test/fixtures/qrda/cat3_bad_measure_id.xml')
      errors = @cat3.validate(doc)
      assert_equal 1, errors.length
    end

  end

end
