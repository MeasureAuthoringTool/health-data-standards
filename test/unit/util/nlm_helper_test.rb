require 'test_helper'

class EntryTest < Minitest::Test
  #Should fail
  def test_validate_nlm_credentials
  	WebMock.disable!
    ts = HealthDataStandards::Util::NLMHelper.validateNLMUser('', 'wrong', 'username', 'password')
    assert_equal false, ts
    WebMock.enable!
  end
end