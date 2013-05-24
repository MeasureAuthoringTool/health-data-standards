require 'test_helper'

class CodeSystemHelperTest < MiniTest::Unit::TestCase
  def test_oid_lookup
    assert_equal HealthDataStandards::Util::CodeSystemHelper.code_system_for('2.16.840.1.113883.6.88'), 'RxNorm'
    assert_equal HealthDataStandards::Util::CodeSystemHelper.code_system_for('2.16.840.1.113883.6.59'), 'CVX'
    assert_equal HealthDataStandards::Util::CodeSystemHelper.code_system_for('2.16.840.1.113883.12.292'), 'CVX'
  end
  
  def test_name_lookup
    assert_equal HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system('RxNorm'), '2.16.840.1.113883.6.88'
    assert_equal HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system('CVX'), '2.16.840.1.113883.12.292'
    assert_equal HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system('NCI Thesaurus'), '2.16.840.1.113883.3.26.1.1'
    assert_equal HealthDataStandards::Util::CodeSystemHelper.oid_for_code_system('FDA SPL'), '2.16.840.1.113883.3.26.1.1'
  end
end