require 'test_helper'
module Export
  class MetadataTest < MiniTest::Unit::TestCase
    def setup
      @md = FactoryGirl.build("metadata")
      @entry = FactoryGirl.build("condition")
    end

    def test_export
      HealthDataStandards::Export::Hdata::Metadata.new.export(@entry, @md)
    end
  end
end
