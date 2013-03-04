require 'test_helper'

class RecordTest < MiniTest::Unit::TestCase

  def test_entries_for_oid
    record = FactoryGirl.create(:bigger_record)
    assert_equal 3, record.conditions.size
    # Make sure that the sequence hasn't gone past 3 in the conditions oid
    assert record.conditions.map { |c| c.oid }.include?("1.2.3.3")
    entries = record.entries_for_oid("1.2.3.3")
    assert_equal 2, entries.size
    assert entries.find { |entry| entry.description == "Tobacco user" }
    assert entries.find { |entry| entry.free_text == "Sample Encounter" }
  end

  def test_dedup_section
    record = Record.new
    identifier = CDAIdentifier.new(root: '1.2.3.4')
    record.encounters << Encounter.new
    record.encounters << Encounter.new(cda_identifier: identifier)
    record.encounters << Encounter.new(cda_identifier: identifier)
    record.encounters << Encounter.new(cda_identifier: CDAIdentifier.new(root: 'abcd'))

    assert_equal 4, record.encounters.size

    record.dedup_section! :encounters

    assert_equal 3, record.encounters.size    
  end

  def test_dedup_record
    record = Record.new
    identifier = CDAIdentifier.new(root: '1.2.3.4')
    record.encounters << Encounter.new
    record.encounters << Encounter.new(cda_identifier: identifier)
    record.encounters << Encounter.new(cda_identifier: identifier)
    record.encounters << Encounter.new(cda_identifier: CDAIdentifier.new(root: 'abcd'))

    assert_equal 4, record.encounters.size

    record.dedup_record!

    assert_equal 3, record.encounters.size    
  end
end