require 'test_helper'

class RecordTest < MiniTest::Unit::TestCase

  def setup
    @record = FactoryGirl.create(:bigger_record)
  end

  def test_entries_for_oid
    assert_equal 3, @record.conditions.size
    # Make sure that the sequence hasn't gone past 3 in the conditions oid
    assert @record.conditions.map { |c| c.oid }.include?("1.2.3.3")
    entries = @record.entries_for_oid("1.2.3.3")
    assert_equal 2, entries.size
    assert entries.find { |entry| entry.description == "Tobacco user" }
    assert entries.find { |entry| entry.free_text == "Sample Encounter" }
  end
end