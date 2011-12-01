require './test/test_helper'

class TestTimeout < Test::Unit::TestCase

  def test_timeout
    @conn = standard_connection(:op_timeout => 2)
    assert @conn[MONGO_TEST_DB]['test'].save({:a => 1})
    assert @conn[MONGO_TEST_DB]['test'].find.next
    assert_raise OperationTimeout do
      @conn[MONGO_TEST_DB]['test'].find({'$where' => 'function() { while(true) { this.a == 1 } }'}).next
    end
  end

end
