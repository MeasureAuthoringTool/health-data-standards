require 'test_helper'

class CDAIdentifierTest < MiniTest::Unit::TestCase
  def test_equality
    id1 = CDAIdentifier.new(root: '1.2.3.4', extension: 'abcdef')
    id2 = CDAIdentifier.new(root: '1.2.3.4', extension: 'abcdef')
    id3 = CDAIdentifier.new(root: 'dfadsfdsaf')
    id4 = CDAIdentifier.new(root: '1.2.3.4', extension: 'abasdsadcdef')

    assert_equal id1, id2
    refute_equal id1, id3
    refute_equal id1, id4
    refute_equal id1, 'foo'
  end
end