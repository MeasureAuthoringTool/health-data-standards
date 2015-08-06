module HQMF2
  class SourceDataCriteriaHelper
  	def self.identifier(criteria)

      sha256 = ""
      sha256 << "#{criteria.code_list_id}:"
      sha256 << "#{criteria.definition}:"
      sha256 << (criteria.status.nil? ? "<nil>:" : "#{criteria.status}:")
      sha256 << (criteria.specific_occurrence.nil? ? "<nil>:" : "#{criteria.specific_occurrence}:")
      sha256 << "#{criteria.variable}:"
      sha256 << (criteria.children_criteria.nil? ? "<nil>:" : "#{criteria.children_criteria.sort.join(',')}:")

      sha256
  	end

    def self.should_reject(dc)
      dc.definition == 'derived' && !dc.variable
    end

    def self.as_source_data_criteria(entry)
      dc = DataCriteria.new(entry)
      dc.instance_variable_set(:@definition, 'derived') if [HQMF::DataCriteria::SATISFIES_ANY, HQMF::DataCriteria::SATISFIES_ALL].include? dc.definition

      dc.instance_variable_set(:@field_values, {})
      dc.instance_variable_set(:@temporal_references, [])
      dc.instance_variable_set(:@subset_operators, [])
      dc.instance_variable_set(:@value, nil)
      dc.instance_variable_set(:@negation, false)
      dc.instance_variable_set(:@negation_code_list_id, nil)
      dc
    end

    def self.get_source_data_criteria_list(full_criteria_list)
      full_criteria_list.map{|dc| SourceDataCriteriaHelper.as_source_data_criteria(dc.entry)}.uniq {|dc| SourceDataCriteriaHelper.identifier(dc)}.reject {|dc| SourceDataCriteriaHelper.should_reject(dc)}
    end

  end
end