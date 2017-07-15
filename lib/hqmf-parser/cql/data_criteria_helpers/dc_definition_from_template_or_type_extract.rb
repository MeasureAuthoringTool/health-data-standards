module HQMF2CQL
  # Extracts the type, and modifies the data criteria, based on the template id or definition
  module DataCriteriaTypeAndDefinitionExtraction
    extend HQMF2::DataCriteriaTypeAndDefinitionExtraction

    def extract_definition_from_template_or_type
      # Try to determine what kind of data criteria we are dealing with
      # First we look for a template id and if we find one just use the definition
      # status and negation associated with that
      # If no template id or not one we recognize then try to determine type from
      # the definition element.
      extract_definition_from_type unless extract_definition_from_template_id
    end

    # Given a template id, derive (if available) the definition for the template.
    # The definitions are stored in hqmf-model/data_criteria.json.
    def extract_definition_from_template_id
      found = false

      @template_ids.each do |template_id|
        # NOTE! (Adam 6/14): The following logic should absolutely be changed
        # when Bonnie CQL support goes production. The "try this then try
        # that" approach is an artifact of the template oids changing as of
        # MAT 5.3; we want to support measures exported using 5.3, but also
        # measures that were exported using previous versions of the MAT.

        # Try a lookup using the newer template oids.
        defs = HQMF::DataCriteria.definition_for_template_id(template_id, 'r2cql')

        # If the new template oids didn't work, try a lookup using the older
        # template oids.
        defs = HQMF::DataCriteria.definition_for_template_id(template_id, 'r2') unless defs

        if defs
          @definition = defs['definition']
          @status = defs['status'].length > 0 ? defs['status'] : nil
          found ||= true
        else
          found ||= handle_known_template_id(template_id)
        end
      end

      found
    end

    # Extract the definition (sometimes status, sometimes other elements) of the data criteria based on the type
    def extract_definition_from_type
      if @entry.at_xpath('./cda:grouperCriteria')
        @definition ||= 'derived'
        return
      end
      # See if we can find a match for the entry definition value and status.
      entry_type = attr_val('./*/cda:definition/*/cda:id/@extension')
      handle_entry_type(entry_type)
    end

    # Generate the definition and/or status from the entry type in most cases.
    # If the entry type is nil, and the value is a specific occurrence, more parsing may be necessary.
    def handle_entry_type(entry_type)
      # settings is required to trigger exceptions, which set the definition
      HQMF::DataCriteria.get_settings_for_definition(entry_type, @status)
      @definition = entry_type
    rescue
      # if no exact match then try a string match just using entry definition value
      case entry_type
      when 'Medication', 'Medications'
        @definition = 'medication'
        @status = 'active' unless @status
      when 'RX'
        @definition = 'medication'
        @status = 'dispensed' unless @status
      when nil
        definition_for_nil_entry
      else
        @definition = extract_definition_from_entry_type(entry_type)
      end
    end
  end
end
