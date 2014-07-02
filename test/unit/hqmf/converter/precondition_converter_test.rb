require_relative '../../../test_helper'
module HQMF

  class PreconditionConverterTest  < Minitest::Test
    def setup
    end
  
    def test_convert_logical_conjunction

    expected={
      'AND'=>'allTrue',
      'OR'=>'atLeastOneTrue'
    }
    
    ['AND','OR'].each do |id|
      HQMF::PreconditionConverter.convert_logical_conjunction(id).must_equal expected[id]
    end
    
    assert_raises(RuntimeError) {
      HQMF::PreconditionConverter.convert_logical_conjunction('blah')
    }
      
    end
  end
end
