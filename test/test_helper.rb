require_relative "./simplecov"
require 'factory_girl'

require_relative '../lib/health-data-standards'
PROJECT_ROOT = File.expand_path("../../", __FILE__)
require_relative File.join(PROJECT_ROOT, 'lib', 'hqmf-parser')

require 'pry'

require 'minitest/autorun'

require 'bundler/setup'
require 'test/unit'
require 'turn'

FactoryGirl.find_definitions

db_host = ENV['TEST_DB_HOST'] || 'localhost'

Mongoid.configure do |config|
  config.sessions = { default: { hosts: [ "#{db_host}:27017" ], database: 'hds-test' }}
end

MONGO_DB = Mongoid.default_session

class MiniTest::Unit::TestCase
  # Add more helper methods to be used by all tests here...
  
  def collection_fixtures(collection, *id_attributes)
    Mongoid.session(:default)[collection].drop
    Dir.glob(File.join(File.dirname(__FILE__), 'fixtures', collection, '*.json')).each do |json_fixture_file|
      #puts "Loading #{json_fixture_file}"
      fixture_json = JSON.parse(File.read(json_fixture_file))
      id_attributes.each do |attr|
        fixture_json[attr] = Moped::BSON::ObjectId.from_string(fixture_json[attr])
      end

      Mongoid.session(:default)[collection].insert(fixture_json)
    end
  end


  # Delete all collections from the database.
  def dump_database
    Mongoid.session(:default).collections.each do |collection|
      collection.drop unless collection.name.include?('system.') 
    end
  end

end

class Hash
  def diff_hash(other, ignore_id=false, clean_reference=true)
    (self.keys | other.keys).inject({}) do |diff, k|
      left = self[k]
      right = other[k]
      right = right.gsub(/_precondition_\d+/, '') if (right && k==:reference && clean_reference)
      unless left == right
        if left.is_a? Hash
          if right.nil?
            tmp = left
          else
            tmp = left.diff_hash(right,ignore_id)
          end
          diff[k] = tmp unless tmp.empty?
        elsif left.is_a? Array
          tmp = []
          left.each_with_index do |entry,i|
            if (right and right[i])
              if entry.is_a? Hash
                entry_diff = entry.diff_hash(right[i],ignore_id)
              elsif left != right
                entry_diff = left.to_s
              end
            else
              entry_diff = left.to_s
            end
            tmp << entry_diff unless entry_diff.empty?
          end
          diff[k] = tmp unless tmp.empty?
        elsif(left==nil && right && right.respond_to?(:empty?) && right.empty?)
          # do nothing so nil will match an empty hash or array
        elsif(!ignore_id || (k != :id && k!="id"))
          diff[k] = "EXPECTED: [#{left}], FOUND: [#{right}]"
        end
      end
      diff
    end
  end
end


HealthDataStandards.logger.outputters = Log4r::FileOutputter.new('Health Data Standards', filename: 'test.log', trunc: true)
  
def collection_fixtures(collection, *id_attributes)
  Mongoid.session(:default)[collection].drop
  Dir.glob(File.join(File.dirname(__FILE__), 'fixtures', collection, '*.json')).each do |json_fixture_file|
    #puts "Loading #{json_fixture_file}"
    fixture_json = JSON.parse(File.read(json_fixture_file))
    id_attributes.each do |attr|
      fixture_json[attr] = Moped::BSON::ObjectId.from_string(fixture_json[attr])
    end

    Mongoid.session(:default)[collection].insert(fixture_json)
  end
end

collection_fixtures('records', '_id')
collection_fixtures('health_data_standards_svs_value_sets', '_id')
collection_fixtures('measures')

MEASURES = []
Mongoid.session(:default)['measures'].find.each do |measure|
  MEASURES << HQMF::Document.from_json(measure)
end
