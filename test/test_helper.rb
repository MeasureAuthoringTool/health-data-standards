require_relative '../lib/health-data-standards'
require 'minitest/autorun'
require 'pry'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("hds-test")
end