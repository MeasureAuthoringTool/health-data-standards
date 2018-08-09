require 'test_helper'

class ProcedureTest < Minitest::Test
  # test content geared for QDM 5.4
  # only testing QDM 5.4 diffs for now

  def setup
    @procedure = Procedure.new
  end

  # anatomical approach removed from device in QDM 5.4
  def test_anatomical_approach_not_present
    assert !@procedure.respond_to?(:anatomical_approach)
    assert !@procedure.respond_to?(:anatomicalApproach)
  end
end
