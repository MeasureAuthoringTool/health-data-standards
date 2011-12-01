$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require './test/replica_sets/rs_test_helper'

class ReplicaSetThreadingTest < Test::Unit::TestCase
  include ReplicaSetTest

  def setup_safe_data
    @conn = ReplSetConnection.new([self.rs.host, self.rs.ports[0]],
                                 :pool_size => 100)
    @db = @conn[MONGO_TEST_DB]
    @coll = @db.collection('thread-test-collection')
    @db.drop_collection('duplicate')
    @db.drop_collection('unique')
    @duplicate = @db.collection('duplicate')
    @unique    = @db.collection('unique')

    @duplicate.insert("test" => "insert")
    @duplicate.insert("test" => "update")
    @unique.insert("test" => "insert")
    @unique.insert("test" => "update")
    @unique.create_index("test", :unique => true)
  end

  def test_safe_update
    setup_safe_data
    times = []
    threads = []
    100.times do |i|
      threads[i] = Thread.new do
        10.times do
          if i % 2 == 0
            assert_raise Mongo::OperationFailure do
              t1 = Time.now
              @unique.update({"test" => "insert"},
                             {"$set" => {"test" => "update"}}, :safe => true)
              times << Time.now - t1
            end
          else
            t1 = Time.now
            @duplicate.update({"test" => "insert"},
                              {"$set" => {"test" => "update"}}, :safe => true)
            times << Time.now - t1
          end
        end
      end
    end

    100.times do |i|
      threads[i].join
    end
    @conn.close
  end

  def test_safe_insert
    setup_safe_data
    threads = []
    100.times do |i|
      threads[i] = Thread.new do
        if i % 2 == 0
          assert_raise Mongo::OperationFailure do
            @unique.insert({"test" => "insert"}, :safe => true)
          end
        else
          @duplicate.insert({"test" => "insert"}, :safe => true)
        end
      end
    end

    100.times do |i|
      threads[i].join
    end
    @conn.close
  end

  def setup_replica_set_connection
    @conn = ReplSetConnection.new([self.rs.host, self.rs.ports[0]],
                                 :pool_size => 100, :auto_refresh => :sync,
                                 :refresh_interval => 2)
    @db = @conn[MONGO_TEST_DB]
    @coll = @db.collection('thread-test-collection')
  end

  def test_threading_with_queries
    setup_replica_set_connection
    @coll.drop
    @coll = @db.collection('thread-test-collection')

    1000.times do |i|
      @coll.insert("x" => i)
    end

    threads = []

    10.times do |i|
      threads[i] = Thread.new do
        100.times do
          sum = 0
          @coll.find().each do |document|
            sum += document["x"]
          end
          assert_equal 499500, sum
        end
      end
    end

    10.times do |i|
      threads[i].join
    end
    @conn.close
  end
end
