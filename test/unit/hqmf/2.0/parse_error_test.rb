require_relative '../../../test_helper'

module HQMF2

  class ParseErrorTest < Test::Unit::TestCase

    def test_unknown_demographic
      hqmf_contents = File.open("test/fixtures/2.0/invalid/unknown_demographic_entry.xml").read
      doc = Nokogiri::XML(hqmf_contents)
      doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      doc.root.add_namespace_definition('xsi', 'http://www.w3.org/2001/XMLSchema-instance')
      exception = assert_raise RuntimeError do
        criteria = HQMF2::DataCriteria.new(doc.root)
      end
      assert_equal 'Unknown demographic identifier [1234567]', exception.message
    end  

    def test_unknown_criteria_type
      hqmf_contents = File.open("test/fixtures/2.0/invalid/unknown_criteria_type.xml").read
      doc = Nokogiri::XML(hqmf_contents)
      doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      doc.root.add_namespace_definition('xsi', 'http://www.w3.org/2001/XMLSchema-instance')
      exception = assert_raise RuntimeError do
        criteria = HQMF2::DataCriteria.new(doc.root)
      end
      assert_equal 'Unknown data criteria template identifier [Foo]', exception.message
    end  

    def test_unknown_value_type
      hqmf_contents = File.open("test/fixtures/2.0/invalid/unknown_value_type.xml").read
      doc = Nokogiri::XML(hqmf_contents)
      doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      doc.root.add_namespace_definition('xsi', 'http://www.w3.org/2001/XMLSchema-instance')
      exception = assert_raise RuntimeError do
        criteria = HQMF2::DataCriteria.new(doc.root)
      end
      assert_equal 'Unknown value type [Foo]', exception.message
    end  

    def test_population_type
      hqmf_contents = File.open("test/fixtures/2.0/invalid/unknown_population_type.xml").read
      doc = Nokogiri::XML(hqmf_contents)
      doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      doc.root.add_namespace_definition('xsi', 'http://www.w3.org/2001/XMLSchema-instance')
      exception = assert_raise RuntimeError do
        criteria = HQMF2::PopulationCriteria.new(doc.root, nil)
        conjunction = criteria.conjunction_code
      end
      assert_equal 'Unknown population type [Foo]', exception.message
    end  
  end
end
  
