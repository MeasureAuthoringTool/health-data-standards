module HQMF2
  # Utilities used by the document parser to handle generic tasks
  module DocumentUtilities
    # Create grouper data criteria for encapsulating variable data criteria
    # and update document data criteria list and references map
    def handle_variable(data_criteria)
      if data_criteria.is_derived_specific_occurrence_variable
        data_criteria.handle_derived_specific_occurrence_variable
        return
      end

      grouper_data_criteria = data_criteria.extract_variable_grouper
      return unless grouper_data_criteria
      @data_criteria_references[data_criteria.id] = data_criteria
      @data_criteria_references[grouper_data_criteria.id] = grouper_data_criteria
      @data_criteria << grouper_data_criteria
      @source_data_criteria << SourceDataCriteriaHelper.strip_non_sc_elements(grouper_data_criteria)
    end

    # Checks if one data criteria is covered by another (has all the appropriate elements of)
    def criteria_covered_by_criteria?(dc)
      @reference_ids.uniq

      base_criteria_defs = %w(patient_characteristic_ethnicity patient_characteristic_gender patient_characteristic_payer patient_characteristic_race)
      to_reject = true
      to_reject &&= @reference_ids.index(dc.id).nil? # don't reject if anything refers directly to this criteria
      # don't reject if it is a "base" criteria (no references but must exist)
      to_reject &&= !base_criteria_defs.include?(dc.definition)
      # keep referral occurrence
      to_reject &&= dc.specific_occurrence_const.nil? ||
                    dc.code_list_id != '2.16.840.1.113883.3.464.1003.101.12.1046'
      to_reject && !@data_criteria.detect do |dc2|
        similar_criteria = true
        similar_criteria &&= dc != dc2 # Don't check against itself
        similar_criteria &&= dc.code_list_id == dc2.code_list_id # Ensure code list ids are the same
        similar_criteria && detect_criteria_covered_by_criteria(dc, dc2)
      end.nil? # don't reject unless there is a similar element
    end

    # Check if one data criteria contains the others information by checking that one has everything the other has
    # (or more)
    def detect_criteria_covered_by_criteria(data_criteria, check_criteria)
      base_checks = true

      # Check whether basic features are the same
      base_checks &&= data_criteria.definition == check_criteria.definition # same definition
      base_checks &&= data_criteria.status == check_criteria.status # same status
      # same children
      base_checks &&= data_criteria.children_criteria.sort.join(',') == check_criteria.children_criteria.sort.join(',')
      # Ensure it doesn't contain basic elements that should not be removed
      base_checks &&= !data_criteria.variable # Ensure it's not a variable
      base_checks &&= data_criteria.derivation_operator.nil? # Ensure it doesn't have a derivation operator
      base_checks &&= data_criteria.subset_operators.empty? # Ensure it doesn't have a subset operator
      # Ensure it doesn't have Temporal References
      base_checks &&= data_criteria.temporal_references.nil? || data_criteria.temporal_references.empty?

      base_checks && complex_coverage(data_criteria, check_criteria)
    end

    # Check elements that do not already exist; else, if they do, check if those elements are the same
    # in a different, potentially matching, data criteria
    def complex_coverage(data_criteria, check_criteria)
      same_value = data_criteria.value.nil? ||
                   data_criteria.value.try(:to_model).try(:to_json) == check_criteria.value.try(:to_model).try(:to_json)
      same_field_values = data_criteria.field_values.nil? || data_criteria.field_values.empty? ||
                          data_criteria.field_values.try(:to_json) == check_criteria.field_values.try(:to_json)
      same_negation_values = data_criteria.negation_code_list_id.nil? ||
                             data_criteria.negation_code_list_id == check_criteria.negation_code_list_id
      same_value && same_field_values && same_negation_values
    end
  end
end
