require 'test_helper'
require 'fileutils'

class XmlFileValidatorTest < ActiveSupport::TestCase
  include HealthDataStandards::Validate

  test "should be able to tell when a cat III file is bad due to schematron issues" do
     doc = File.new('test/fixtures/qrda/cat3_bad_schematron.xml')
     errors = Cat3.instance.validate(doc, {file_name: "filename.xml"})
     assert_equal 2, errors.length, "Should be 2 errors for bad cat 3 file"
  end

  test "should be able to tell when a cat I file is good" do
     doc = File.new('test/fixtures/qrda/cat1_good.xml')
     errors = Cat1R2.instance.validate(doc, {file_name: "filename.xml"})
     assert errors.empty?, "Should be 0 errors for good cat 1 file"
  end

  #also tests to ensure that validators can handle input as a string
  test "should be able to tell when a file is bad due to schema issues" do
     doc = File.new('test/fixtures/qrda/cat1_bad_schema.xml')
     errors = CDA.instance.validate(doc, {file_name: "filename.xml"})
     assert_equal 1, errors.length, "Should report 1 error"
  end

  test "should be able to tell when a cat I file is bad due to schematron issues" do
     doc = File.new('test/fixtures/qrda/cat1_bad_schematron.xml')
     errors = Cat1R2.instance.validate(doc, {file_name: "filename.xml"})
     assert_equal 1, errors.length, "Should report 1 error"
  end

  test "should be able to tell when a cat I file is bad due to not including expected measures" do
     doc = File.new('test/fixtures/qrda/cat1_no_measure_id.xml')
     errors = Cat1R2.instance.validate(doc, {file_name: "filename.xml"})
     assert_equal 2, errors.length, "Should report 3 errors"
  end

  test "should be able to tell when a cat I R3 file is good" do
    error_count = 0
    doc = File.new('test/fixtures/qrda/cat1_r3_good.xml')
    errors = Cat1.instance.validate(doc, {file_name: "cat1_good.xml"})
    assert_equal 0, errors.length, "Should report have no errors"
  end

end
