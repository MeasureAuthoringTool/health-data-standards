require 'test_helper'

class StringTest < ActiveSupport::TestCase
  test "can be true values" do
    assert "TRUE".to_boolean
    assert "true".to_boolean
    assert "t".to_boolean
    assert "1".to_boolean
  end
  
  test "can be false values" do
    assert ! "false".to_boolean
  end
  
  test "will return false for non-boolean like values" do
    assert ! "bacon".to_boolean
  end
end