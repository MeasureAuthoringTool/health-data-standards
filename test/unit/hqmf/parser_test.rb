require_relative '../../test_helper'

class ParseTest < Minitest::Test
  extend Minitest::Spec::DSL

  def setup
    @hqmf_contents_v1 = File.open("test/fixtures/1.0/NQF_Retooled_Measure_0043.xml").read
    @hqmf_contents_v2 = File.open("test/fixtures/2.0/earlyRelease/NQF59New.xml").read
  end

  def test_basic_parse_v1

    parsed = HQMF::Parser::V1Parser.new.parse(@hqmf_contents_v1)
    parsed.title.must_equal "Pneumonia Vaccination Status for Older Adults (NQF 0043)"

  end

  def test_basic_parse_v2

    parsed = HQMF::Parser::V2Parser.new.parse(@hqmf_contents_v2)

    parsed.title.must_equal "Sample Quality Measure Document"
  end

  def test_parse_fields_v1
    parsed_fields = HQMF::Parser::V1Parser.new.parse_fields(@hqmf_contents_v1)

    parsed_fields['title'].must_equal "Pneumonia Vaccination Status for Older Adults (NQF 0043)"
  end

  def test_parse_fields_v2
    parsed_fields = HQMF::Parser::V2Parser.new.parse_fields(@hqmf_contents_v2)

    parsed_fields['title'].must_equal "Sample Quality Measure Document"
  end
end
