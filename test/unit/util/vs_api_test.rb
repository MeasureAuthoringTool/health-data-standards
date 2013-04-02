require 'test_helper'
require 'webmock'
class EntryTest < MiniTest::Unit::TestCase
  include WebMock::API
  
	def test_api

        #doc_new_effective_date = Nokogiri::XML(File.new('test/fixtures/util/vs_api_new_effective_date.xml'))
        doc = '<?xml version="1.0" encoding="UTF-8"?><RetrieveValueSetResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" cacheExpirationHint="2012-09-20T00:00:00-04:00" xmlns="urn:ihe:iti:svs:2008"><ValueSet id="2.16.840.1.113883.11.20.9.23" version="#{version}"> </ValueSet></RetrieveValueSetResponse>'

    	stub_request(:post,'https://localhost/token').with(:body =>{"password"=>"mypassword", "username"=>"myusername"}).to_return( :body=>"proxy_ticket")

        binding.pry

    	stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket"}).to_return( :body=>"<ValuesetResponse/>")
        stub_request(:post,'https://localhost/token/proxy_ticket').with(:body =>{"service"=>"http://umlsks.nlm.nih.gov"}).to_return( :body=>"ticket")
        api = HealthDataStandards::Util::VSApi.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")
        api_old_effective_date = HealthDataStandards::Util::VSApi.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword", "20101025")
        api_new_effective_date = HealthDataStandards::Util::VSApi.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword", "20130401")
        assert_equal "proxy_ticket" , api.proxy_ticket
        assert_equal "ticket", api.get_ticket
        assert_equal "<ValuesetResponse/>", api.get_valueset("oid")

        api.get_valueset("oid") do |oid,vs|
        	assert_equal "oid", oid
        	assert_equal "<ValuesetResponse/>", vs
        end

	end
end