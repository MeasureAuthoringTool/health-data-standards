require 'test_helper'
require 'webmock'
class VSApiTest < Minitest::Test
  include WebMock::API

  def initialize(name = nil)
    stub_request(:post,'https://localhost/token').with(:body =>{"password"=>"mypassword", "username"=>"myusername"}).to_return( :body=>"proxy_ticket")
    stub_request(:post,'https://localhost/token/proxy_ticket').with(:body =>{"service"=>"http://umlsks.nlm.nih.gov"}).to_return( :body=>"ticket")
    super(name)
  end

  def test_api
    valueset_xml_by_date = {}
    doc_ng = {}
    valueset_xml_version = {}

    valueset_xml_by_date[:old] = "20101025"
    valueset_xml_by_date[:new] = "20130401"
    valueset_xml_by_date[:none] = ""

    valueset_xml_by_date.each do |valueset_xml|
      version = valueset_xml[1]
      valueset_xml_by_date[valueset_xml[0]] = %{<?xml version="1.0" encoding="UTF-8"?><RetrieveValueSetResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" cacheExpirationHint="2012-09-20T00:00:00-04:00" xmlns:nlm="urn:ihe:iti:svs:2008" xmlns="urn:ihe:iti:svs:2008"><ValueSet id="2.16.840.1.113883.11.20.9.23" version="#{ version }"></ValueSet></RetrieveValueSetResponse>}
      doc_ng[valueset_xml[0]] = Nokogiri::XML(valueset_xml_by_date[valueset_xml[0]])
      valueset_xml_version[valueset_xml[0]] = doc_ng[valueset_xml[0]].xpath("//nlm:RetrieveValueSetResponse//nlm:ValueSet/@version")[0].value
      api = HealthDataStandards::Util::VSApi.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")

      assert_equal "proxy_ticket", api.proxy_ticket
      assert_equal "ticket", api.get_ticket

      unless valueset_xml_version[valueset_xml[0]] == ""
        stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket", :effectiveDate=>valueset_xml_version[valueset_xml[0]]}).to_return(:body=>valueset_xml_by_date[valueset_xml[0]])
        assert_equal valueset_xml_by_date[valueset_xml[0]], api.get_valueset("oid", valueset_xml_version[valueset_xml[0]])
        api.get_valueset("oid", valueset_xml_version[valueset_xml[0]]) do |oid,vs|
          assert_equal "oid", oid
          assert_equal valueset_xml_by_date[valueset_xml[0]], vs
        end
      end

      if valueset_xml_version[valueset_xml[0]] == ""
        stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket"}).to_return(:body=>valueset_xml_by_date[valueset_xml[0]])
        assert_equal valueset_xml_by_date[valueset_xml[0]], api.get_valueset("oid")
        api.get_valueset("oid") do |oid,vs|
          assert_equal "oid", oid
          assert_equal valueset_xml_by_date[valueset_xml[0]], vs
        end
      end
    end
	end

  def test_api_v2_with_version
    valueset_xml_version = "MU2 Update 2015-05-01"
    valueset_xml = %{<?xml version="1.0" encoding="UTF-8"?><RetrieveValueSetResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" cacheExpirationHint="2012-09-20T00:00:00-04:00" xmlns:nlm="urn:ihe:iti:svs:2008" xmlns="urn:ihe:iti:svs:2008"><ValueSet id="2.16.840.1.113883.11.20.9.23" version="#{ valueset_xml_version }"></ValueSet></RetrieveValueSetResponse>}
    stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket" ,:version => valueset_xml_version}).to_return(:body=>valueset_xml)
    api = HealthDataStandards::Util::VSApiV2.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")
    api.get_valueset("oid", version: valueset_xml_version) do |oid,vs|
      assert_equal "oid", oid
      assert_equal valueset_xml, vs
    end
  end
  
  def test_api_v2_with_include_draft_default_profile
    valueset_xml = %{<?xml version="1.0" encoding="UTF-8"?><RetrieveValueSetResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" cacheExpirationHint="2012-09-20T00:00:00-04:00" xmlns:nlm="urn:ihe:iti:svs:2008" xmlns="urn:ihe:iti:svs:2008"><ValueSet id="2.16.840.1.113883.11.20.9.23" version="Draft"></ValueSet></RetrieveValueSetResponse>}
    stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket", :includeDraft=>"yes", :profile=>"Most Recent CS Versions"}).to_return(:body=>valueset_xml)
    api = HealthDataStandards::Util::VSApiV2.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")
    api.get_valueset("oid", include_draft: true) do |oid,vs|
      assert_equal "oid", oid
      assert_equal valueset_xml, vs
    end
  end
  
  def test_api_v2_with_include_draft_specified_profile
    valueset_xml = %{<?xml version="1.0" encoding="UTF-8"?><RetrieveValueSetResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" cacheExpirationHint="2012-09-20T00:00:00-04:00" xmlns:nlm="urn:ihe:iti:svs:2008" xmlns="urn:ihe:iti:svs:2008"><ValueSet id="2.16.840.1.113883.11.20.9.23" version="Draft"></ValueSet></RetrieveValueSetResponse>}
    stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket", :includeDraft=>"yes", :profile=>"Test Profile"}).to_return(:body=>valueset_xml)
    api = HealthDataStandards::Util::VSApiV2.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")
    api.get_valueset("oid", include_draft: true, profile: "Test Profile") do |oid,vs|
      assert_equal "oid", oid
      assert_equal valueset_xml, vs
    end
  end

  def test_api_v2
    valueset_xml = %{<?xml version="1.0" encoding="UTF-8"?><RetrieveValueSetResponse xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" cacheExpirationHint="2012-09-20T00:00:00-04:00" xmlns:nlm="urn:ihe:iti:svs:2008" xmlns="urn:ihe:iti:svs:2008"><ValueSet id="2.16.840.1.113883.11.20.9.23"></ValueSet></RetrieveValueSetResponse>}
    stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket"}).to_return(:body=>valueset_xml)
    api = HealthDataStandards::Util::VSApiV2.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")
    api.get_valueset("oid") do |oid, vs|
      assert_equal "oid", oid
      assert_equal valueset_xml, vs
    end
  end

  def test_404_response
    stub_request(:get,'https://localhost/vsservice').with(:query =>{:id=>"oid", :ticket=>"ticket"}).to_return(:status => 404, :headers => {:Warning => "111 NAV: Unknown value set"})
    api = HealthDataStandards::Util::VSApiV2.new("https://localhost/token", "https://localhost/vsservice", "myusername", "mypassword")
    assert_raises HealthDataStandards::Util::VSNotFoundError, "Doesn't raise proper exception for an unknown Valueset" do
      api.get_valueset("oid")
    end
  end

end
