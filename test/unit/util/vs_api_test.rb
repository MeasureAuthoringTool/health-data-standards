require 'test_helper'
require 'webmock'
class EntryTest < MiniTest::Unit::TestCase
  include WebMock::API
  
	def test_api

		stub_request(:post,'https://localhost/token').with(:body =>"username=myusername&password=mypassword").to_return( :body=>"ticket")
		stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket"}).to_return( :body=>"<ValuesetResponse/>")

    api = HealthDataStandards::Util::VSApi.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")

    assert_equal "ticket" , api.ticket
    assert_equal "<ValuesetResponse/>", api.get_valueset("oid")

    api.get_valueset("oid") do |oid,vs|
    	assert_equal "oid", oid
    	assert_equal "<ValuesetResponse/>", vs
    end

	end




end