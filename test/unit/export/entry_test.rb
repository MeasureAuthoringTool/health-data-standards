require 'test_helper'
require 'pry'

module GreenC32
  class EntryTest < MiniTest::Unit::TestCase

    def setup
      collection_fixtures('records', '_id')
      @record = Record.first
    end

    def test_results
      result = @record.results.first
      result.reference_range = "< 500ml"

      xml = HealthDataStandards::Export::GreenC32::Entry.export(result, :result)
      
      doc = Nokogiri::XML(xml)
      
      ri = HealthDataStandards::Import::GreenC32::ResultImporter.instance
      
      result2 = ri.import(doc)
      
      assert_equal result.value, result2.value
      assert_equal result.description, result2.description
      assert_equal result.codes, result2.codes
      assert_equal result.time, result2.time
      assert_equal result.status, result2.status
      assert_equal result.reference_range, result2.reference_range
    end

  end
  
  def test_conditions
    condition = @record.conditions.first
    refute_nil condition
    
    xml = HealthDataStandards::Exporter::GreenC32::Entry.export(condition, :condition)
    
    doc = Nokogiri::XML(xml)
    doc.root.add_namespace_definition('gc32', "urn:hl7-org:greencda:c32")
    
    ci = HealthDataStandards::Import::GreenC32::ConditionImporter.instance
    
    condition2 = ci.import("/gc32:condition")
    
    assert_equal condition.name, condition2.name
    assert_equal condition.cause_of_death, condition2.cause_of_death
    assert_equal condition.start_time, condition2.start_time
    assert_equal condition.end_time, condition2.end_time
    assert_equal condition.codes, condition2.codes
    assert_equal condition.type, condition2.type
    
  end
end

