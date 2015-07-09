require_relative '../../../test_helper'

class FulfillsTest <  Minitest::Test



  def test_fulfills

     path = File.expand_path("../../../../fixtures/2.1/measures/fulfills.xml", __FILE__)
     hqmf_contents = File.open(path).read
     doc = HQMF2::Document.new(hqmf_contents)
     dc = doc.data_criteria("Fulfills_28A79A40-3F99-4AAA-A6D9-8D68AE11D22C")
     fulfills = dc.field_values["FLFS"]
     assert fulfills
     assert_equal fulfills.reference, "AntithromboticTherapy_Medication,Order"
     assert_equal fulfills.mood, "RQO"
     assert_equal fulfills.type, "SBADM"
  end
end
