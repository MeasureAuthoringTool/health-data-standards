require 'fileutils'
require 'digest'
require 'simplexml_parser'
require_relative '../../../test_helper'

class HQMFVsSimpleTest < Minitest::Test
  RESULTS_DIR = File.join('tmp','hqmf_simple_diffs')

  HQMF_ROOT = File.join('test', 'fixtures', 'hqmf', 'hqmf')
  SIMPLE_XML_ROOT = File.join('test','fixtures','hqmf','simplexml')

  # Create a blank folder for the errors
  FileUtils.rm_rf(RESULTS_DIR) if File.directory?(RESULTS_DIR)
  FileUtils.mkdir_p RESULTS_DIR

  # Automatically generate one test method per measure file
  measure_files = File.join(HQMF_ROOT, '*.xml')

  Dir.glob(measure_files).each do | measure_filename |
    measure_name = File.basename(measure_filename, ".xml")
    if measure_name == "CMS128v4"
      define_method("test_#{measure_name}") do
        do_roundtrip_test(measure_filename, measure_name)
      end
    end
  end

  def do_roundtrip_test(measure_filename, measure_name)
    puts ">> #{measure_name}"
    # parse the model from the V1 XML
    hqmf_model = HQMF::Parser::V2Parser.new.parse(File.open(measure_filename).read)
    # rebuild hqmf model so that source data criteria are different objects
    hqmf_model = HQMF::Document.from_json(JSON.parse(hqmf_model.to_json.to_json, {max_nesting: 100}))

    simple_xml = File.join(SIMPLE_XML_ROOT, "#{hqmf_model.cms_id}_SimpleXML.xml")
    simple_xml_model = SimpleXml::Parser::V1Parser.new.parse(File.read(simple_xml))

    hqmf_json_orig = JSON.parse(hqmf_model.to_json.to_json, {max_nesting: 100})
    simple_xml_json_orig = JSON.parse(simple_xml_model.to_json.to_json, {max_nesting: 100})

    # ignore the attributes... these are not that important
    hqmf_model.instance_variable_set(:@attributes, [])
    simple_xml_model.instance_variable_set(:@attributes, [])

    # # reject the negated source data criteria... these are bad artifacts from HQMF v1.0
    # # we also want to pull those from the derived data criteria as well, but not all the negated from there, only the bad from the source data criteria
    # hqmf_model.source_data_criteria.reject! {|dc| dc.negation}

    # # only compare referenced data criteria since those are the ones that will impact calculation
    # referenced_ids = hqmf_model.referenced_data_criteria.map(&:id)
    # hqmf_model.all_data_criteria.reject! {|dc| !referenced_ids.include? dc.id }
    # referenced_ids = simple_xml_model.referenced_data_criteria.map(&:id)
    # simple_xml_model.all_data_criteria.reject! {|dc| !referenced_ids.include? dc.id }

    # # fix the descriptions on hqmf data criteria to align with better simpleXML descripions
    # # also remove empty units in hqmf and AnyValue entries on TIMEDIFF
    (simple_xml_model.all_data_criteria + simple_xml_model.source_data_criteria).each do |dc|
      fix_simplexml_description(dc)
    end

    # # HQMF leaf preconditions sometimes have conjunction codes as well as a reference...
    # # we want to clear those conjunction codes before comparison as they are not needed
    # hqmf_model.all_population_criteria.each do |pc|
    #   clear_conjunctions_on_references(pc)
    # end

    remap_ids(hqmf_model)
    remap_ids(simple_xml_model)

    # modify both populations to reduce erroneous error reporting
    remap_populations(simple_xml_model, hqmf_model)

    # certain measures carry over currently unused by products
    individual_measure_corrections(simple_xml_model, hqmf_model, measure_name)

    # empty out the measure period, since they are unlikely be equal
    simple_xml_model.instance_variable_set(:@measure_period, nil)
    hqmf_model.instance_variable_set(:@measure_period, nil)

    # simple_xml_model.all_population_criteria.each do |pc|
    #   # replace HQMF ID for populations... that does not get set properly in the HQMF
    #   pc.instance_variable_set(:@hqmf_id, hqmf_model.population_criteria(pc.id).hqmf_id)

    #   # set title on DENEX to denominator since the title is bad out of HQMF
    #   pc.instance_variable_set(:@title, 'Denominator') if pc.type == 'DENEX'
    # end

    # COMPARE

    hqmf_json = JSON.parse(hqmf_model.to_json.to_json, {max_nesting: 100})
    simple_xml_json = JSON.parse(simple_xml_model.to_json.to_json, {max_nesting: 100})

    diff = simple_xml_json.diff_hash(hqmf_json, true, true)

    unless diff.empty?
      outfile = File.join("#{RESULTS_DIR}","#{measure_name}_diff.json")
      File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(JSON.parse(diff.to_json))) }
      outfile = File.join("#{RESULTS_DIR}","#{measure_name}_diff_hqmf.json")
      File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(hqmf_json)) }
      outfile = File.join("#{RESULTS_DIR}","#{measure_name}_diff_simplexml.json")
      File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(simple_xml_json)) }

      outfile = File.join("#{RESULTS_DIR}","#{measure_name}_orig_hqmf.json")
      File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(hqmf_json_orig)) }
      outfile = File.join("#{RESULTS_DIR}","#{measure_name}_orig_simplexml.json")
      File.open(outfile, 'w') {|f| f.write(JSON.pretty_generate(simple_xml_json_orig)) }


      outfile = File.join("#{RESULTS_DIR}","#{measure_name}_crit_diff.json")
      File.open(outfile, 'w') {|f|
        f.puts((hqmf_model.all_data_criteria-hqmf_model.source_data_criteria).collect{|dc| dc.id})
        f.puts
        f.puts((simple_xml_model.all_data_criteria-simple_xml_model.source_data_criteria).collect{|dc| dc.id})
        f.puts
        f.puts((hqmf_model.all_data_criteria).collect{|dc| dc.id})
      }
    end
    #puts "#{measure_name} -- #{hqmf_model.derived_data_criteria.count}  --  #{simple_xml_model.derived_data_criteria.count} -- #{(hqmf_model.derived_data_criteria.count.to_f/simple_xml_model.derived_data_criteria.count.to_f).to_f}"
    #puts "#{measure_name} -- #{hqmf_model.source_data_criteria.count}  --  #{simple_xml_model.source_data_criteria.count} -- #{(hqmf_model.source_data_criteria.count.to_f/simple_xml_model.source_data_criteria.count.to_f).to_f}"
    # puts "#{measure_name} -- #{hqmf_model.all_data_criteria.count}  --  #{simple_xml_model.all_data_criteria.count} -- #{(hqmf_model.all_data_criteria.count.to_f/simple_xml_model.all_data_criteria.count.to_f).to_f}"
    assert diff.empty?, 'Differences in model between HQMF and SimpleXml... we need a better comparison mechanism'

  end

  def individual_measure_corrections(simple_xml_model, hqmf_model, measure_name)
    to_remove_patient_expired_from = ["CMS123v4", "CMS124v4", "CMS125v4", "CMS126v4", "CMS127v4", "CMS128v4"]
    # removes the source data criteria for patient expired from simplexml, which at this time does not exist in the HQMF2.1 version or in the human readable version
    simple_xml_model.instance_variable_get(:@source_data_criteria).reject! {|sdc| sdc.code_list_id == "2.16.840.1.113883.3.117.1.7.1.309"} if to_remove_patient_expired_from.index(measure_name)
    # CMS127v4 seems to have stratifications, but neither the source data criteria or human readable show it should
    hqmf_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, vaule| key == "stratification" }} if measure_name == "CMS126v4" or measure_name == "CMS127v4"
  end

  def remap_populations(simple_xml_model, hqmf_model)
    # population titles in HQMF2 can be ignored
    hqmf_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, vaule| key == "title" }}
    simple_xml_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, vaule| key == "title" }}
    hqmf_populations = hqmf_model.instance_variable_get(:@populations)

    # More restrictive (only checks DENEXCEP) removal of populations in simple_xml
    # if simple_xml version has no preconditions
    if denexceps = simple_xml_model.instance_variable_get(:@population_criteria).select {|pc| pc.type=="DENEXCEP"} and
    # and HQMF2 version does not have that population
    hqmf_populations.reject{ |pop| !pop.key?("DENEXCEP") }.empty?

      denexceps.each do |pc|
        if pc.preconditions.empty?
          # Then remove DENEXCEP from population  criteria and any population
          simple_xml_model.instance_variable_get(:@population_criteria).delete_at(simple_xml_model.instance_variable_get(:@population_criteria).index {|pc2| pc == pc2})
          simple_xml_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, vaule| key == "DENEXCEP"}}
        end
      end
    end

    if denex_index = simple_xml_model.instance_variable_get(:@population_criteria).index {|pc| pc.type=="DENEX"} and
    # and no preconditions
    simple_xml_model.instance_variable_get(:@population_criteria)[denex_index].preconditions.empty? and
    # HQMF2 version does not have that population
    hqmf_populations.reject{ |pop| !pop.key?("DENEX") }.empty?

      # Then remove DENEXCEP from population criteria and any populations
      simple_xml_model.instance_variable_get(:@population_criteria).delete_at(denex_index)
      simple_xml_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, vaule| key == "DENEX"}}
    end
    # remove populations in simple_xml if simple_xml version has no preconditions and HQMF2 version does not have that population
    # simple_xml_model.instance_variable_set(:@population_criteria, simple_xml_model.instance_variable_get(:@population_criteria).reject { |pop_crit| hqmf_populations.reject{ |pop| !pop.key?(pop_crit.type) }.empty? && pop_crit.preconditions.empty? })

  end

  def remap_ids(measure_model)

    criteria_list = (measure_model.all_data_criteria + measure_model.source_data_criteria)
    criteria_map = get_criteria_map(measure_model.source_data_criteria, measure_model.all_data_criteria)

    # Normalize the HQMF model IDS
    criteria_list.each do |dc|
      if dc.definition == "patient_characteristic_birthdate"
        dc.instance_variable_set(:@code_list_id, "")
        dc.instance_variable_set(:@title, "Birth Date")
        dc.instance_variable_set(:@description, "")
        dc.instance_variable_set(:@inline_code_list, "")
      end
      if dc.definition == "laboratory_test"
        dc.instance_variable_set(:@title, "Lab Test")
        dc.instance_variable_set(:@description, "")
      end
      if dc.children_criteria and dc.children_criteria.length > 0
        dc.instance_variable_set(:@description, "")
      end
      if dc.children_criteria and dc.children_criteria.length > 0
        dc.instance_variable_set(:@description, "")
      end
      dc.id = hash_criteria(dc, criteria_map)
      dc.instance_variable_set(:@source_data_criteria, dc.id)
      if dc.type == :derived
        dc.instance_variable_set(:@title, dc.id)
      end
    end

    measure_model.all_population_criteria.each do |pc|
      remap_preconditions(criteria_map, pc.preconditions)
      # We don't care about differences in titles
      pc.instance_variable_set(:@title, "")
    end

  end

  def remap_preconditions(criteria_map, preconditions)
    return if preconditions.nil?
    preconditions.each do |precondition|
      remap_preconditions(criteria_map, precondition.preconditions)
      unless precondition.reference.nil?
        if data_criteria = criteria_map[precondition.reference.id]
          precondition.reference.id = data_criteria.id
        end
      end
    end
  end

  def hash_criteria(criteria, criteria_map)
    return criteria.id unless criteria_map[criteria.id]

    # generate a SHA256 hash of key fields in the data criteria
    #sha256 = Digest::SHA256.new
    # uncomment to keep string undigested for comparison
    sha256 = ''

    sha256 << "1-#{criteria.code_list_id}:"
    sha256 << "2-#{criteria.definition}:"
    sha256 << (criteria.status.nil? ? "3-<nil>:" : "3-#{criteria.status}:")
    sha256 << "4-#{criteria.negation}:"
    sha256 << (criteria.specific_occurrence.nil? ? "5-<nil>:" : "5-#{criteria.specific_occurrence}:")
    sha256 << (criteria.negation_code_list_id.nil? ? "5-<nil>:" : "5-#{criteria.negation_code_list_id}:")

    # build hashes of each complex child... these will update refereces to other data criteria as the hash is built
    sha256 << (criteria.value.nil? ? "6-<nil>:" : "6-#{hash_values(criteria.value)}:")
    sha256 << (criteria.children_criteria.nil? ? "7-<nil>:" : "7-#{hash_children(criteria.children_criteria, criteria_map)}:")
    sha256 << (criteria.subset_operators.nil? ? "8-<nil>:" : "8-#{hash_subsets(criteria.subset_operators)}:")
    sha256 << (criteria.temporal_references.nil? ? "9-<nil>:" : "9-#{hash_temporals(criteria.temporal_references, criteria_map)}:")
    sha256 << (criteria.field_values.nil? ? "10-<nil>:" : "10-#{hash_fields(criteria.field_values)}:")

    #sha256.hexdigest
    sha256
  end

  def hash_subsets(list)
    Digest::SHA256.hexdigest list.map {|x| x.to_json.to_json}.join(',')
  end

  def hash_temporals(list, criteria_map)
    list.each do |t|
      t.reference.id = hash_criteria(criteria_map[t.reference.id], criteria_map) if criteria_map[t.reference.id]
    end

    Digest::SHA256.hexdigest list.map {|x| x.to_json.to_json}.join(',')
  end

  def hash_children(list, criteria_map)
    list.map! {|id| "(#{hash_criteria(criteria_map[id], criteria_map)})"} if list.select {|id| criteria_map[id]}.length == list.length
    list.join(',')
  end

  def hash_fields(hash)
    hash.values.each {|fv| fv.instance_variable_set(:@title,'')}
    Digest::SHA256.hexdigest hash.to_json
  end

  def hash_values(value)
    value.instance_variable_set(:@title, '') if value.type == 'CD'
    Digest::SHA256.hexdigest value.to_json.to_json
  end
  def fix_simplexml_description(dc)
    dc.instance_variable_set(:@description, dc.description.strip)
  end

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

end
