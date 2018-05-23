require 'fileutils'
require 'digest'
require_relative '../../../test_helper'

# Tests parsing of HQMF CQL
class HQMF2CQLTest < Minitest::Test
  RESULTS_DIR = File.join('tmp', 'cql')

  HQMF_CQL_ROOT = File.join('test', 'fixtures', 'hqmf', 'cql')

  # Create a blank folder for the errors
  FileUtils.rm_rf(RESULTS_DIR) if File.directory?(RESULTS_DIR)
  FileUtils.mkdir_p RESULTS_DIR
  
  # Automatically generate one test method per measure file
  measure_files = File.join(HQMF_CQL_ROOT, '*.xml')

  Dir.glob(measure_files).each do |measure_filename|
    measure_name = File.basename(measure_filename, '.xml')
    if ['2'].index(measure_name)
      define_method("test_#{measure_name}") do
        do_test(measure_filename, measure_name)
      end
    end
  end

  def do_test(measure_filename, measure_name)
    
    model = HQMF2CQL::Document.new(File.open(measure_filename).read).to_model

    diff = ''
    assert diff.empty?, 'Diff is not empty.'
  end
  def test_supplemental_data_element_parsing
    sde_measure_file = File.join(HQMF_CQL_ROOT, 'CCDELookback_v5_4_eCQM.xml')
    model = HQMF2CQL::Document.new(File.open(sde_measure_file).read).to_model

    assert model.populations[0]['supplemental_data_elements'].length == 5
  end

end
