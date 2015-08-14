require_relative '../../test_helper'

class ParseTest < Minitest::Test
  extend Minitest::Spec::DSL

  def setup
    @hqmf_contents_v1 = File.open("test/fixtures/1.0/NQF_Retooled_Measure_0043.xml").read
    @hqmf_contents_v2 = File.open("test/fixtures/2.1/CMS_30_HQMF_R2_Updated.xml").read
  end

  def test_basic_parse_v1

    parsed = HQMF::Parser::V1Parser.new.parse(@hqmf_contents_v1)
    parsed.title.must_equal "Pneumonia Vaccination Status for Older Adults (NQF 0043)"

  end

  def test_basic_parse_v2

    parsed = HQMF::Parser::V2Parser.new.parse(@hqmf_contents_v2)

    parsed.title.must_equal "Statin Prescribed at Discharge"
  end

end
