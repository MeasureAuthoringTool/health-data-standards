require_relative '../../../test_helper'

class DataCriteriaTest <  Minitest::Test
  HQMF_CQL_ROOT = File.join('test', 'fixtures', 'hqmf', 'cql')
  
  def test_mat_5_2_export_title_and_description
    filename = File.join(HQMF_CQL_ROOT, 'EHDI1a_v5_2_eMeasure.xml')
    expected_values = {:title1 => 'Encounter Inpatient SNOMEDCT Value Set',
                       :title2 => 'Encounter Inpatient',
                       :description => 'Encounter, Performed: Encounter Inpatient'}
    _test_title_and_description(filename, expected_values)
  end
  
  def test_mat_5_3_export_title_and_description
    filename = File.join(HQMF_CQL_ROOT, 'EHDI1a_v5_3_eMeasure.xml')
    expected_values = {:title1 => 'EncounterInpatient',
                       :title2 => 'EncounterInpatient',
                       :description => 'Encounter, Performed: EncounterInpatient'}
    _test_title_and_description(filename, expected_values)
  end

  def _test_title_and_description(filename, expected_values)
    document = HQMF2CQL::Document.new(File.open(filename).read)
    data_criteria = document.all_data_criteria[0]

    title1 = data_criteria.title
    data_criteria.retrieve_title_and_description_for_model
    title2 = data_criteria.title
    description = data_criteria.description
    
    assert_equal(expected_values[:title1], title1)
    assert_equal(expected_values[:title2], title2)
    assert_equal(expected_values[:description], description)
  end
  
end
