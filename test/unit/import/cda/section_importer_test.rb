require 'test_helper'

class SectionImporterTest < MiniTest::Unit::TestCase
  def setup
    @si = HealthDataStandards::Import::CDA::SectionImporter.new(HealthDataStandards::Import::CDA::EntryFinder.new('/cda:simple/cda:entry'))
    @si.status_xpath = './cda:status'
    @doc = Nokogiri::XML(File.new('test/fixtures/section_importer.xml'))
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
  end

  def test_create_entries_with_date
    entries = @si.create_entries(@doc)
    entry = entries[1]
    assert_equal 1026777600, entry.time
    assert entry.codes['SNOMED-CT'].include?('314443004')
  end

  def test_create_entries_with_date_values
    entries = @si.create_entries(@doc)
    entry = entries[2]
    assert_equal 1026777600, entry.time
    assert entry.codes['SNOMED-CT'].include?('314443004')
    assert_equal 'eleventeen', entry.values.first.scalar
    assert_equal 'active', entry.status
  end

  def test_create_entries_with_date_ranges
    entries = @si.create_entries(@doc)
    entry = entries[0]
    assert_equal 1026777600, entry.start_time
    assert_equal 1189814400, entry.end_time
    assert entry.is_date_range?
  end

  def test_extracting_translations
    entries = @si.create_entries(@doc)
    entry = entries[1]
    assert_equal 1026777600, entry.time
    assert entry.codes['SNOMED-CT'].include?('12345')
  end

  def test_dealing_with_center_times
    entries = @si.create_entries(@doc)
    entry = entries[3]
    assert_equal 1026777600, entry.time
  end

  def test_extracting_identifiers
    entries = @si.create_entries(@doc)
    entry = entries[0]
    assert_equal "1.2.3.4", entry.cda_identifier.root
    assert_equal "abcdef", entry.cda_identifier.extension
  end
end