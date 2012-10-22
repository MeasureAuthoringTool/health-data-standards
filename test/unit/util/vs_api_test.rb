require 'test_helper'
require 'webmock'
class EntryTest < MiniTest::Unit::TestCase
  include WebMock::API
  
	def test_api

		stub_request(:post,'https://localhost/token/').with(:body =>{"password"=>"mypassword", "username"=>"myusername"}).to_return( :body=>"proxy_ticket")
		stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket"}).to_return( :body=>"<ValuesetResponse/>")
    stub_request(:post,'https://localhost/token/proxy_ticket').with(:body =>{"service"=>"http://umlsks.nlm.nih.gov"}).to_return( :body=>"ticket")
    api = HealthDataStandards::Util::VSApi.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")

    assert_equal "proxy_ticket" , api.proxy_ticket
    assert_equal "ticket", api.get_ticket
    assert_equal "<ValuesetResponse/>", api.get_valueset("oid")

    api.get_valueset("oid") do |oid,vs|
    	assert_equal "oid", oid
    	assert_equal "<ValuesetResponse/>", vs
    end

	end




end