module HQMF2
  # Generates the Source Data Criteria from the entries in the HQMF
  class SourceDataCriteriaHelper
    # Generates an identifier based on the leftover elements included in the source data criteria.
    def self.identifier(criteria)
      sha256 = ''
      sha256 << "#{criteria.code_list_id}:"
      sha256 << "#{criteria.definition}:"
      sha256 << "#{criteria.status}:"
      sha256 << "#{criteria.specific_occurrence}:"
      sha256 << "#{criteria.specific_occurrence_const}:"
      sha256 << "#{criteria.variable}:"
      sha256 << (criteria.children_criteria.nil? ? '<nil>:' : "#{criteria.children_criteria.sort.join(',')}:")

      Digest::SHA256.hexdigest sha256
    end

    # Rejects any derived elements as they should never be used as source.
    def self.should_reject?(dc)
      dc.definition == 'derived'
    end

    # Removes unnecessary elements from a data criteria to create a source data criteria
    def self.strip_non_sc_elements(dc)
      if [HQMF::DataCriteria::SATISFIES_ANY, HQMF::DataCriteria::SATISFIES_ALL].include? dc.definition
        dc.instance_variable_set(:@definition, 'derived')
      end
      dc.instance_variable_set(:@source_data_criteria, dc.id)
      dc.instance_variable_set(:@field_values, {})
      dc.instance_variable_set(:@temporal_references, [])
      dc.instance_variable_set(:@subset_operators, [])
      dc.instance_variable_set(:@value, nil)
      dc.instance_variable_set(:@negation, false)
      dc.instance_variable_set(:@negation_code_list_id, nil)
      dc
    end

    # determins if a data criteria has any non-SDC fields set (i.e., those fields need to be stripped)
    def self.already_stripped?(dc)
      dc.field_values.blank? && dc.temporal_references.blank? && dc.subset_operators.blank? && dc.value.blank? && dc.negation.blank? && dc.negation_code_list_id.blank?
    end

    # Creates a data criteria based on an entry xml, removes any unnecessary elements (for the source),
    #  and adds a data criteria reference if none exist
    def self.as_source_data_criteria(entry, data_criteria_references = {}, occurrences_map = {})
      dc = DataCriteria.new(entry, data_criteria_references, occurrences_map)
      dc.original_id = dc.id
      unless dc.definition == 'derived' # && dc.temporal_references.blank? && dc.subset_operators.blank? && dc.value.blank? && dc.field_values.blank?
        # add "_source" to the id to differentiate from the non-source
        dc.id = "#{dc.id}_source"
      end
      dc = SourceDataCriteriaHelper.strip_non_sc_elements(dc)
      # add it as a reference
      if dc && (data_criteria_references[dc.id].nil? || data_criteria_references[dc.id].code_list_id.nil?)
        data_criteria_references[dc.original_id] = dc
      end

      dc
    end

    # Check if there is an existing entry in the source data criteria list that matches the candidate passed in
    # this is used to prevent adding duplicate source data criteria entries when one already exists
    def self.find_existing_source_data_criteria(list, candidate)
      list.each do |sdc|
        # check if we have an exact match on an existing SDC
        return sdc if SourceDataCriteriaHelper.identifier(sdc) == SourceDataCriteriaHelper.identifier(candidate)
        # we have another existing copy of the specific occurrence (identified via the constant and occurrence lettering), use that rather than duplicating... there will not be an
        # exact match for variables since a new child will have been generated
        return sdc if !sdc.specific_occurrence_const.nil? && sdc.specific_occurrence_const == candidate.specific_occurrence_const && sdc.specific_occurrence == candidate.specific_occurrence
      end
      nil
    end

    # Given a list of criteria obtained from the XML, generate most of the source data criteria (since no explicit
    # sources are given). After generating the source data criteria, filter the list to not include repeated,
    # unnecessary sources, but maintain and return map of those that have been removed to those that they were replaced
    # with.
    def self.get_source_data_criteria_list(full_criteria_list, data_criteria_references = {}, occurrences_map = {})
      # currently, this will erase the sources if the ids are the same, but will not correct references later on
      source_data_criteria = full_criteria_list.map do |entry|
        SourceDataCriteriaHelper.as_source_data_criteria(entry, data_criteria_references, occurrences_map)
      end

      collapsed_source_data_criteria_map = {}
      uniq_source_data_criteria = {}
      source_data_criteria.each do |sdc|
        identifier = SourceDataCriteriaHelper.identifier(sdc)
        if uniq_source_data_criteria.key? identifier
          collapsed_source_data_criteria_map[sdc.original_id] = uniq_source_data_criteria[identifier].id
        else
          uniq_source_data_criteria[identifier] = sdc
        end
      end
      unique = uniq_source_data_criteria.values.reject { |dc| SourceDataCriteriaHelper.should_reject?(dc) }

      # we need an empty data criteria in source that acts as the target for the specific occurrence
      # the data criteria that we are duplicating will eventually get turned into a specific occurrence
      occurrences = unique.select {|dc| occurrences_map[dc.id] && dc.definition != 'derived' }
      occurrences.each do |occurrence|
        # do not create a nonspecific SDC for variables
        unless occurrence.variable
          dc = SourceDataCriteriaHelper.as_source_data_criteria(occurrence.entry)
          dc.id = "#{dc.id}_nonSpecific"
          dc.instance_variable_set(:@source_data_criteria, dc.id)
          unique << dc unless SourceDataCriteriaHelper.find_existing_source_data_criteria(unique, dc)
        end
      end

      [unique, collapsed_source_data_criteria_map]
    end
  end
end
