require 'fileutils'
require 'digest'
require 'simplexml_parser'
require_relative '../../../test_helper'

class HQMFVsSimpleTest < Minitest::Test
  RESULTS_DIR = File.join('tmp','hqmf_simple_diffs')

  HQMF_ROOT = File.join(ENV['HQMF_ROOT']) if ENV['HQMF_ROOT']
  HQMF_ROOT ||= File.join('test', 'fixtures', 'hqmf', 'hqmf')

  SIMPLE_XML_ROOT = File.join(ENV['SIMPLE_XML_ROOT']) if ENV['SIMPLE_XML_ROOT']
  SIMPLE_XML_ROOT ||= File.join('test','fixtures','hqmf','simplexml')

  # Create a blank folder for the errors
  FileUtils.rm_rf(RESULTS_DIR) if File.directory?(RESULTS_DIR)
  FileUtils.mkdir_p RESULTS_DIR
  # Automatically generate one test method per measure file
  measure_files = File.join(HQMF_ROOT, '*.xml')

  Dir.glob(measure_files).each do | measure_filename |
    measure_name = File.basename(measure_filename, ".xml")
    # if ["CMS190v4"].index(measure_name)
      define_method("test_#{measure_name}") do
        do_roundtrip_test(measure_filename, measure_name)
      end
    # end
  end

  def do_roundtrip_test(measure_filename, measure_name)
    puts ">> #{measure_name}"
    # parse the model from the V1 XML
    hqmf_model = HQMF::Parser::V2Parser.new.parse(File.open(measure_filename).read)
    # rebuild hqmf model so that source data criteria are different objects
    hqmf_model = HQMF::Document.from_json(JSON.parse(hqmf_model.to_json.to_json, {max_nesting: 100}))

    simple_xml = File.join(SIMPLE_XML_ROOT, "#{measure_name}_SimpleXML.xml")
    simple_xml_model = SimpleXml::Parser::V1Parser.new.parse(File.read(simple_xml))

    hqmf_json_orig = JSON.parse(hqmf_model.to_json.to_json, {max_nesting: 100})
    simple_xml_json_orig = JSON.parse(simple_xml_model.to_json.to_json, {max_nesting: 100})

    # ignore the attributes... these are not that important
    hqmf_model.instance_variable_set(:@attributes, [])
    simple_xml_model.instance_variable_set(:@attributes, [])

    # hqmf_model.instance_variable_set(:@data_criteria, hqmf_model.referenced_data_criteria)
    # simple_xml_model.instance_variable_set(:@data_criteria, simple_xml_model.referenced_data_criteria)

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

    # remap values in simple_xml and hqmf_model to resolve ignorable differences
    remap_arbitrary_v2_diffs(simple_xml_model, hqmf_model, measure_name)

    # certain measures carry over currently unused by products
    individual_measure_corrections(simple_xml_model, hqmf_model, measure_name)

    remap_ids(hqmf_model)
    remap_ids(simple_xml_model)

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
    end

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
    #puts "#{measure_name} -- #{hqmf_model.derived_data_criteria.count}  --  #{simple_xml_model.derived_data_criteria.count} -- #{(hqmf_model.derived_data_criteria.count.to_f/simple_xml_model.derived_data_criteria.count.to_f).to_f}"
    #puts "#{measure_name} -- #{hqmf_model.source_data_criteria.count}  --  #{simple_xml_model.source_data_criteria.count} -- #{(hqmf_model.source_data_criteria.count.to_f/simple_xml_model.source_data_criteria.count.to_f).to_f}"
    # puts "#{measure_name} -- #{hqmf_model.all_data_criteria.count}  --  #{simple_xml_model.all_data_criteria.count} -- #{(hqmf_model.all_data_criteria.count.to_f/simple_xml_model.all_data_criteria.count.to_f).to_f}"
    assert diff.empty?, 'Differences in model between HQMF and SimpleXml... we need a better comparison mechanism'

  end

  def remap_arbitrary_v2_diffs(simple_xml_model, hqmf_model, measure_name)
    # FIXME (10/19/2015) removes the source data criteria for patient expired from simplexml, which at this time does not exist in the HQMF2.1 version or in the human readable version for most measures
    unless ["CMS159v4", "CMS160v4", "CMS172v5", "CMS178v5"].index(measure_name)
      simple_xml_model.instance_variable_get(:@source_data_criteria).reject! {|sdc| sdc.definition == "patient_characteristic_expired"}
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

  def remap_arbitrary_dc_v2_diff(model)
    # It shouldn't matter if title and description match
    (model.all_data_criteria + model.source_data_criteria).each do |dc|
      if dc.definition == "patient_characteristic_birthdate"
        dc.instance_variable_set(:@code_list_id, "")
        dc.instance_variable_set(:@inline_code_list, "")
      end

      # Removes inline code list and id
      if dc.definition == "patient_characteristic_expired"
        dc.instance_variable_set(:@code_list_id, "")
        dc.instance_variable_set(:@inline_code_list, "")
      end

      # Changes specific occurrence consts to a generalized naming pattern
      # The goal is to reduce errors from arbitrary naming patterns that can
      #   pop up
      if dc.specific_occurrence && dc.specific_occurrence_const
        dc.instance_variable_set(:@specific_occurrence_const, "Occurrence #{dc.specific_occurrence}")
      end

      # ORDINALITY was changed to ORDINAL in the new HQMF, this nullifies that error
      if !dc.field_values.nil? && !dc.field_values.empty?
          if dc.field_values["ORDINALITY"]
            dc.field_values["ORDINAL"] = dc.field_values["ORDINALITY"]
            dc.field_values.delete("ORDINALITY")
          end
      end

      if !dc.value.nil?
        if dc.value.type == "IVL_PQ"
          # Update units from simple_xml version, mm[Hg], to new mmHg version
          if dc.value.low && dc.value.low.unit == "mm[Hg]"
            dc.value.low.instance_variable_set(:@unit,  "mmHg")
          end
          if dc.value.high && dc.value.high.unit == "mm[Hg]"
            dc.value.high.instance_variable_set(:@unit,  "mmHg")
          end
        end
      end

      # title and description for all are technically arbitrary values
      dc.instance_variable_set(:@title, '')
      dc.instance_variable_set(:@description, '')
    end
  end

  def individual_measure_corrections(simple_xml_model, hqmf_model, measure_name)
    # Birthdate is unnecessary on this measure according to human readable, only appear in SimpleXML
    simple_xml_model.instance_variable_get(:@source_data_criteria).reject! {|sdc| sdc.definition == "patient_characteristic_birthdate"} if measure_name == "CMS149v4"

    # Removes a code_list_id from a qdm variable (it is present in the measure xml)
    if ["CMS62v4"].index(measure_name)
      hqmf_model.all_data_criteria.select {|dc| dc.id == "qdm_var_During_2F8D4BA8_BA4E_4DC8_9C35_11D4ADFE3E75"}.each {|dc| dc.instance_variable_set(:@code_list_id, nil)}
      hqmf_model.source_data_criteria.select {|dc| dc.id == "qdm_var_During_2F8D4BA8_BA4E_4DC8_9C35_11D4ADFE3E75"}.each {|dc| dc.instance_variable_set(:@code_list_id, nil)}
    end

    # Handles measures that are "regardless of age" or seems to not refer to Ptient birthdate characteristic
    if ["CMS31v4", "CMS32v5", "CMS50v4", "CMS55v4", "CMS62v4", "CMS111v4", "CMS129v5", "CMS157v4", "CMS185v4"].index(measure_name)
      simple_xml_model.source_data_criteria.reject! {|dc| dc.definition == "patient_characteristic_birthdate"}
    end

    # The following have issues where the proper diagnosis title and description are replaced by VTE
    if measure_name == "CMS69v4"
      hqmf_model.all_data_criteria.select {|dc| dc.code_list_id == "2.16.840.1.113883.3.600.1.1751"}.each {|dc| dc.instance_variable_set(:@title, ""); dc.instance_variable_set(:@description, "")}
      hqmf_model.source_data_criteria.select {|dc| dc.code_list_id == "2.16.840.1.113883.3.600.1.1751"}.each {|dc| dc.instance_variable_set(:@title, ""); dc.instance_variable_set(:@description, "")}
      simple_xml_model.all_data_criteria.select {|dc| dc.code_list_id == "2.16.840.1.113883.3.600.1.1751"}.each {|dc| dc.instance_variable_set(:@title, ""); dc.instance_variable_set(:@description, "")}
      simple_xml_model.source_data_criteria.select {|dc| dc.code_list_id == "2.16.840.1.113883.3.600.1.1751"}.each {|dc| dc.instance_variable_set(:@title, ""); dc.instance_variable_set(:@description, "")}
    end
    if measure_name == "CMS153v4"
      hqmf_model.all_data_criteria.select {|dc| dc.code_list_id == "2.16.840.1.113883.3.464.1003.198.12.1034" || dc.code_list_id == "2.16.840.1.113883.3.464.1003.111.12.1008"}.each {|dc| dc.instance_variable_set(:@title, ""); dc.instance_variable_set(:@description, "")}
      hqmf_model.source_data_criteria.select {|dc| dc.code_list_id == "2.16.840.1.113883.3.464.1003.198.12.1034" || dc.code_list_id == "2.16.840.1.113883.3.464.1003.111.12.1008"}.each {|dc| dc.instance_variable_set(:@title, ""); dc.instance_variable_set(:@description, "")}
      simple_xml_model.all_data_criteria.select {|dc| dc.code_list_id == "2.16.840.1.113883.3.464.1003.198.12.1034" || dc.code_list_id == "2.16.840.1.113883.3.464.1003.111.12.1008"}.each {|dc| dc.instance_variable_set(:@title, ""); dc.instance_variable_set(:@description, "")}
      simple_xml_model.source_data_criteria.select {|dc| dc.code_list_id == "2.16.840.1.113883.3.464.1003.198.12.1034" || dc.code_list_id == "2.16.840.1.113883.3.464.1003.111.12.1008"}.each {|dc| dc.instance_variable_set(:@title, ""); dc.instance_variable_set(:@description, "")}
    end
    # Removed here. It's referenced by a field value, but is not necessary in the data_criteria (exists in source)
    if measure_name == "CMS50v4"
      simple_xml_model.all_data_criteria.reject! {|dc| dc.id == "OccurrenceAReferral1"}
    end

  end

  def remap_populations(simple_xml_model, hqmf_model)
    # The "stratifications" property of populations either does not exist or is not being parsed in SimpleXML, or is superfluous in HQMF (they both contain "STRAT"s)
    hqmf_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, vaule| key == "stratification" }}

    # population titles in HQMF2 can be ignored
    hqmf_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, vaule| key == "title" }}
    simple_xml_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, vaule| key == "title" }}
    hqmf_populations = hqmf_model.instance_variable_get(:@populations)


    # More restrictive (only checks DENEXCEP) removal of populations in simple_xml
    # obtain all denexceps and denex (and only run if they exist)
    if unnecessary_pop_crit = simple_xml_model.instance_variable_get(:@population_criteria).select {|pc| pc.type=~/(DENEX|MSRPOPLEX)/}

      unnecessary_pop_crit.each do |pc|
        # if HQMF2 version does not have that population
        next unless hqmf_populations.reject{ |pop| !pop.key?(pc.type) || pop[pc.type] != pc.id }.empty?
        if pc.preconditions.empty?
          # Then remove DENEXCEP from population  criteria and any population
          simple_xml_model.instance_variable_get(:@population_criteria).delete_at(simple_xml_model.instance_variable_get(:@population_criteria).index {|pc2| pc == pc2})
          simple_xml_model.instance_variable_get(:@populations).map! { |pop| pop.reject { |key, value| value == pc.id}}
        end
      end
    end

    # remove populations in simple_xml if simple_xml version has no preconditions and HQMF2 version does not have that population
    # simple_xml_model.instance_variable_set(:@population_criteria, simple_xml_model.instance_variable_get(:@population_criteria).reject { |pop_crit| hqmf_populations.reject{ |pop| !pop.key?(pop_crit.type) }.empty? && pop_crit.preconditions.empty? })

  end

  # We shouldn't be comparing comments stored in the formats
  def recurively_remove_precondition_comments(precondition)
      precondition.instance_variable_set(:@comments, nil)
      precondition.preconditions.each do |precon|
        recurively_remove_precondition_comments(precon)
      end
  end

  def remap_ids(measure_model)

    criteria_list = (measure_model.source_data_criteria + measure_model.all_data_criteria)
    criteria_map = get_criteria_map(measure_model.source_data_criteria, measure_model.all_data_criteria)

    # Normalize the HQMF model IDS
    criteria_list.each do |dc|
      dc.id = hash_criteria(dc, criteria_map)
      dc.instance_variable_set(:@source_data_criteria, dc.id)
    end

    measure_model.all_population_criteria.each do |pc|
      remap_preconditions(criteria_map, pc.preconditions)
      # We don't care about differences in titles
      pc.instance_variable_set(:@title, "")
    end

  end

  # Swaps the Hash Id with the original data_criteria id
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

    # build hashes of each complex child... these will update refereces to other data criteria as the hash is built
    sha256 << (criteria.value.nil? ? "6-<nil>:" : "6-#{hash_values(criteria.value)}:")
    sha256 << (criteria.children_criteria.nil? ? "7-<nil>:" : "7-#{hash_children(criteria.children_criteria, criteria_map)}:")
    sha256 << (criteria.subset_operators.nil? ? "8-<nil>:" : "8-#{hash_subsets(criteria.subset_operators)}:")
    sha256 << (criteria.temporal_references.nil? ? "9-<nil>:" : "9-#{hash_temporals(criteria.temporal_references, criteria_map)}:")
    sha256 << (criteria.field_values.nil? ? "10-<nil>:" : "10-#{hash_fields(criteria.field_values, criteria_map)}:")
    sha256 << (criteria.negation_code_list_id.nil? ? "11-<nil>:" : "11-#{criteria.negation_code_list_id}:")

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

  def hash_fields(hash, criteria_map)
    hash.values.each do |fv|
      fv.instance_variable_set(:@title,'')
      unless fv.instance_variable_get(:@reference).nil?
        fv.instance_variable_set(:@reference, hash_criteria(criteria_map[fv.instance_variable_get(:@reference)], criteria_map))
      end
    end
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
