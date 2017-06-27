require 'test_helper'
class QrdaQdmTemplateValidatorTest < ActiveSupport::TestCase
  include HealthDataStandards::Validate
  
  setup do
    @validator_r3 = HealthDataStandards::Validate::QrdaQdmTemplateValidator.new('r3')
    @validator_r3_1 = HealthDataStandards::Validate::QrdaQdmTemplateValidator.new('r3_1')
    @validator_r1 = HealthDataStandards::Validate::QrdaQdmTemplateValidator.new('r1')
  end

  test "Should not produce errors if validator does not support version specified" do
    xml = File.open("./test/fixtures/qrda/cat1_r3_good.xml","r") do |f| f.read() end
    errors = @validator_r1.validate(xml)
    assert_equal  0,  errors.length, "File should not contain any errors"
  end

  test "Should not produce errors for good file" do
    xml = File.open("./test/fixtures/qrda/cat1_r3_good.xml","r") do |f| f.read() end
    errors = @validator_r3.validate(xml)
    assert_equal  0,  errors.length, "File should not contain any errors"
  end

  test "Should produce 4 errors for using r3 templates in a r3_1 document" do
    xml = File.open("./test/fixtures/qrda/cat1_r3_good.xml","r") do |f| f.read() end
    errors = @validator_r3_1.validate(xml)
    assert_equal  4,  errors.length, "File should contain 4 errors for incorrect templates"
  end

end
