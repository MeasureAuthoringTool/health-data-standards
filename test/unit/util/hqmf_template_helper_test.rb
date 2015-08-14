require 'test_helper'

class HQMFTemplateHelperTest < Minitest::Test
  def test_definition_for_template_id
    definition = HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id("2.16.840.1.113883.3.560.1.31")
    assert_equal "communication_from_provider_to_patient", definition['definition']
  end

  def test_template_id_by_definition_and_status
    oid = HealthDataStandards::Util::HQMFTemplateHelper.template_id_by_definition_and_status("intervention", "recommended")
    assert_equal "2.16.840.1.113883.3.560.1.89", oid
  end

  def test_definition_for_template_id_different_versions
    definition = HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id("2.16.840.1.113883.10.20.28.3.56", "r2")
    assert_equal "patient_characteristic_ethnicity", definition['definition']
    definition = HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id("2.16.840.1.113883.3.560.1.31", "r1")
    assert_equal "communication_from_provider_to_patient", definition['definition']
  end
end
