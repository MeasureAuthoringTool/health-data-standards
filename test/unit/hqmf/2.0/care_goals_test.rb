require_relative '../../../test_helper'

class CareGoalsTest <  Test::Unit::TestCase
  def test_caregoals
     path = File.expand_path("../../../../fixtures/2.1/measures/caregoals.xml", __FILE__)
     hqmf_contents = File.open(path).read
     doc = HQMF2::Document.new(hqmf_contents)
     dc = doc.data_criteria("prefix_9b02dfe4_c807_4fb9_b1e7_bf53d4dbc247")
     assert dc
     assert_equal dc.definition, 'care_goal'
     targetOutome = dc.field_values['TARGET_OUTCOME']
     assert targetOutome
     assert_equal targetOutome.class, HQMF2::AnyValue
  end
end
