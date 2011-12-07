require 'test_helper'

class EntryTest < MiniTest::Unit::TestCase
  def setup
    @entry = Entry.new
    @entry.codes = {'SNOMED-CT' => ['1234', '5678', 'AABB'],
                    'LOINC' => ['CCDD', 'EEFF'],
                    'ICD-9-CM' => ['GGHH']}
  end
  
  def test_preferred_code
    preferred_code = @entry.preferred_code(['ICD-9-CM'])
    assert_equal 'ICD-9-CM', preferred_code['code_set']
    assert_equal 'GGHH', preferred_code['code']
    
    preferred_code = @entry.preferred_code(['LOINC'])
    assert_equal 'LOINC', preferred_code['code_set']
    assert ['CCDD', 'EEFF'].include? preferred_code['code']
  end
  
  def test_translation_codes
    translation_codes = @entry.translation_codes(['ICD-9-CM'])
    assert_equal 5, translation_codes.size
    assert translation_codes.include?({'code_set' => 'LOINC', 'code' => 'CCDD'})
    assert ! translation_codes.include?({'code_set' => 'ICD-9-CM', 'code' => 'GGHH'})
  end
end