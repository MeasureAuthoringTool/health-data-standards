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
  
  def test_is_usable
    entry = Entry.new
    entry.time = 1270598400
    entry.add_code("314443004", "SNOMED-CT")
    assert entry.usable?
  end
  
  def test_from_event_hash
    hash = {'code' => 123, 'code_set' => "RxNorm", 'value' => 50, 'unit' => "mm", 
            'description' => "Test", 'specifics' => "Specific", 'status' => "active"}
            
    entry = Entry.from_event_hash(hash)
    
    assert_equal [hash['code']], entry.codes[hash['code_set']]
    assert_equal hash['value'], entry.values.first.scalar
    assert_equal hash['unit'], entry.values.first.units
    assert_equal hash['specifics'], entry.specifics
    assert_equal hash['status'], entry.status
  end

  def test_unusable_without_time
    entry = Entry.new
    entry.add_code("314443004", "SNOMED-CT")
    assert ! entry.usable?
  end

  def test_unusable_without_code
    entry = Entry.new
    entry.time = 1270598400
    assert ! entry.usable?
  end

  def test_is_in_code_set
    entry = Entry.new
    entry.add_code("854935", "RxNorm")
    entry.add_code("44556699", "RxNorm")
    entry.add_code("1245", "Junk")
    assert entry.is_in_code_set?([{'set' => 'RxNorm', 'values' => ['854935', '5440']},
                                  {'set' => 'SNOMED-CT', 'values' => ['24601']}])
  end

  def test_is_not_in_code_set
    entry = Entry.new
    entry.add_code("44556699", "RxNorm")
    entry.add_code("1245", "Junk")
    assert ! entry.is_in_code_set?([{'set' => 'RxNorm', 'values' => ['854935', '5440']},
                                    {'set' => 'SNOMED-CT', 'values' => ['24601']}])
  end
  
  def test_equality
    entry1 = Entry.new
    entry1.add_code("44556699", "RxNorm")
    entry1.time = 1270598400
    entry2 = Entry.new
    entry2.add_code("44556699", "RxNorm")
    entry2.time = 1270598400
    entry3 = Entry.new
    entry3.add_code("44556699", "RxNorm")
    entry3.time = 1270598401
    assert entry1 == entry2
    assert entry2 == entry1
    assert entry2 != entry3
    assert entry1 != entry3
  end
  
  def test_to_hash
    entry = Entry.new
    entry.add_code("44556699", "RxNorm")
    entry.time = 1270598400
    entry.specifics = "specific"
    
    h = entry.to_hash
    assert_equal 1270598400, h['time']
    assert h['codes']['RxNorm'].include?('44556699')
  end
end