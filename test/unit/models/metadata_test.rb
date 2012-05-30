require "test_helper"

class MetaDataTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @record = FactoryGirl.create(:record)
    # @md = FactoryGirl.create("metadata")

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    Record.delete_all
  end

  # Fake test
  def test_import
    @mi = HealthDataStandards::Import::Hdata::MetadataImporter.instance
    @doc = Nokogiri::XML(File.new('test/fixtures/hdata_fragments/metadata.xml'))
    @doc.root.add_namespace_definition('hrf-md', 'http://www.hl7.org/schemas/hdata/2009/11/metadata')

    meta = @mi.import(@doc) 
    refute_nil meta
    assert meta.mime_types.include?("application/json")
    assert meta.mime_types.include?("application/xml")
    assert_equal "confidential", meta.confidentiality
    refute_nil meta.original_creation_time
    assert meta.original_creation_time.is_a?(Time)
    pedigree = meta.pedigrees.first
    refute_nil pedigree
    refute_nil pedigree.author
    assert_equal "Dr. John Zoidberg", pedigree.author.name
    assert_equal "Planet Express", pedigree.organization
    refute_nil pedigree.source_pedigrees.first
    refute_nil pedigree.source_documents.first
    linked_doc = meta.linked_documents.first
    refute_nil linked_doc
    assert_equal "http://example.org/1235", linked_doc.uri
    assert_equal "http://example.org/schema/something", linked_doc.extension
    m_date = meta.modified_dates.first
    refute_nil m_date
    refute_nil m_date.timestamp
    assert m_date.timestamp.is_a?(Time)
    refute_nil m_date.pedigree
    
    refute_nil meta.copied_dates.first
  end
end