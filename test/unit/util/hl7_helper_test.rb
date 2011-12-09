require 'test_helper'

class EntryTest < MiniTest::Unit::TestCase
  def test_timestamp_to_integer
    ts = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20100821')
    assert_equal Time.gm(2010, 8, 21).to_i, ts
  end

  def test_timestamp_to_integer_when_nil
    assert_nil HealthDataStandards::Util::HL7Helper.timestamp_to_integer(nil)
  end

  def test_timestamp_to_integer_when_just_month_and_year
    ts = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('201008')
    assert_equal Time.gm(2010, 8).to_i, ts
  end

  def test_timestamp_to_integer_down_to_seconds
    ts = HealthDataStandards::Util::HL7Helper.timestamp_to_integer('20100821123022')
    assert_equal Time.gm(2010, 8, 21, 12, 30, 22).to_i, ts
  end
end