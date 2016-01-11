require 'fileutils'
require 'digest'
require 'simplexml_parser'
require_relative '../../../test_helper'

# Compares the model generated for HQMF 2.1 to the SimpleXML generated model
class HQMFVsSimpleTest < Minitest::Test
  RESULTS_DIR = File.join('tmp', 'hqmf_simple_diffs')

  HQMF_ROOT = File.join(ENV['HQMF_ROOT']) if ENV['HQMF_ROOT']
  HQMF_ROOT ||= File.join('test', 'fixtures', 'hqmf', 'hqmf')

  SIMPLE_XML_ROOT = File.join(ENV['SIMPLE_XML_ROOT']) if ENV['SIMPLE_XML_ROOT']
  SIMPLE_XML_ROOT ||= File.join('test', 'fixtures', 'hqmf', 'simplexml')

  # Create a blank folder for the errors
  FileUtils.rm_rf(RESULTS_DIR) if File.directory?(RESULTS_DIR)
  FileUtils.mkdir_p RESULTS_DIR
  # Automatically generate one test method per measure file
  measure_files = File.join(HQMF_ROOT, '*.xml')

  Dir.glob(measure_files).each do |measure_filename|
    measure_name = File.basename(measure_filename, '.xml')
    #if ["CMS50v4"].index(measure_name) # left in to handle subset testing
      define_method("test_#{measure_name}") do
        do_roundtrip_test(measure_filename, measure_name)
      end
    #end
  end

  def do_roundtrip_test(measure_filename, measure_name)
    hqmf_model, hqmf_json_orig, simple_xml_model, simple_xml_json_orig = generate_models_and_json(measure_filename, measure_name)
    # ignore the attributes... these are not that important
    hqmf_model.instance_variable_set(:@attributes, [])
    simple_xml_model.instance_variable_set(:@attributes, [])

    # remap values in simple_xml and hqmf_model to resolve ignorable differences
    remap_arbitrary_v2_diffs(simple_xml_model, hqmf_model, measure_name)

    # certain measures carry over currently unused by products
    individual_measure_corrections(simple_xml_model, hqmf_model, measure_name)

    remap_ids(hqmf_model)
    remap_ids(simple_xml_model)

    # empty out the measure period, since they are unlikely be equal
    # simple_xml_model.instance_variable_set(:@measure_period, nil)
    # hqmf_model.instance_variable_set(:@measure_period, nil)

    # COMPARE

    hqmf_json = JSON.parse(hqmf_model.to_json.to_json, max_nesting: 100)
    simple_xml_json = JSON.parse(simple_xml_model.to_json.to_json, max_nesting: 100)
    diff = generate_diff_and_save_to_file(measure_name, hqmf_json, simple_xml_json)
    print_to_file(measure_name, hqmf_model, simple_xml_model, hqmf_json_orig, simple_xml_json_orig)
    assert diff.empty?, 'Differences in model between HQMF and SimpleXml... we need a better comparison mechanism'
  end

  # Initial setup of models and json
  def generate_models_and_json(measure_filename, measure_name)
    puts ">> #{measure_name}"
    # parse the model from the V1 XML
    hqmf_model = HQMF::Parser::V2Parser.new.parse(File.open(measure_filename).read)
    # rebuild hqmf model so that source data criteria are different objects
    hqmf_model = HQMF::Document.from_json(JSON.parse(hqmf_model.to_json.to_json, max_nesting: 100))

    simple_xml = File.join(SIMPLE_XML_ROOT, "#{measure_name}_SimpleXML.xml")
    simple_xml_model = SimpleXml::Parser::V1Parser.new.parse(File.read(simple_xml))

    hqmf_json_orig = JSON.parse(hqmf_model.to_json.to_json, max_nesting: 100)
    simple_xml_json_orig = JSON.parse(simple_xml_model.to_json.to_json, max_nesting: 100)
    [hqmf_model, hqmf_json_orig, simple_xml_model, simple_xml_json_orig]
  end

  # Handle differences between the HQMF 2 parser and SimpleXML that are characteristic of the 2.1 switch
  def remap_arbitrary_v2_diffs(simple_xml_model, hqmf_model, measure_name)
    # FIXME: (10/19/2015) removes the source data criteria for patient expired from simplexml, which at this time
    #  does not exist in the HQMF2.1 version or in the human readable version for most measures
    unless %w(CMS159v4 CMS160v4 CMS172v5 CMS178v5).index(measure_name)
      simple_xml_model.instance_variable_get(:@source_data_criteria).reject! { |sdc| sdc.definition == 'patient_characteristic_expired' }
    end

    remap_arbitrary_dc_v2_diff(simple_xml_model)
    remap_arbitrary_dc_v2_diff(hqmf_model)
    # Remove comments from both sets of populations criteria
    simple_xml_model.instance_variable_get(:@population_criteria).each do |pop_crit|
      recurively_remove_precondition_comments(pop_crit)
    end

    # modify both populations to reduce erroneous error reporting
    remap_populations(simple_xml_model, hqmf_model)
  end

  # Handle changes that should not affect calculations
  def remap_arbitrary_dc_v2_diff(model)
    (model.all_data_criteria + model.source_data_criteria).each do |dc|
      # title and description for all are technically arbitrary values
      dc.instance_variable_set(:@title, '')
      dc.instance_variable_set(:@description, '')

      if %w(patient_characteristic_birthdate patient_characteristic_expired).index(dc.definition)
        dc.instance_variable_set(:@code_list_id, '')
        dc.instance_variable_set(:@inline_code_list, '')
      end

      # Changes specific occurrence consts to a generalized naming pattern
      # The goal is to reduce errors from arbitrary naming patterns that can
      #   pop up
      if dc.specific_occurrence && dc.specific_occurrence_const
        dc.instance_variable_set(:@specific_occurrence_const, "Occurrence #{dc.specific_occurrence}")
      end

      # ORDINALITY was changed to ORDINAL in the new HQMF, this nullifies that error
      if !dc.field_values.nil? && !dc.field_values.empty?
        if dc.field_values['ORDINALITY']
          dc.field_values['ORDINAL'] = dc.field_values['ORDINALITY']
          dc.field_values.delete('ORDINALITY')
        end
      end

      change_field_value_units(dc.value)
    end
  end

  # Changes the field value units that changed in the newer version
  def change_field_value_units(value)
    return if value.nil? || value.type != 'IVL_PQ'
    # Update units from simple_xml version, mm[Hg], to new mmHg version
    if value.low && value.low.unit == 'mm[Hg]'
      value.low.instance_variable_set(:@unit, 'mmHg')
    end
    if value.high && value.high.unit == 'mm[Hg]'
      value.high.instance_variable_set(:@unit,  'mmHg')
    end
  end

  # Manage corrections needed for individual (or groups of) measures
  def individual_measure_corrections(simple_xml_model, hqmf_model, measure_name)
    # Birthdate is unnecessary on this measure according to human readable, only appear in SimpleXML
    if measure_name == 'CMS149v4'
      simple_xml_model.instance_variable_get(:@source_data_criteria).reject! { |sdc| sdc.definition == 'patient_characteristic_birthdate' }
    end

    # Removes a code_list_id from a qdm variable (it is present in the measure xml)
    if ['CMS62v4'].index(measure_name)
      hqmf_model.all_data_criteria.select { |dc| dc.id == 'qdm_var_During_2F8D4BA8_BA4E_4DC8_9C35_11D4ADFE3E75' }.each do |dc|
        dc.instance_variable_set(:@code_list_id, nil)
      end
      hqmf_model.source_data_criteria.select { |dc| dc.id == 'qdm_var_During_2F8D4BA8_BA4E_4DC8_9C35_11D4ADFE3E75' }.each do |dc|
        dc.instance_variable_set(:@code_list_id, nil)
      end
    end

    # Handles measures that are "regardless of age" or seems to not refer to Ptient birthdate characteristic
    if %w(CMS31v4 CMS32v5 CMS50v4 CMS55v4 CMS62v4 CMS111v4 CMS129v5 CMS157v4 CMS185v4).index(measure_name)
      simple_xml_model.source_data_criteria.reject! { |dc| dc.definition == 'patient_characteristic_birthdate' }
    end
  end

  # Modify the populations to make them similar
  def remap_populations(simple_xml_model, hqmf_model)
    # The "stratifications" property of populations either does not exist or is not being parsed in SimpleXML,
    #  or is superfluous in HQMF (they both contain "STRAT"s)
    hqmf_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, _value| key == 'stratification' } }

    # population titles in HQMF2 can be ignored
    hqmf_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, _value| key == 'title' } }
    simple_xml_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, _value| key == 'title' } }
    hqmf_populations = hqmf_model.instance_variable_get(:@populations)
    reject_unnecessary_population_criteria(simple_xml_model, hqmf_populations)
  end

  # Removes populations that may not be necessary, but could appear in the simpel_xml
  #  (an unneccessary population is one that doesn't have a precondition)
  def reject_unnecessary_population_criteria(simple_xml_model, hqmf_populations)
    # More restrictive (only checks DENEXCEP) removal of populations in simple_xml
    # obtain all denexceps and denex (and only run if they exist)
    unnecessary_pop_crit = simple_xml_model.instance_variable_get(:@population_criteria).select { |pc| pc.type =~ /(DENEX|MSRPOPLEX)/ }
    unnecessary_pop_crit.each do |pc|
      # if HQMF2 version does not have that population
      next unless hqmf_populations.reject { |pop| !pop.key?(pc.type) || pop[pc.type] != pc.id }.empty?
      # or that population has a precondition
      next unless pc.preconditions.empty?
      # Then remove DENEXCEP from population  criteria and any population
      simple_xml_model.instance_variable_get(:@population_criteria)
        .delete_at(simple_xml_model.instance_variable_get(:@population_criteria).index { |pc2| pc == pc2 })
      simple_xml_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |_key, value| value == pc.id } }
    end
  end

  # We shouldn't be comparing comments stored in the formats
  def recurively_remove_precondition_comments(precondition)
    precondition.instance_variable_set(:@comments, nil)
    precondition.preconditions.each do |precon|
      recurively_remove_precondition_comments(precon)
    end
  end

  # Swap id's with the hash id generated by the criteria
  def remap_ids(measure_model)
    criteria_list = (measure_model.source_data_criteria + measure_model.all_data_criteria)
    criteria_map = get_criteria_map(measure_model.source_data_criteria, measure_model.all_data_criteria)

    # Normalize the HQMF model IDS
    criteria_list.each do |dc|
      dc.id = HashDataCriteria.hash_criteria(dc, criteria_map)
      dc.instance_variable_set(:@source_data_criteria, dc.id)
    end

    measure_model.all_population_criteria.each do |pc|
      remap_preconditions(criteria_map, pc.preconditions)
      # We don't care about differences in titles
      pc.instance_variable_set(:@title, '')
    end
  end

  # Creates a map of data criteria ids to the data criteria themselves
  def get_criteria_map(source_data_criteria, data_criteria)
    criteria_map = {}
    # Since the dc has more specifics than the sdc, only use the sdc version if no dc version exists
    source_data_criteria.each do |dc|
      criteria_map[dc.id] = dc
    end
    data_criteria.each do |dc|
      criteria_map[dc.id] = dc
    end
    criteria_map
  end

  # Swaps the Hash Id with the original data_criteria id
  def remap_preconditions(criteria_map, preconditions)
    return if preconditions.nil?
    preconditions.each do |precondition|
      remap_preconditions(criteria_map, precondition.preconditions)
      next if precondition.reference.nil?
      data_criteria = criteria_map[precondition.reference.id]
      precondition.reference.id = data_criteria.id if data_criteria
    end
  end

  # Generates the diff between the hqmf and simplexml modified json
  def generate_diff_and_save_to_file(measure_name, hqmf_json, simple_xml_json)
    diff = simple_xml_json.diff_hash(hqmf_json, true, true)
    unless diff.empty?
      outfile = File.join("#{RESULTS_DIR}", "#{measure_name}_diff.json")
      File.open(outfile, 'w') { |f| f.write(JSON.pretty_generate(JSON.parse(diff.to_json))) }
      outfile = File.join("#{RESULTS_DIR}", "#{measure_name}_diff_hqmf.json")
      File.open(outfile, 'w') { |f| f.write(JSON.pretty_generate(hqmf_json)) }
      outfile = File.join("#{RESULTS_DIR}", "#{measure_name}_diff_simplexml.json")
      File.open(outfile, 'w') { |f| f.write(JSON.pretty_generate(simple_xml_json)) }
    end
    diff
  end

  # Prints the original json, and the critical differences between the two base models, to files
  def print_to_file(measure_name, hqmf_model, simple_xml_model, hqmf_json_orig, simple_xml_json_orig)
    outfile = File.join("#{RESULTS_DIR}", "#{measure_name}_orig_hqmf.json")
    File.open(outfile, 'w') { |f| f.write(JSON.pretty_generate(hqmf_json_orig)) }
    outfile = File.join("#{RESULTS_DIR}", "#{measure_name}_orig_simplexml.json")
    File.open(outfile, 'w') { |f| f.write(JSON.pretty_generate(simple_xml_json_orig)) }

    outfile = File.join("#{RESULTS_DIR}", "#{measure_name}_crit_diff.json")
    File.open(outfile, 'w') do|f|
      f.puts((hqmf_model.all_data_criteria - hqmf_model.source_data_criteria).collect(&:id))
      f.puts
      f.puts((simple_xml_model.all_data_criteria - simple_xml_model.source_data_criteria).collect(&:id))
      f.puts
      f.puts((hqmf_model.all_data_criteria).collect(&:id))
    end
  end
