require_relative '../../../test_helper'

class FieldValuesTest < Minitest::Test

  def setup
    path = File.expand_path("../../../../fixtures/2.1/measures/field_values.xml", __FILE__)
    hqmf_contents = File.open(path).read
    @doc = HQMF2::Document.new(hqmf_contents)
  end

  def test_ordinality

  end

  def test_reason
    assert_field_value("EncounterOrderReason","REASON")
  end

  def test_length_of_stay

  end

  def test_medication_dose
    assert_field_value("MedicationAdministeredDose","DOSE")
  end

  def test_reaction
    assert_field_value("DeviceAllergyReaction","REACTION")
    assert_field_value("DeviceIntoleranceReaction","REACTION")
  end

  def test_radiation_dose
    assert_field_value("DiagnosticStudyAERadiationDose","RADIATION_DOSAGE")
  end

  def test_radiation_duration
    assert_field_value("DiagnosticStudyAERadiationDuration","RADIATION_DURATION")
  end

  def test_laterality
    assert_field_value("DiagnosisActiveLaterality","LATERALITY")
  end


  def test_anatomical_location
    assert_field_value("DeviceAppliedAnatomicalLocationSite","ANATOMICAL_LOCATION_SITE")
  end

  def test_anatomical_approach
    assert_field_value("DeviceAppliedAnatomicalApproachSite","ANATOMICAL_APPROACH_SITE")
  end

  def test_method
    assert_field_value("ProcedureOrderMethod","METHOD")
  end

  def test_medication_datetimes
    assert_field_value("MedicationOrderActiveDatetime","ACTIVE_DATETIME")
    assert_field_value("MedicationOrderSignedDatetime","SIGNED_DATETIME")
    assert_field_value("MedicationOrderStartDatetime","START_DATETIME")
    assert_field_value("MedicationOrderStopDatetime","STOP_DATETIME")
  end

  def test_medication_route
    assert_field_value("MedicationActiveRoute","ROUTE")
  end

  def test_patient_preference

  end

  def test_provider_preference

  end

  def test_refills
    assert_field_value("MedicationDischargeRefills","REFILLS")
  end

  def test_target_outcome
    assert_field_value("CareGoalTargetOutcome","TARGET_OUTCOME")
  end

  def test_realted_to

  end

  def assert_field_value(criteria, field)
    dc = @doc.instance_variable_get('@data_criteria').detect { |dc| dc.id.starts_with?(criteria) }
    reaction = dc.field_values[field]
    assert reaction
    reaction
  end

end
