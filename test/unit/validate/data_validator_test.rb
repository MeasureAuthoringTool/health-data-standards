require 'test_helper'
class DataValidatorTest < ActiveSupport::TestCase
  include HealthDataStandards::Validate
  
  setup do
    collection_fixtures('bundles', '_id')
    collection_fixtures('measures')
    collection_fixtures('health_data_standards_svs_value_sets', '_id',)
    HealthDataStandards::SVS::ValueSet.all.update_all(bundle_id: "4fdb62e01d41c820f6000001")
    @bundle = HealthDataStandards::CQM::Bundle.find("4fdb62e01d41c820f6000001")
    measures = @bundle.measures
    @validator = HealthDataStandards::Validate::DataValidator.new(@bundle, measures.map(&:hqmf_id))
  end

  test "Should produce errors for unknown valuesets or values not found in vs" do
    xml = File.open("./test/fixtures/value_sets/bad.xml","r") do |f| f.read() end
    errors = @validator.validate(xml)
    assert_equal 2,  errors.length, "File should contain 2 errors"
  end

  test "Should not produce errors for files for all " do
    xml = File.open("./test/fixtures/value_sets/good.xml","r") do |f| f.read() end
    errors = @validator.validate(xml)
    assert_equal  0,  errors.length, "File should not contain any errors"
  end
end
