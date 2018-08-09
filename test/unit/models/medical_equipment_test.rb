require 'test_helper'

class MedicalEquipmentTest < Minitest::Test
  # test content geared for QDM 5.4
  # only testing QDM 5.4 diffs for now

  def setup
    @medical_equipment = MedicalEquipment.new
  end

  # anatomical approach removed from device in QDM 5.4
  def test_anatomical_approach_not_present
    assert !@medical_equipment.respond_to?(:anatomical_approach)
    assert !@medical_equipment.respond_to?(:anatomicalApproach)
  end
end
