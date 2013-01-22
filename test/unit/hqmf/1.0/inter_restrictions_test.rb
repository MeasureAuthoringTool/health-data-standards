require_relative '../../../test_helper'

module HQMF1

  class InterRestrictionsTest  < Test::Unit::TestCase
    def setup
      path = File.expand_path("../../../../fixtures/1.0/inter_comparison_restrictions.xml", __FILE__)
      doc = Nokogiri::XML(File.open(path).read)
      doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
      @precondition = HQMF1::Precondition.new(doc.root(), nil, nil)
    end
  
    def test_metadata
      assert_equal "AND", @precondition.conjunction
      assert_equal 1, @precondition.preconditions.length
      assert_equal "OR", @precondition.preconditions[0].conjunction
      assert @precondition.preconditions[0].comparison
      assert_equal 1, @precondition.preconditions[0].comparison.restrictions.length
      assert_equal 1, @precondition.restrictions.length
      assert_equal 'SBS', @precondition.restrictions[0].type
      assert_equal 3, @precondition.restrictions[0].preconditions.length
      assert_equal 'OR', @precondition.restrictions[0].preconditions[0].conjunction
      # we no longer push down restrictions on V1 parse, we do it during conversion
      assert_equal 0, @precondition.restrictions[0].preconditions[0].restrictions.length
    end
  end

end