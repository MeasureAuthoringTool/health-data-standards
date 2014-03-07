require 'fileutils'
require_relative '../../../test_helper'

class HQMFV1V2GenerationTest < Test::Unit::TestCase
  RESULTS_DIR = 'test/fixtures/1.0/measures/hqmf_r2.1_results'
  SUMMARY_FILE = "#{RESULTS_DIR}/summary.txt"
  XSD = Nokogiri::XML.Schema(File.open('test/fixtures/2.1/schemas/EMeasure.xsd'))

  @@num_finished_tests = 0
  @@result_map = {}
  @@error_type_map = Hash.new(0)

  # Create a blank folder for the errors
  FileUtils.rm_rf(RESULTS_DIR) if File.directory?(RESULTS_DIR)
  Dir.mkdir RESULTS_DIR

  # Automatically generate one test method per measure file
  @@num_total_tests = 0
  measure_files = File.join('test', 'fixtures', '1.0', 'measures', 'e{p,h}_*.xml')
  Dir.glob(measure_files).each do | measure_filename |
    measure_name = /.*[\/\\]((ep|eh)_.*)\.xml/.match(measure_filename)[1]
    define_method("test_#{measure_name}") do
      do_validation_test(measure_filename, measure_name)
    end
    @@num_total_tests += 1
  end

  def teardown
    # write the summary file if we're finished the last test
    if @@result_map.length == @@num_total_tests
      num_failed_tests = @@result_map.select { |k, v| v != 0 }.length
      num_total_errors = @@result_map.values.inject(0) { |sum, n | n > 0 ? sum + n : sum }
      File.open(SUMMARY_FILE, 'w') do | file |
        file.write(sprintf("Total Measures: %6d\n", @@num_total_tests))
        file.write(sprintf("Total Failed:   %6d\n", num_failed_tests))
        file.write(sprintf("Total Errors:   %6d\n\n", num_total_errors))
        file.write "Measure Name                  Number of Errors\n"
        file.write "----------------------------------------------\n"
        @@result_map.each_pair do | measure_name, num_errors |
          file.write(sprintf("%-28s  %16s\n", measure_name, num_errors >= 0 ? num_errors.to_s : 'error'))
        end
        file.write "\n\n"
        file.write "Count    Error Message\n"
        file.write "--------------------------------------------------------------------------------\n"
        @@error_type_map.sort_by {|k,v| v}.reverse.each do |err, count|
          file.write(sprintf("%-8d %s\n", count, err))
        end
      end
    end
  end

  def do_validation_test(measure_filename, measure_name)
    # open the v1 file and generate a v2.1 xml string
    v1_model = HQMF::Parser.parse(File.open(measure_filename).read, '1.0')
    hqmf_xml = HQMF2::Generator::ModelProcessor.to_hqmf(v1_model)

    # save the 2.1 xml to a file for further analysis
    File.open("#{RESULTS_DIR}/#{measure_name}.xml", 'w') { |file | file.write(hqmf_xml) }

    # validate the 2.1 xml against the 2.1 schema
    errors = XSD.validate(Nokogiri.XML(hqmf_xml))

    # if there are errors, save them to a file for further analysis
    if (errors.present?)
      File.open("#{RESULTS_DIR}/#{measure_name}.err", 'w') do | file |
        file.write "#{measure_name}: #{errors.length} errors\n\n"
        errors.each do |error|
          @@error_type_map[error.message] += 1
          file.write(sprintf("%-8d  %s\n", error.line, error.message))
        end
      end
    end
    
    # finally do the actual assertion so we fail if there are errors
    errors.length.must_equal 0

  ensure
    # save the number of errors to the map for reporting in the summary
    @@result_map[measure_name] = errors ? errors.length : -1
  end  
end