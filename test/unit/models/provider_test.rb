require 'test_helper'

class ProviderTest < MiniTest::Unit::TestCase
  
  def test_valid_npi_value
    assert_equal "3", Provider.luhn_checksum('7992739871')
    assert Provider.valid_npi?('1234567893')
    assert Provider.valid_npi?('808401234567893')
    refute Provider.valid_npi?('1')
    refute Provider.valid_npi?('1010101010')
    refute Provider.valid_npi?('abcdefghij')
  end
end