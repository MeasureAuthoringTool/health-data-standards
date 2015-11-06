module HQMF2
  # Generates the Source Data Criteria from the entries in the HQMF
  class SourceDataCriteriaHelper
    # Generates an identifier based on teh leftover elements included in the source data criteria.
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
    def self.should_reject(dc)
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

    # Creates a data criteria based on an entry xml, removes any unnecessary elements (for the source),
    #  and adds a data criteria reference if none exist
    def self.as_source_data_criteria(entry, data_criteria_references = {}, occurrences_map = {})
      dc = DataCriteria.new(entry, data_criteria_references, occurrences_map)
      dc = SourceDataCriteriaHelper.strip_non_sc_elements(dc)
      if dc && (data_criteria_references[dc.id].nil? || data_criteria_references[dc.id].code_list_id.nil?)
        data_criteria_references[dc.id] = dc
      end
      dc
    end

    # Given a list of criteria obtained from the XML, generate most of the source data criteria (since no explicit sources are given).
    # After generating the source data criteria, filter the list to not include repeated, unnecessary sources, but maintain and return
    #  map of those that have been removed to those that they were replaced with.
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
          collapsed_source_data_criteria_map[sdc.id] = uniq_source_data_criteria[identifier].id
        else
          uniq_source_data_criteria[identifier] = sdc
        end
      end
      [uniq_source_data_criteria.values.reject { |dc| SourceDataCriteriaHelper.should_reject(dc) }, collapsed_source_data_criteria_map]
    end
  end
end
