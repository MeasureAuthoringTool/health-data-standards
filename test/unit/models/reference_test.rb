require 'test_helper'

class ReferenceTest < MiniTest::Test

   def test_references
     r = Record.new
     c1 = r.conditions.build
     c2 = r.conditions.build
     c1.add_reference(c2,"FLFS")
     refs = c1.references.where(type: "FLFS")
     assert_equal 1, refs.length, "expected 1 reference"
     assert_equal c2, refs[0].resolve_reference
   end
end
