require './test/test_helper'
require 'logger'
require 'stringio'
require 'thread'

class TestPool < Test::Unit::TestCase

  include Mongo
  include BSON

  def setup
    @conn = standard_connection
  end

  def teardown
    @conn[MONGO_TEST_DB].get_last_error
  end

  def test_foo
  end
end
