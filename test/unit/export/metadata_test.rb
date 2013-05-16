require_relative '../../test_helper'

module Export
  class MetadataTest < MiniTest::Unit::TestCase
    def setup
      @md = FactoryGirl.build("metadata")
      @md.original_creation_time = Time.now
      @entry = FactoryGirl.build("condition")
    end

    def test_roundtrip
      output = HealthDataStandards::Export::Hdata::Metadata.new.export(@entry, @md, true)
      result = HealthDataStandards::Import::Hdata::MetadataImporter.instance.import(Nokogiri::XML(output))  
    end
  end
end
