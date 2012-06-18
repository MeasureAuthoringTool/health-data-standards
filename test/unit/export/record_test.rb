require 'test_helper'
require 'pry'

module GreenC32
  class RecordTest < MiniTest::Unit::TestCase

    def setup
      collection_fixtures('records', '_id')
      @record = Record.first
    end
    
    def test_export
      HealthDataStandards::Export::GreenC32::Record.export(@record)
    end
  end
end