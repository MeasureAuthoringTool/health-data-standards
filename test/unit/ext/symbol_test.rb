require 'test_helper'

class SymbolTest < MiniTest::Unit::TestCase
  def test_to_setter
    assert_equal :bacon=, :bacon.to_setter
  end
end