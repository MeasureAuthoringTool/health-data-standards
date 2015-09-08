require 'test_helper'
require 'webmock'

class EntryTest < Minitest::Test
  include WebMock::API

  def initialize(name = nil)
    $nlmUrl = "https://uts-ws.nlm.nih.gov/restful/isValidUMLSUser"
    stub_request(:post,'https://uts-ws.nlm.nih.gov/restful/isValidUMLSUser').with(:body =>{"password"=>"mypassword", "user"=>"myusername", "licenseCode"=>"mylicense"}).to_return( :body=>"<?xml version='1.0' encoding='UTF-8'?><Result>true</Result>")
    stub_request(:post,'https://uts-ws.nlm.nih.gov/restful/isValidUMLSUser').with(:body =>{"password"=>"notmypassword", "user"=>"myusername", "licenseCode"=>"mylicense"}).to_return( :body=>"<?xml version='1.0' encoding='UTF-8'?><Result>false</Result>")
    super(name)
  end
  #Returns true when verification fails
  def test_validate_nlm_credentials
    ts = HealthDataStandards::Util::NLMHelper.validateNLMUser($nlmUrl,'', 'mylicense', 'myusername', 'mypassword')
    assert_equal true, ts
  end
  #Returns false when verification fails
  def test_validate_nlm_credentials_fail
    ts = HealthDataStandards::Util::NLMHelper.validateNLMUser($nlmUrl,'', 'mylicense', 'myusername', 'notmypassword')
    assert_equal false, ts
  end
end