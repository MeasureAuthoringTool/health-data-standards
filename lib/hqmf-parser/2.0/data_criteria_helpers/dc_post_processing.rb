module HQMF2
  # Processing on data criteria after the initial extractions have taken place
  module DataCriteriaPostProcessing
    # Handles settings values after (most) values have been setup
    def post_processing
      set_code_list_path_and_result_value

      # prefix ids that start with numerical values, and strip tokens from others
      @id = strip_tokens @id
      @children_criteria.map! { |cc| strip_tokens cc }

      #### prefix!!!!!!!!!

      @source_data_criteria = strip_tokens(@source_data_criteria) unless @source_data_criteria.nil?
      @specific_occurrence_const = strip_tokens(@specific_occurrence_const) unless @specific_occurrence_const.nil?
      set_intersection
      handle_derived_specific_occurrences
    end

    # Extract the code_list_xpath from either the location related to the speicifc occurrence, or
    #  from any of the template ids (if multiple exist)
    def set_code_list_path_and_result_value
      if @template_ids.empty? && @specific_occurrence
        template = @entry.document.at_xpath(
          "//cda:id[@root='#{@source_data_criteria_root}' and @extension='#{@source_data_criteria_extension}']/../cda:templateId/cda:item/@root")
        if template
          mapping = ValueSetHelper.get_mapping_for_template(template.to_s)
          handle_mapping_template(mapping)
        end
      end
      @template_ids.each do |t|
        mapping = ValueSetHelper.get_mapping_for_template(t)
        handle_mapping_template(mapping)
        break if mapping # quit if one template id with a mapping has set these values
      end
    end

    # Extract the value and code_list_xpath from the template mapping held in the ValueSetHelper class
    def handle_mapping_template(mapping)
      if mapping
        @code_list_xpath = mapping[:valueset_path] if mapping[:valueset_path] && @entry.at_xpath(mapping[:valueset_path])
        @value = DataCriteriaMethods.parse_value(@entry, mapping[:result_path]) if mapping[:result_path]
      end
    end

    # Changes XPRODUCT data criteria that has an associated tempalte(s) to an INTERSETION criteria
    def set_intersection
      # Need to handle grouper criteria that do not have template ids -- these will be union of and intersection criteria
      return unless @template_ids.empty?
      # Change the XPRODUCT to an INTERSECT otherwise leave it as a UNION
      @derivation_operator = HQMF::DataCriteria::INTERSECT if @derivation_operator == HQMF::DataCriteria::XPRODUCT
      @description ||= (@derivation_operator == HQMF::DataCriteria::INTERSECT) ? 'Intersect' : 'Union'
    end

    # Apply some elements from the reference_criteria to the derived specific occurrence
    def handle_derived_specific_occurrences
      return unless @definition == 'derived'
      # Adds a child if none exists (specifically the source criteria)
      @children_criteria << @source_data_criteria if @children_criteria.empty?
      return if @children_criteria.length != 1 || (@source_data_criteria.present? && @children_criteria.first != @source_data_criteria)
      # if child.first is nil, it will be caught in the second statement
      reference_criteria = @data_criteria_references[@children_criteria.first]
      return if reference_criteria.nil?
      @do_not_group = true # easier to track than all testing all features of these cases
      @subset_operators ||= reference_criteria.subset_operators
      @derivation_operator ||= reference_criteria.derivation_operator
      @description = reference_criteria.description
      @variable = reference_criteria.variable
    end
  end
end
