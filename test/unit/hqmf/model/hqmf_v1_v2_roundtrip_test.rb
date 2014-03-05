require 'fileutils'
require_relative '../../../test_helper'

class HQMFV1V2RoundtripTest < Test::Unit::TestCase
  RESULTS_DIR = 'tmp/hqmf_r2.1_roundtrip_diffs'

  # Create a blank folder for the errors
  FileUtils.rm_rf(RESULTS_DIR) if File.directory?(RESULTS_DIR)
  Dir.mkdir RESULTS_DIR

  # Automatically generate one test method per measure file
  measure_files = File.join('test', 'fixtures', '1.0', 'measures', '*.xml')
  counter = 0
  Dir.glob(measure_files).each do | measure_filename |
    counter += 1
    if counter % 7 == 0  
      measure_name = /.*[\/\\]((ep|eh)_.*)\.xml/.match(measure_filename)[1]
      define_method("test_#{measure_name}") do
        do_roundtrip_test(measure_filename, measure_name)
      end
    end
  end

  def do_roundtrip_test(measure_filename, measure_name)
    puts ">> #{measure_name}"
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

    # drop the CMS ID since it does not go into the HQMF v2
    if v1_json['cms_id']
      puts "\t CMS ID ignored in hqmf v2"
      v1_json['cms_id'] = nil
    end

    # v2 switches negated preconditions non-negated equivalents (atLeastOneTrue[negated] -> allFalse)
    fix_precondition_negations(v1_json['population_criteria'])

    # v2 ranges (in pauseQuantity) cannot be IVL_PQ, so change to PQ
    fix_range_types(v1_json)
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

  def fix_precondition_negations(root)
    if (HQMF::Precondition::NEGATIONS.keys.include?(root['conjunction_code']) && root['negation'])
      root['conjunction_code'] = HQMF::Precondition::NEGATIONS[root['conjunction_code']]
      root.delete('negation')
    end

    root.each_value do |value|
      if value.is_a? Hash
        fix_precondition_negations(value)
      elsif value.is_a? Array
        value.each {|entry| fix_precondition_negations(entry) if entry.is_a? Hash}
      end
    end
  end

  def fix_range_types(root)
    if (root['temporal_references'])
      root['temporal_references'].each do |tr|
        if tr['range'] && tr['range']['type'] == 'IVL_PQ'
          tr['range']['type'] = 'PQ'
        end
      end
    end

    root.each_pair do |key, value|
      if value.is_a? Hash
        fix_range_types(value)
      elsif value.is_a? Array and key != 'temporal_references'
        value.each {|entry| fix_range_types(entry) if entry.is_a? Hash}
      end
    end
  end
end
