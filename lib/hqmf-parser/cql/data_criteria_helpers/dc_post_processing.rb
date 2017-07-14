module HQMF2CQL
  # Processing on data criteria after the initial extractions have taken place
  module DataCriteriaPostProcessing
    extend HQMF2::DataCriteriaPostProcessing

    # Handles settings values after (most) values have been setup
    def post_processing
      extract_code_list_path_and_result_value

      # Prefix ids that start with numerical values, and strip tokens from others
      @id = strip_tokens(@id)
      @children_criteria.map! { |cc| strip_tokens(cc) }

      # append "_source" to the criteria since all the source criteria are separated from the non-source with the "_source" identifier
      # "_source" is added to the SDC ids so that we are not duplicating ids between source and non source data criteria lists
      # the derived source data criteria maintain their original ids since they are duplicated in the data criteria and source data criteria lists from the simple xml
      @source_data_criteria = "#{@id}_source" unless (@definition == 'derived' || @definition == 'satisfies_all' || @definition == 'satisfies_any')
      @source_data_criteria = strip_tokens(@source_data_criteria) unless @source_data_criteria.nil?
    end

    # Extract the code_list_xpath and the criteria's value from any of the
    # template ids (if multiple exist)
    def extract_code_list_path_and_result_value
      @template_ids.each do |t|
        # NOTE! (Adam 6/14): The following logic should absolutely be changed
        # when Bonnie CQL support goes production. The "try this then try
        # that" approach is an artifact of the template oids changing as of
        # MAT 5.3; we want to support measures exported using 5.3, but also
        # measures that were exported using previous versions of the MAT.

        # Try a lookup using the newer template oids.
        mapping = HQMF2CQL::ValueSetHelper.get_mapping_for_template(t)

        # If the new template oids didn't work, try a lookup using the older
        # template oids.
        mapping = HQMF2::ValueSetHelper.get_mapping_for_template(t)unless mapping

        handle_mapping_template(mapping)
        break if mapping # Quit if one template id with a mapping has set these values
      end
    end
  end
end
