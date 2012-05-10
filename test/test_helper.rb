require_relative "./simplecov"
require 'factory_girl'

require_relative '../lib/health-data-standards'

require 'pry'

require 'minitest/autorun'



FactoryGirl.find_definitions

db_host = ENV['TEST_DB_HOST'] || 'localhost'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new(db_host).db("hds-test")
end

class MiniTest::Unit::TestCase
  # Add more helper methods to be used by all tests here...
  
  def collection_fixtures(collection, *id_attributes)
    Mongoid.database[collection].drop
    Dir.glob(File.join(File.dirname(__FILE__), 'fixtures', collection, '*.json')).each do |json_fixture_file|
      #puts "Loading #{json_fixture_file}"
      fixture_json = JSON.parse(File.read(json_fixture_file))
      id_attributes.each do |attr|
        fixture_json[attr] = BSON::ObjectId.from_string(fixture_json[attr])
      end

      Mongoid.database[collection].save(fixture_json, :safe=>true)
    end
  end
end