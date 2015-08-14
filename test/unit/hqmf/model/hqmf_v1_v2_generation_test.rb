require 'fileutils'
require_relative '../../../test_helper'

class HQMFV1V2GenerationTest < Minitest::Test
  RESULTS_DIR = 'tmp/hqmf_r2.1_results'
  SUMMARY_FILE = "#{RESULTS_DIR}/summary.txt"
  XSD = Nokogiri::XML.Schema(File.open('test/fixtures/2.1/schemas/EMeasure.xsd'))

  # Create a blank folder for the errors
  FileUtils.rm_rf(RESULTS_DIR) if File.directory?(RESULTS_DIR)
  FileUtils.mkdir_p RESULTS_DIR

  # Automatically generate one test method per measure file
  counter = 0
  measure_files = File.join('test', 'fixtures', '1.0', 'measures', 'e{p,h}_*.xml')
  Dir.glob(measure_files).each do | measure_filename |
    next if measure_filename.ends_with? 'eh_0528.xml' # slow test
    next if measure_filename.ends_with? 'eh_0147.xml' # slow test
    next if measure_filename.ends_with? 'eh_0527.xml' # slow test
    next if measure_filename.ends_with? 'ep_0038.xml' # slow test
    next if measure_filename.ends_with? 'eh_0373.xml' # slow test
    counter += 1
    if (counter % 10 == 0) || (measure_filename.ends_with? 'eh_0495.xml') # at least one CV
      measure_name = /.*[\/\\]((ep|eh)_.*)\.xml/.match(measure_filename)[1]
      define_method("test_#{measure_name}") do
        do_validation_test(measure_filename, measure_name)
      end
    end
  end

  def teardown
  end

  def do_validation_test(measure_filename, measure_name)
    # open the v1 file and generate a v2.1 xml string
    v1_model = HQMF::Parser::V1Parser.new.parse(File.open(measure_filename).read)

    hqmf_xml = HQMF2::Generator::ModelProcessor.to_hqmf(v1_model)

    # save the 2.1 xml to a file for further analysis
    File.open("#{RESULTS_DIR}/#{measure_name}.xml", 'w') { |file | file.write(hqmf_xml) }

    # validate the 2.1 xml against the 2.1 schema
    errors = XSD.validate(Nokogiri::XML(hqmf_xml.to_s) { |conf| conf.strict.nonet.noblanks })

    # if there are errors, save them to a file for further analysis
    if (errors.present?)
      File.open("#{RESULTS_DIR}/#{measure_name}.err", 'w') do | file |
        file.write "#{measure_name}: #{errors.length} errors\n\n"
        errors.each do |error|
          file.write(sprintf("%-8d  %s\n", error.line, error.message))
        end
      end
    end

    # finally do the actual assertion so we fail if there are errors
    errors.length.must_equal 0
  end
end
