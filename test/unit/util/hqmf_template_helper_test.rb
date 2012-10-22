require 'test_helper'

class HQMFTemplateHelperTest < MiniTest::Unit::TestCase
  def test_definition_for_template_id
    definition = HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id("2.16.840.1.113883.3.560.1.31")
    assert_equal "communication_from_provider_to_patient", definition['definition']
  end

  def test_template_id_by_definition_and_status
    oid = HealthDataStandards::Util::HQMFTemplateHelper.template_id_by_definition_and_status("intervention", "recommended")
    assert_equal "2.16.840.1.113883.3.560.1.89", oid
  end
end