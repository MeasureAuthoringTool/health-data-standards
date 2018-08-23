require 'test_helper'

class MedicationTest < Minitest::Test
  # test content geared for QDM 5.4
  # only testing QDM 5.4 diffs for now
  def setup
    @medication = Medication.new
  end
   # setting attribute added to medication order in QDM 5.4
  def test_setting_present
    assert @medication.respond_to?(:setting)
  end
  def test_dispenser_identifier_present
    assert @medication.respond_to?(:dispenser_identifier)
  end
  def test_prescriber_identifier_present
    assert @medication.respond_to?(:prescriber_identifier)
  end
  def test_days_supplied_present
    assert @medication.respond_to?(:days_supplied)
  end
end
