require 'test_helper'

class ProviderTest < Minitest::Test

  def test_valid_npi_value
    assert_equal "3", HealthDataStandards::Provider.luhn_checksum('7992739871')
    assert HealthDataStandards::Provider.valid_npi?('1234567893')
    assert HealthDataStandards::Provider.valid_npi?('808401234567893')
    refute HealthDataStandards::Provider.valid_npi?('1')
    refute HealthDataStandards::Provider.valid_npi?('1010101010')
    refute HealthDataStandards::Provider.valid_npi?('abcdefghij')
  end

  def test_npi_assignment
    # A provider should only have a single NPI
    p = HealthDataStandards::Provider.new
    p.npi = '1234567893'
    assert_equal 1, p.cda_identifiers.length
    p.npi = '808401234567893'
    assert_equal 1, p.cda_identifiers.length
    assert_equal '808401234567893', p.npi
  end
end