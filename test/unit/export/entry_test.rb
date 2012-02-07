require 'test_helper'
require 'pry'

module Export
  class EntryTest < MiniTest::Unit::TestCase

    def setup
      collection_fixtures('records', '_id')
      @record = Record.first
    end

    def test_results
      result = @record.results.first
      result.reference_range = "< 500ml"
      
      xml = HealthDataStandards::Export::GreenCda::Entry.export(result, :result)
      
      doc = Nokogiri::XML(xml)
      doc.root.add_namespace_definition('green', "urn:hl7-org:greencda:c32")
      
      ri = HealthDataStandards::Import::GreenCda::ResultImporter.instance
      
      # binding.pry
      
      result2 = ri.import(doc.xpath("/green:result"))
      
      assert_equal result.value, result2.value
      assert_equal result.description, result2.description
      assert_equal result.codes, result2.codes
      assert_equal result.status, result2.status
      assert_equal result.interpretation, result2.interpretation
      assert_equal result.reference_range, result2.reference_range
    end

  end
end

