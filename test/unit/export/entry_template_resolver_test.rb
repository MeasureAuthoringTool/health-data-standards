require 'test_helper'

class EntryTemplateResolverTest < MiniTest::Unit::TestCase
  def test_qrda_oid_exist
    assert HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_exist?("2.16.840.1.113883.10.20.24.3.1")
  end

  def test_qrda_oid_for_hqmf_oid
    assert_equal "2.16.840.1.113883.10.20.24.3.1", HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_for_hqmf_oid("2.16.840.1.113883.3.560.1.9")

    assert_equal '2.16.840.1.113883.10.20.24.3.103', HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_for_hqmf_oid('2.16.840.1.113883.3.560.1.1001', '2.16.840.1.113883.3.526.3.1279')

  end

  def test_qrda_oid_for_hqmf_patient_characteristic

    assert_equal '2.16.840.1.113883.10.20.24.3.103', HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_for_hqmf_patient_characteristic('2.16.840.1.113883.3.526.3.1279')
    assert_equal '2.16.840.1.113883.10.20.24.3.101', HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_for_hqmf_patient_characteristic('2.16.840.1.113883.3.117.1.7.1.402')
    assert_equal '2.16.840.1.113883.10.20.24.3.101', HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_for_hqmf_patient_characteristic('2.16.840.1.113883.3.117.1.7.1.403')
    assert_equal '2.16.840.1.113883.10.20.22.4.85', HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_for_hqmf_patient_characteristic('2.16.840.1.113883.3.526.3.1189')
    assert_equal '2.16.840.1.113883.10.20.22.4.85', HealthDataStandards::Export::QRDA::EntryTemplateResolver.qrda_oid_for_hqmf_patient_characteristic('2.16.840.1.113883.3.526.3.1170')

  end


end