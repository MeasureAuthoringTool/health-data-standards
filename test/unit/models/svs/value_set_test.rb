require 'test_helper'

class ValueSetTest < MiniTest::Unit::TestCase
  def test_load_from_xml
    doc = Nokogiri::XML(File.new('test/fixtures/value_sets/value_sets.xml'))
    vs = HealthDataStandards::SVS::ValueSet.load_from_xml(doc)
    assert_equal '1.3.6.1.4.1.33895.1.3.0.45', vs.oid
    assert vs.concepts.any? {|c| c.code == "103735009"}
  end

  def test_code_set_map
    doc = Nokogiri::XML(File.new('test/fixtures/value_sets/value_sets.xml'))
    vs = HealthDataStandards::SVS::ValueSet.load_from_xml(doc)
    code_set_map = vs.code_set_map
    assert code_set_map
    assert_equal 1, code_set_map.length
    assert_equal code_set_map[0]['set'], 'SNOMED-CT'
    assert_includes code_set_map[0]['values'], "103735009"
  end
end