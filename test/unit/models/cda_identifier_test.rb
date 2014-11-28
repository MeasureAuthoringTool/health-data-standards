require 'test_helper'

class CDAIdentifierTest < Minitest::Test
  def test_equality
    id1 = HealthDataStandards::CDAIdentifier.new(root: '1.2.3.4', extension: 'abcdef')
    id2 = HealthDataStandards::CDAIdentifier.new(root: '1.2.3.4', extension: 'abcdef')
    id3 = HealthDataStandards::CDAIdentifier.new(root: 'dfadsfdsaf')
    id4 = HealthDataStandards::CDAIdentifier.new(root: '1.2.3.4', extension: 'abasdsadcdef')

    assert_equal id1, id2
    refute_equal id1, id3
    refute_equal id1, id4
    refute_equal id1, 'foo'
  end
end