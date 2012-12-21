require 'test_helper'

class EntryTemplateResolverTest < MiniTest::Unit::TestCase
  def test_qrda_oid_exist
    assert QrdaGenerator::Export::EntryTemplateResolver.qrda_oid_exist?("2.16.840.1.113883.10.20.24.3.1")
  end

  def test_qrda_oid_for_hqmf_oid
    assert_equal "2.16.840.1.113883.10.20.24.3.1", QrdaGenerator::Export::EntryTemplateResolver.qrda_oid_for_hqmf_oid("2.16.840.1.113883.3.560.1.9")
  end
end