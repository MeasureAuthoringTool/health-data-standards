require 'test_helper'

class RecordTest < Minitest::Test

  def test_entries_for_oid
    record = FactoryGirl.create(:bigger_record)
    assert_equal 3, record.conditions.size
    # Make sure that the sequence hasn't gone past 3 in the conditions oid
    assert record.conditions.map { |c| c.oid }.include?("1.2.3.3")
    entries = record.entries_for_oid("1.2.3.3")
    assert_equal 2, entries.size
    assert entries.find { |entry| entry.description == "Tobacco user" }
    assert entries.find { |entry| entry.description == "Sample Encounter" }
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

  def test_dedup_encounters_section
    record = Record.new
    identifier = CDAIdentifier.new(root: '1.2.3.4')
    value_a = PhysicalQuantityResultValue.new(scalar: 10)
    value_b = PhysicalQuantityResultValue.new(scalar: 20)
    record.encounters << Encounter.new(cda_identifier: identifier, codes: {:x => {:y => "z", :z => ["c"]}}, values: [value_a])
    record.encounters << Encounter.new(cda_identifier: identifier, codes: {:a => "b", :x => {:z => "a"}}, values: [value_b])

    assert_equal 2, record.encounters.size

    record.dedup_section! :encounters

    assert_equal 1, record.encounters.size
    assert_equal({:x => {:y => "z", :z => ["c", "a"]}, :a => "b"}, record.encounters[0].codes)
    assert_equal([value_a, value_b], record.encounters[0].values)
  end

  def test_dedup_procedures_section
    record = Record.new
    identifier = CDAIdentifier.new(root: '1.2.3.4')
    value_a = PhysicalQuantityResultValue.new(scalar: 10)
    value_b = PhysicalQuantityResultValue.new(scalar: 20)
    record.procedures << Procedure.new(cda_identifier: identifier, codes: {:x => {:y => "z"}}, values: [value_a])
    record.procedures << Procedure.new(cda_identifier: identifier, codes: {:a => "b", :x => {:z => "a"}}, values: [value_b])

    assert_equal 2, record.procedures.size

    record.dedup_section! :procedures

    assert_equal 1, record.procedures.size
    assert_equal({:x => {:y => "z", :z => "a"}, :a => "b"}, record.procedures[0].codes)
    assert_equal([value_a, value_b], record.procedures[0].values)
  end

  def test_dedup_results_section
    record = Record.new
    identifier = CDAIdentifier.new(root: '1.2.3.4')
    value_a = PhysicalQuantityResultValue.new(scalar: 10)
    value_b = PhysicalQuantityResultValue.new(scalar: 20)
    record.results << LabResult.new(cda_identifier: identifier, codes: {:x => {:y => "z"}}, values: [value_a])
    record.results << LabResult.new(cda_identifier: identifier, codes: {:a => "b", :x => {:z => "a"}}, values: [value_b])

    assert_equal 2, record.results.size

    record.dedup_section! :results

    assert_equal 1, record.results.size
    assert_equal({:x => {:y => "z", :z => "a"}, :a => "b"}, record.results[0].codes)
    assert_equal([value_a, value_b], record.results[0].values)
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