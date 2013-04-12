require 'test_helper'

class Cat3Test < MiniTest::Unit::TestCase
  def setup
    collection_fixtures('query_cache')

    @start_date = Time.now.years_ago(1)
    @end_date = Time.now

    measure = {'hqmf_id' => "8A4D92B2-397A-48D2-0139-C648B33D5582", 'hqmf_set_id' => "AAAAAAAA-397A-48D2-0139-C648B33D5582"}
    @qrda_xml = HealthDataStandards::Export::Cat3.new.export([measure], 1356998340, @start_date, @end_date)
    @doc = Nokogiri::XML(@qrda_xml)
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
  end

  def test_top_level_count
    ipp_count = @doc.at_xpath("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.5' and cda:value/@code='IPP']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.3']/cda:value")['value']
    assert_equal 3, ipp_count.to_i
  end

  def test_strat_count
    ipp_count = @doc.at_xpath("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.5' and cda:value/@code='IPP']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.4']/cda:entryRelationship/cda:observation/cda:value")['value']
    assert_equal 2, ipp_count.to_i
  end
end