require_relative '../../../test_helper'

class ValueSetParserTest < Test::Unit::TestCase
  
  def setup
    @sample = [
      [ "Value Set Developer", "Value Set OID", "Value Set Name", "QDM Category", "Code System", "Code System Version", "Code", "Descriptor"],
      ["National Committee for Quality Assurance", "2.16.840.1.113883.3.464.0001.14", "birth date", "Individual characteristic", "HL7", "3.0", "00110", "Date/Time of birth (TS)"],
      ["National Committee for Quality Assurance", "2.16.840.1.113883.3.464.0001.14", "birth date", "Individual characteristic", "HL7", "3.0", "00112", "Date/Time of birth (TS)"],
      ["National Committee for Quality Assurance", "2.16.840.1.113883.3.464.0001.48", "encounter outpatient", "Encounter", "CPT", "06/2009", "99201", nil],
      ["National Committee for Quality Assurance", "2.16.840.1.113883.3.464.0001.48", "encounter outpatient", "Encounter", "CPT", "06/2009", "99202", nil], 
      ["National Committee for Quality Assurance", "2.16.840.1.113883.3.464.0001.48", "encounter outpatient", "Encounter", "CPT", "06/2009", "99209-99215", nil], 
      ["National Committee for Quality Assurance", "2.16.840.1.113883.3.464.0001.47", "encounter outpatient", "Encounter", "CPT", "06/2009", "99201", nil],
      ["National Committee for Quality Assurance", "2.16.840.1.113883.3.464.0001.49", "encounter outpatient", "Encounter", "GROUPING", "n/a", "2.16.840.1.113883.3.464.0001.48", '"encounter outpatient" CPT code list'],
      ["National Committee for Quality Assurance", "2.16.840.1.113883.3.464.0001.49", "encounter outpatient", "Encounter", "GROUPING", "n/a", "2.16.840.1.113883.3.464.0001.47", '"encounter outpatient" CPT code list']
    ]
    
  end
  
  def test_it_reads_a_file_to_array
    file = "test/fixtures/value_sets/NQF_0043.xls"
    vsp = HQMF::ValueSet::Parser.new()
    # change to second sheet in workbook
    sheet = vsp.send(:file_to_array, file, {:sheet => 1, :columns => 2})
    assert sheet.respond_to?(:each)
  end  

  def test_it_reads_an_excel_file
    file = "test/fixtures/value_sets/NQF_0043.xls"
    vsp = HQMF::ValueSet::Parser.new()
    # change to second sheet in workbook
    sheet = vsp.parse(file, {:sheet => 1, :columns => 2})
    assert sheet.respond_to?(:each)
  end  
  
  def test_it_collapses_codes
    vsi = HQMF::ValueSet::Parser.new()
    
    structure = vsi.cells_to_hashs_by_oid(@sample)
    
    structure.keys.length.must_equal 4
    
    assert structure["2.16.840.1.113883.3.464.0001.14"]
    assert structure["2.16.840.1.113883.3.464.0001.48"]
    assert structure["2.16.840.1.113883.3.464.0001.49"]

    structure["2.16.840.1.113883.3.464.0001.14"]["codes"].length.must_equal 2
    
  end
  
  def test_it_collapses_groups
    
    vsp = HQMF::ValueSet::Parser.new()
    
    structure = vsp.cells_to_hashs_by_oid(@sample)
    
    final = vsp.collapse_groups(structure)
    
    final.length.must_equal 4
    
    by_oid = {}
    final.each {|value_set| by_oid[value_set["oid"]] = value_set}
    
    birthdate = by_oid["2.16.840.1.113883.3.464.0001.14"]
    birthdate["code_set"].must_equal nil
    birthdate["codes"].must_equal nil
    birthdate["code_sets"].length.must_equal 1
    birthdate["code_sets"][0]["key"].must_equal "individual_characteristic_birth_date"

    encounter = by_oid["2.16.840.1.113883.3.464.0001.49"]
    encounter["code_set"].must_equal nil
    encounter["codes"].must_equal nil
    encounter["code_sets"].length.must_equal 2
    
    children = {}
    encounter["code_sets"].each {|child| children[child["oid"]] = child}
    
    children["2.16.840.1.113883.3.464.0001.47"]["key"].must_equal "encounter_encounter_outpatient"
    children["2.16.840.1.113883.3.464.0001.47"]["codes"].length.must_equal 1
    children["2.16.840.1.113883.3.464.0001.47"]["category"].must_equal "encounter"
    children["2.16.840.1.113883.3.464.0001.47"]["concept"].must_equal "encounter_outpatient"
    children["2.16.840.1.113883.3.464.0001.47"]["code_set"].must_equal "CPT"

    children["2.16.840.1.113883.3.464.0001.48"]["key"].must_equal "encounter_encounter_outpatient"
    children["2.16.840.1.113883.3.464.0001.48"]["codes"].length.must_equal 9
    children["2.16.840.1.113883.3.464.0001.48"]["category"].must_equal "encounter"
    children["2.16.840.1.113883.3.464.0001.48"]["concept"].must_equal "encounter_outpatient"
    children["2.16.840.1.113883.3.464.0001.48"]["code_set"].must_equal "CPT"
    
  end
  
end
