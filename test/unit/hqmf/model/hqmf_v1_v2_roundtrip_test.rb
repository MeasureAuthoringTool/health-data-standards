require 'fileutils'
require_relative '../../../test_helper'

class HQMFV1V2RoundtripTest < Minitest::Test
  RESULTS_DIR = 'tmp/hqmf_r2.1_roundtrip_diffs'

  # Create a blank folder for the errors
  FileUtils.rm_rf(RESULTS_DIR) if File.directory?(RESULTS_DIR)
  Dir.mkdir RESULTS_DIR

  # Automatically generate one test method per measure file
  measure_files = File.join('test', 'fixtures', '1.0', 'measures', '*.xml')
  counter = 0
  Dir.glob(measure_files).each do | measure_filename |
    next if measure_filename.ends_with? 'ep_0405.xml' # skipped due to id mismatches, test a different one
    next if measure_filename.ends_with? 'eh_0528.xml' # slow test
    next if measure_filename.ends_with? 'eh_0147.xml' # slow test
    next if measure_filename.ends_with? 'eh_0527.xml' # slow test
    next if measure_filename.ends_with? 'ep_0038.xml' # slow test
    next if measure_filename.ends_with? 'eh_0373.xml' # slow test
    counter += 1
    if counter % 10 == 0
      measure_name = /.*[\/\\]((ep|eh)_.*)\.xml/.match(measure_filename)[1]
      define_method("test_#{measure_name}") do
        do_roundtrip_test(measure_filename, measure_name)
      end
    end
  end

  def do_roundtrip_test(measure_filename, measure_name)

    skip('Skipping all HQMF round trip tests until HQMFR2.1 refactoring')

    # open the v1 file and generate a v2.1 xml string

    v1_model = HQMF::Parser::V1Parser.new.parse(File.open(measure_filename).read)
    skip('ep_0405 reverses populations during roundtrip, but is still corrrect') if measure_name == "ep_0405"
    #skip('Continuous Variable measures currently not supported') if v1_model.population_criteria('MSRPOPL')

    hqmf_xml = HQMF2::Generator::ModelProcessor.to_hqmf(v1_model)

    begin
      v2_model = HQMF::Parser::V2Parser.new.parse(hqmf_xml)

      v1_json = JSON.parse(v1_model.to_json.to_json,max_nesting: 100)
      v2_json = JSON.parse(v2_model.to_json.to_json,max_nesting: 100)

      update_v1_json(v1_json)
      update_v2_json(v2_json)

      diff = v1_json.diff_hash(v2_json, true, true)

      unless diff.empty?
        outfile = File.join("#{RESULTS_DIR}","#{measure_name}_diff.json")
        File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(JSON.parse(diff.to_json))) }
        outfile = File.join("#{RESULTS_DIR}","#{measure_name}_r1.json")
        File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(v1_json)) }
        outfile = File.join("#{RESULTS_DIR}","#{measure_name}_r2.json")
        File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(v2_json)) }
        outfile = File.join("#{RESULTS_DIR}","#{measure_name}_r2.xml")
        File.open(outfile, 'w') {|f| f.write(hqmf_xml) }
      end

      assert diff.empty?, 'Differences in model after roundtrip to HQMF V2'
    rescue
      outfile = File.join("#{RESULTS_DIR}","#{measure_name}_r2.xml")
      File.open(outfile, 'w') {|f| f.write(hqmf_xml) }
      raise $!
    end
  end

  def regex_clean!(s)
        s.gsub!(/\n|\t|\r/, ' ')
        s.gsub!(/ +/, ' ')
  end

  def update_v1_json(v1_json)
    # remove measure period width
    #v1_json['measure_period']['width'] = nil
    v1_json['measure_period']['width']['inclusive?'] = false

    # remove embedded whitespace formatting in values
    if v1_json['description']
      regex_clean!(v1_json['description'])
    end
    v1_json['attributes'].each do |attr|
      if attr['value']
        regex_clean!(attr['value'])
      end
      if attr['value_obj'] && attr['value_obj']['value']
        regex_clean!(attr['value_obj']['value'])
      end
    end
  end

  def update_v2_json(v2_json)
    # remove embedded whitespace formatting in values
    if v2_json['description']
      regex_clean!(v2_json['description'])
    end
    v2_json['attributes'].each do |attr|
      if attr['value']
        regex_clean!(attr['value'])
      end
      if attr['value_obj'] && attr['value_obj']['value']
        regex_clean!(attr['value_obj']['value'])
      end
    end
  end
end
