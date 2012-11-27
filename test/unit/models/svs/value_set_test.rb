require 'test_helper'

class ValueSetTest < MiniTest::Unit::TestCase
  def test_load_from_xml
    doc = Nokogiri::XML(File.new('test/fixtures/value_sets/value_sets.xml'))
    vs = HealthDataStandards::SVS::ValueSet.load_from_xml(doc)
    assert_equal '1.3.6.1.4.1.33895.1.3.0.45', vs.oid
    assert vs.concepts.any? {|c| c.code == "103735009"}
  end
end