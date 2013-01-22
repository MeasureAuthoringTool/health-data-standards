require_relative '../../test_helper'

class ParseTest < Test::Unit::TestCase
  
  def setup
    @hqmf_contents_v1 = File.open("test/fixtures/1.0/NQF_Retooled_Measure_0043.xml").read
    @hqmf_contents_v2 = File.open("test/fixtures/2.0/NQF59New.xml").read
  end
  
  def test_basic_parse_v1
    
    parsed = HQMF::Parser.parse(@hqmf_contents_v1, HQMF::Parser::HQMF_VERSION_1)
    parsed.title.must_equal "Pneumonia Vaccination Status for Older Adults (NQF 0043)"
    
  end

  def test_basic_parse_v2

    parsed = HQMF::Parser.parse(@hqmf_contents_v2, HQMF::Parser::HQMF_VERSION_2)
    
    parsed.title.must_equal "Sample Quality Measure Document"
  end
  
  def test_basic_parse_bad_version
    
    exception = assert_raise RuntimeError do
      parsed = HQMF::Parser.parse(@hqmf_contents_v2, "bad version")
    end
    
    exception.message.must_equal "Unsupported HQMF version specified: bad version"
    
  end
  
end
