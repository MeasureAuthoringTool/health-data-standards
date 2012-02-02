require "test_helper"
require "json"

class ResultImporterTest < MiniTest::Unit::TestCase
  def assert_not_nil arg
    assert arg.nil? == false
  end

  def make_basic_json key, time, code_val
    return {
        'codes' => {
           key => code_val
        },
        'time' => time,
        'description' => "cbc neutrophils",
        'value' => {
            'scalar' => 2500,
            'units' => "count"
        }
    }
  end

  def test_json_result_importing
    ri = HealthDataStandards::Import::Json::ResultImporter.new
    now = Time.now.to_i
    code_val = [ 19085718905 ]
    key = "SNOMED-CT"
    result = make_basic_json key, now, code_val

    entries = ri.create_entries(result.to_json)
    assert_not_nil entries
    assert_equal 1, entries.size
    entry = entries[0]
    assert entry.class == LabResult

    assert_equal now, entry.time

    codes = entry.codes
    assert_not_nil codes
    code = codes[key]
    assert_not_nil code
    assert_equal code_val, code

    assert_equal "cbc neutrophils", entry.description

    value = entry.value
    assert_not_nil value
    assert_equal 2500, value['scalar']
    assert_equal 'count', value['units']
  end

  def test_json_result_detect_bad_entry_import
    ri = HealthDataStandards::Import::Json::ResultImporter.new
    now = Time.now.to_i
    key = "XX"
    result = make_basic_json key, now, :a
    result['codes'] = nil # Remove codes, a required field

    entries = ri.create_entries(result.to_json)
    assert_nil entries

    key = "SNOMED-CT"
    code_val = [ 19085718905 ]
    result = make_basic_json key, now, code_val
    result['time'] = nil # Remove time, a required field

    entries = ri.create_entries(result.to_json)
    assert_nil entries

    key = "SNOMED-CT"
    code_val = [ 19085718905 ]
    result = make_basic_json key, now, code_val
    result['description'] = nil # Remove description, a required field

    entries = ri.create_entries(result.to_json)
    assert_nil entries
  end

  def test_json_result_bad_code
    ri = HealthDataStandards::Import::Json::ResultImporter.new
    now = Time.now.to_i
    key = "FOOX"
    code_val = [ 19085718905 ]
    result = make_basic_json key, now, code_val
    # Test bad code
    entries = ri.create_entries(result.to_json)
    assert_nil entries
  end

  def test_json_result_optional_missing_field
    ri = HealthDataStandards::Import::Json::ResultImporter.new
    now = Time.now.to_i
    key = "SNOMED-CT"
    code_val = [ 19085718905 ]
    result = make_basic_json key, now, code_val
    result['value'] = nil # Remove value, not a required field

    entries = ri.create_entries(result.to_json)
    assert_not_nil entries
  end
end