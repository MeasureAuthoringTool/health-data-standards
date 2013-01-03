require 'test_helper'

module GreenC32
  class RecordTest < MiniTest::Unit::TestCase

    def setup
      collection_fixtures('records', '_id')
      @record = Record.first
    end
    
    def test_export
      HealthDataStandards::Export::GreenC32::Record.new.export(@record)
    end
  end
end