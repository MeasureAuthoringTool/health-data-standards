require "test_helper"
require_relative '../../../lib/health-data-standards/models/metadata/base'
require_relative '../../../lib/health-data-standards/models/metadata/linked_info'
require_relative '../../../lib/health-data-standards/models/metadata/record_date'
require_relative '../../../lib/health-data-standards/models/metadata/pedigree'

class MetaDataTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @record = Factory.create(:record)
    @md = Factory.create("metadata/base")
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_new_md
    out = @md.to_xml(record: @record)
    @md = Metadata::Base.new
    @md.from_xml(out)
    out2 = @md.to_xml(record: @record)
    assert_equal out, out2
  end
end