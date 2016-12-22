require 'test_helper'

class Cat3Test < Minitest::Test
  def setup
    collection_fixtures('query_cache')

    @start_date = Time.now.years_ago(1)
    @end_date = Time.now
    @header = generate_header
    @measure_id = "8A4D92B2-397A-48D2-0139-C648B33D5582"
    measure = {'hqmf_id' => @measure_id, 'hqmf_set_id' => "AAAAAAAA-397A-48D2-0139-C648B33D5582"}
    cat3_exporter = HealthDataStandards::Export::Cat3.new('r1')
    @qrda_xml = cat3_exporter.export([measure],@header, 1356998340, @start_date, @end_date)
    @doc = Nokogiri::XML(@qrda_xml)
    @doc.root.add_namespace_definition('cda', 'urn:hl7-org:v3')
  end

  def test_top_level_count
    ipp_count = @doc.at_xpath("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.5' and cda:value/@code='IPP']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.3']/cda:value")['value']
    assert_equal 3, ipp_count.to_i
  end

  def test_measures
    measure = @doc.at_xpath("//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.1']/cda:reference/cda:externalDocument/cda:id[@root='2.16.840.1.113883.4.738']/@extension")
    refute_nil measure
    assert_equal @measure_id, measure.value
  end

  def test_strat_count
    ipp_count = @doc.at_xpath("//cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.5' and cda:value/@code='IPP']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.27.3.4']/cda:entryRelationship/cda:observation/cda:value")['value']
    assert_equal 2, ipp_count.to_i
  end

  def test_schema_validation
    xsd = Nokogiri::XML::Schema(open("./resources/schema/infrastructure/cda/CDA_SDTC.xsd"))
    assert_equal [], xsd.validate(@doc), "Invalid Cat III document"
  end

  def generate_header
    header_hash=  {identifier: {root: "2.16.840.1.113883.4.6", extension: "header_ext"},
                   authors: [{ids: [ {root: "2.16.840.1.113883.4.7" , extension: "author_extension"}],
                              device: {name:"dvice_name" , model: "device_mod"},
                              addresses:[],
                              telecoms: [],
                              time: Time.now,
                              organization: {ids: [ {root: "2.16.840.1.113883.4.9" , extension: "authors_organization_ext"}],
                                             name: ""}}],
                   custodian: {ids: [ {root: "custodian_root" , extension: "custodian_ext"}],
                               person: {given: "", family: ""},
                               organization: {ids: [ {root: "2.16.840.1.113883.4.12" , extension: "custodian_organization_ext"}],
                                              name: ""}},
                   legal_authenticator:{ids: [ {root: "2.16.840.1.113883.4.14" , extension: "legal_authenticator_ext"}],
                                        addresses: [],
                                        telecoms:[],
                                        time: Time.now,
                                        person: {given:"hey", family: "there"},
                                        organization:{ids: [ {root: "2.16.840.1.113883.4.62" , extension: "legal_authenticator_org_ext"}],
                                                      name: ""}
                   }
    }

    Qrda::Header.new(header_hash)
  end
end
