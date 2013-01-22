require_relative '../../../test_helper'
module HQMF1
  
  # 0022 has both value and range count expressions, so it is used to test those expressions

  class NQF0022Test  < Test::Unit::TestCase
    def setup
      path = File.expand_path("../../../../fixtures/1.0/0022/0022.xml", __FILE__)
      @hqmf_contents = File.open(path).read
    end
  
    # def test_patient_criteria_backfill
    #   hqmf = HQMF::Parser.parse(@hqmf_contents, HQMF::Parser::HQMF_VERSION_1)
    #   
    # end
      

    
  end
end
