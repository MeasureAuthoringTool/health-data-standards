require 'simplecov'
require 'factory_girl'

require_relative '../lib/health-data-standards'
PROJECT_ROOT = File.expand_path("../../", __FILE__)
require_relative File.join(PROJECT_ROOT, 'lib', 'hqmf-parser')

require 'minitest/autorun'
require "minitest/reporters"

require 'bundler/setup'

require 'webmock/minitest'

FactoryGirl.find_definitions

db_host = ENV['TEST_DB_HOST'] || 'localhost'

Mongoid.configure do |config|
  config.connect_to('hds-test')
end
Mongo::Logger.logger.level = Logger::WARN
MONGO_DB = Mongoid.default_client

class Minitest::Test
  extend Minitest::Spec::DSL
  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

  # Add more helper methods to be used by all tests here...

  def collection_fixtures(file_path, *id_attributes)
    # Mongoid names collections based off of the default_client argument.
    # With nested folders,the collection name is “records/X” (for example).
    # To ensure we have consistent collection names in Mongoid, we need to take the file directory as the collection name.
    collection_name = file_path.split(File::SEPARATOR)[0]
    Mongoid.client(:default)[collection_name].drop

    Dir.glob(File.join(File.dirname(__FILE__), 'fixtures', file_path, '*.json')).each do |json_fixture_file|
      fixture_json = JSON.parse(File.read(json_fixture_file), max_nesting: 250)
      if fixture_json.length == 0
        next
      end

      # Value_sets are arrays of objects, unlike measures etc, so we need to iterate in that case.
      fixture_json = [fixture_json] unless fixture_json.kind_of? Array

      fixture_json.each do |fixture|
        convert_times(fixture)
        set_mongoid_ids(fixture)
        fix_binary_data(fixture)

        # cql measures store data criteria differently than what is expected by the hds measure model.
        # it doesn't make sense to add a whole new cql model just for testing, so transforming the
        # 'data_criteria' field to facilitate testing.
        # this should not be a long term solution because we will eventually move to the qdm measure model.
        if collection_name == 'measures' && fixture.key?('cql')
          data_critiera = fixture['data_criteria']
          fixture['data_criteria'] = []
          data_critiera.each do |key, dc|
            fixture['data_criteria'] << { key.to_s => dc }
          end
        end

        id_attributes.each do |attr|
          fixture[attr] = BSON::ObjectId.from_string(fixture[attr])
        end

        Mongoid.client(:default)[collection_name].insert_one(fixture)
      end
    end
  end

  # JSON.parse doesn't catch time fields, so this converts fields ending in _at
  # to a Time object.
  def convert_times(json)
    if json.kind_of?(Hash)
      json.each_pair do |k,v|
        if k.ends_with?("_at")
          json[k] = Time.parse(v)
        end
      end
    end
  end

  def set_mongoid_ids(json)
    if json.kind_of?( Hash)
      json.each_pair do |k,v|
        if k == 'bundle_id' && v != nil && !v.empty?
          json[k] = BSON::ObjectId.from_string(v)
        end
        if v && v.kind_of?( Hash )
          if v["$oid"]
            json[k] = BSON::ObjectId.from_string(v["$oid"])
          else
            set_mongoid_ids(v)
          end
        end
      end
    end
  end

  def fix_binary_data(json)
    if json.kind_of?(Hash)
      json.each_pair do |k,v|
        if v.kind_of?(Hash)
          if v.has_key?('$binary')
            json[k] = BSON::Binary.new(Base64.decode64(v['$binary']), v['$type'].to_sym)
          else
            fix_binary_data(v)
          end
        end
      end
    end
  end

  def get_entry_xpath(qrda_oid)
    "//xmlns:entry//xmlns:templateId[@root=\"" + qrda_oid + "\"]/ancestor::xmlns:entry"
  end

  # Delete all collections from the database.
  def dump_database
    Mongoid.default_client.collections.each do |c|
      c.drop()
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
          diff[k] = {
            EXPECTED: left,
            FOUND: right
          }
        end
      end
      diff
    end
  end
end


HealthDataStandards.logger.outputters = Log4r::FileOutputter.new('Health Data Standards', filename: 'test.log', trunc: true)

def collection_fixtures(collection, *id_attributes)
  Mongoid.client(:default)[collection].drop
  Dir.glob(File.join(File.dirname(__FILE__), 'fixtures', collection, '*.json')).each do |json_fixture_file|
    #puts "Loading #{json_fixture_file}"
    fixture_json = JSON.parse(File.read(json_fixture_file), max_nesting: 250)

    id_attributes.each do |attr|
      fixture_json[attr] = BSON::ObjectId.from_string(fixture_json[attr])
    end

    Mongoid.client(:default)[collection].insert_one(fixture_json)
  end
end

def cat1_patient_data_section(doc)
  doc.xpath("/cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root = '2.16.840.1.113883.10.20.24.2.1']")
end

# make sure there's nothing left over from previous runs
Mongoid.client(:default).collections.each do |collection|
  collection.drop unless collection.name.include?('system.')
end

collection_fixtures('records', '_id')
collection_fixtures('health_data_standards_svs_value_sets', '_id', 'bundle_id')
collection_fixtures('bundles', '_id')
collection_fixtures('measures')
