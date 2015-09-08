require 'test_helper'

class EntryTest < Minitest::Test
  #Should fail
  def test_validate_nlm_credentials
    ts = HealthDataStandards::Util::NLMHelper.validateNLMUser('', 'wrong', 'username', 'password')
    assert_equal false, ts
  end
end