end

# Class to handle hashing of data criteria
class HashDataCriteria
  # Generate the unique hash for a data criteria
  def self.hash_criteria(criteria, criteria_map)
    return criteria.id unless criteria_map[criteria.id]

    # generate a SHA256 hash of key fields in the data criteria
    # sha256 = Digest::SHA256.new
    # uncomment to keep string undigested for comparison
    sha256 = ''

    sha256 << "1-#{criteria.code_list_id}:"
    sha256 << "2-#{criteria.definition}:"
    sha256 << "3-#{criteria.status}:"
    sha256 << "4-#{criteria.negation}:"
    sha256 << "5-#{criteria.specific_occurrence}:"

    # build hashes of each complex child... these will update refereces to other data criteria as the hash is built
    sha256 << "6-#{hash_values(criteria.value)}:"
    sha256 << "7-#{hash_children(criteria.children_criteria, criteria_map)}:"
    sha256 << "8-#{hash_subsets(criteria.subset_operators)}:"
    sha256 << "9-#{hash_temporals(criteria.temporal_references, criteria_map)}:"
    sha256 << "10-#{hash_fields(criteria.field_values, criteria_map)}:"
    sha256 << "11-#{criteria.negation_code_list_id}:"

    # sha256.hexdigest
    sha256
  end

  # Hash subset operators
  def self.hash_subsets(list)
    return unless list
    Digest::SHA256.hexdigest list.map { |x| x.to_json.to_json }.join(',')
  end

  # Hash temporal references
  def self.hash_temporals(list, criteria_map)
    return unless list
    list.each do |t|
      t.reference.id = hash_criteria(criteria_map[t.reference.id], criteria_map) if criteria_map[t.reference.id]
    end

    Digest::SHA256.hexdigest list.map { |x| x.to_json.to_json }.join(',')
  end

  # Hash child criteria (using the criteria_map)
  def self.hash_children(list, criteria_map)
    return unless list
    list.map! { |id| "(#{hash_criteria(criteria_map[id], criteria_map)})" } if list.count { |id| criteria_map[id] } == list.length
    list.join(',')
  end

  # Hash field values
  def self.hash_fields(hash, criteria_map)
    return unless hash
    hash.values.each do |fv|
      fv.instance_variable_set(:@title, '')
      unless fv.instance_variable_get(:@reference).nil?
        fv.instance_variable_set(:@reference, hash_criteria(criteria_map[fv.instance_variable_get(:@reference)], criteria_map))
      end
    end
    Digest::SHA256.hexdigest hash.to_json
  end

  # Hash values for the criteria
  def self.hash_values(value)
    return unless value
    value.instance_variable_set(:@title, '') if value.type == 'CD'
    Digest::SHA256.hexdigest value.to_json.to_json
  end
end
