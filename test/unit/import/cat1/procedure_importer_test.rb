require 'test_helper'

class ProcedureImporterTest < Minitest::Test
  def setup
    collection_fixtures('providers', '_id')
    @si = HealthDataStandards::Import::Cat1::ProcedureImporter.new(HealthDataStandards::Import::CDA::EntryFinder.new('/cda:simple/cda:entry'))
    @doc = Nokogiri::XML(File.new('test/fixtures/section_importer.xml'))
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
  end

  def test_extracting_scalars
    entries = @si.create_entries(@doc)
    entry = entries[3]
    pq_value = PhysicalQuantityResultValue.new(scalar: "eleventeen", units: nil)
    assert_equal pq_value.scalar, entry.values[0].scalar
    assert_equal pq_value.units, entry.values[0].units
  end

  def test_extracting_values
    entries = @si.create_entries(@doc)
    entry = entries[2]
    pq_value = PhysicalQuantityResultValue.new(scalar: "eleventeen", units: nil)
    assert_equal pq_value.scalar, entry.values[0].scalar
    assert_equal pq_value.units, entry.values[0].units
  end
end
