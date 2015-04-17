require 'test_helper'
require 'fileutils'

class BaseValidatorTest < ActiveSupport::TestCase
  include HealthDataStandards::Validate

  class TestValidator
    include HealthDataStandards::Validate::BaseValidator
  end

  setup do
    @validator = TestValidator.new
  end

  test "accept input as string" do
    doc = File.new('test/fixtures/qrda/cat1_good.xml').read
    assert_equal Nokogiri::XML::Document, @validator.get_document(doc).class
  end

  test "accept input as file" do
    doc = File.new('test/fixtures/qrda/cat1_bad_measure_id.xml')
    assert_equal Nokogiri::XML::Document, @validator.get_document(doc).class
  end

  test "accept input as nokogiri document" do
    doc = Nokogiri::XML(File.new('test/fixtures/qrda/cat3_good.xml').read)
    assert_equal Nokogiri::XML::Document, @validator.get_document(doc).class
  end

end
