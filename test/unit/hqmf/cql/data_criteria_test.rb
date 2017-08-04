require_relative '../../../test_helper'

class DataCriteriaTest <  Minitest::Test
  HQMF_CQL_ROOT = File.join('test', 'fixtures', 'hqmf', 'cql')

  def test_title_and_description
    # Test MAT 5.2 export
    mat_5_2_filename = File.join(HQMF_CQL_ROOT, 'EHDI1a_v5_2_eMeasure.xml')
    document = HQMF2CQL::Document.new(File.open(mat_5_2_filename).read)
    data_criteria = document.all_data_criteria[0]

    title1 = data_criteria.title
    data_criteria.retrieve_title_and_description_for_model
    title2 = data_criteria.title
    description = data_criteria.description

    expected_title1 = "Encounter Inpatient SNOMEDCT Value Set"
    expected_title2 = "Encounter Inpatient"
    expected_description = "Encounter, Performed: Encounter Inpatient"

    assert title1 == expected_title1, string_match_error(title1, expected_title1)
    assert title2 == expected_title2, string_match_error(title2, expected_title2)
    assert description == expected_description, string_match_error(description, expected_description)

    # Test MAT 5.3 export
    mat_5_3_filename = File.join(HQMF_CQL_ROOT, 'EHDI1a_v5_3_eMeasure.xml')
    document = HQMF2CQL::Document.new(File.open(mat_5_3_filename).read)
    data_criteria = document.all_data_criteria[0]

    title1 = data_criteria.title
    data_criteria.retrieve_title_and_description_for_model
    title2 = data_criteria.title
    description = data_criteria.description

    expected_title1 = "EncounterInpatient"
    expected_title2 = "EncounterInpatient"
    expected_description = "Encounter, Performed: EncounterInpatient"

    assert title1 == expected_title1, string_match_error(title1, expected_title1)
    assert title2 == expected_title2, string_match_error(title2, expected_title2)
    assert description == expected_description, string_match_error(description, expected_description)
  end

  def string_match_error(str1, str2)
    "actual value '" + str1 + "' does not equal expected value '" + str2 + "'"
  end
end
