require 'test_helper'
require 'webmock'
class EntryTest < MiniTest::Unit::TestCase
  include WebMock::API
  
	def test_api
        effective_dates = {}
        doc_ng = {}
        version_xml = {}

        effective_dates[:old] = "20101025"
        effective_dates[:new] = "20130401"
        effective_dates[:none] = ""
        stub_request(:post,'https://localhost/token').with(:body =>{"password"=>"mypassword", "username"=>"myusername"}).to_return( :body=>"proxy_ticket")
        stub_request(:post,'https://localhost/token/proxy_ticket').with(:body =>{"service"=>"http://umlsks.nlm.nih.gov"}).to_return( :body=>"ticket")

        effective_dates.each do |date| 
            version = date[1]
            effective_dates[date[0]] = %{<?xml version="1.0" encoding="UTF-8"?><RetrieveValueSetResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" cacheExpirationHint="2012-09-20T00:00:00-04:00" xmlns:nlm="urn:ihe:iti:svs:2008" xmlns="urn:ihe:iti:svs:2008"><ValueSet id="2.16.840.1.113883.11.20.9.23" version="#{ version }"></ValueSet></RetrieveValueSetResponse>}
            doc_ng[date[0]] = Nokogiri::XML(effective_dates[date[0]])
            version_xml[date[0]] = doc_ng[date[0]].xpath("//nlm:RetrieveValueSetResponse//nlm:ValueSet/@version")[0].value

            unless version_xml[date[0]] == ""
                stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket", :effective_date=>version_xml[date[0]]}).to_return(:body=>effective_dates[date[0]])
                api = HealthDataStandards::Util::VSApi.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword", version_xml[date[0]])
            end

            if version_xml[date[0]] == "" 
                stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket"}).to_return(:body=>effective_dates[date[0]])
                api = HealthDataStandards::Util::VSApi.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")
            end

            assert_equal "proxy_ticket" , api.proxy_ticket
            assert_equal "ticket", api.get_ticket
            assert_equal effective_dates[date[0]], api.get_valueset("oid")

            api.get_valueset("oid") do |oid,vs|
                assert_equal "oid", oid
                assert_equal effective_dates[date[0]], vs
            end
        end
	end
end