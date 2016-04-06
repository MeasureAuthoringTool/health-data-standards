module HQMF2
  # Extracts the type, and modifies the data criteria, based on the template id or definition
  module DataCriteriaTypeAndDefinitionExtraction
    VARIABLE_TEMPLATE = '0.1.2.3.4.5.6.7.8.9.1'
    SATISFIES_ANY_TEMPLATE = '2.16.840.1.113883.10.20.28.3.108'
    SATISFIES_ALL_TEMPLATE = '2.16.840.1.113883.10.20.28.3.109'
    def extract_definition_from_template_or_type
      # Try to determine what kind of data criteria we are dealing with
      # First we look for a template id and if we find one just use the definition
      # status and negation associated with that
      # If no template id or not one we recognize then try to determine type from
      # the definition element
      extract_definition_from_type unless extract_definition_from_template_id
    end

    #  Given a template id, derive (if available) the definition for the template.
    #  The definitions are stored in hqmf-model/data_criteria.json.
    def extract_definition_from_template_id
      found = false

      @template_ids.each do |template_id|
        defs = HQMF::DataCriteria.definition_for_template_id(template_id, 'r2')
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

    # Given a template id, modify the variables inside this data criteria to reflect the template
    def handle_known_template_id(template_id)
      case template_id
      when VARIABLE_TEMPLATE
        @derivation_operator = HQMF::DataCriteria::INTERSECT if @derivation_operator == HQMF::DataCriteria::XPRODUCT
        @definition ||= 'derived'
        @variable = true
        @negation = false
      when SATISFIES_ANY_TEMPLATE
        @definition = HQMF::DataCriteria::SATISFIES_ANY
        @negation = false
      when SATISFIES_ALL_TEMPLATE
        @definition = HQMF::DataCriteria::SATISFIES_ALL
        @derivation_operator = HQMF::DataCriteria::INTERSECT
        @negation = false
      else
        return false
      end
      true
    end

    # Extract the definition (sometimes status, sometimes other elements) of the data criteria based on the type
    def extract_definition_from_type
      # If we have a specific occurrence of a variable, pull attributes from the reference.
      # IDEA set this up to be called from dc_specific_and_source_extract, the number of
      #  fields changed by handle_specific_variable_ref may pose an issue.
      extract_information_for_specific_variable if @variable && @specific_occurrence

      if @entry.at_xpath('./cda:grouperCriteria')
        @definition ||= 'derived'
        return
      end
      # See if we can find a match for the entry definition value and status.
      entry_type = attr_val('./*/cda:definition/*/cda:id/@extension')
      handle_entry_type(entry_type)
    end

    # Extracts information from a reference for a specific
    def extract_information_for_specific_variable
      reference = @entry.at_xpath('./*/cda:outboundRelationship/cda:criteriaReference',
                                  HQMF2::Document::NAMESPACES)
      if reference
        ref_id = strip_tokens(
          "#{HQMF2::Utilities.attr_val(reference, 'cda:id/@extension')}_#{HQMF2::Utilities.attr_val(reference, 'cda:id/@root')}")
      end
      reference_criteria = @data_criteria_references[ref_id] if ref_id
      # if the reference is derived, pull from the original variable
      if reference_criteria && reference_criteria.definition == 'derived'
        reference_criteria = @data_criteria_references["GROUP_#{ref_id}"]
      end
      return unless reference_criteria
      handle_specific_variable_ref(reference_criteria)
    end

    # Apply additional information to a specific occurrence's elements from the criteria it references.
    def handle_specific_variable_ref(reference_criteria)
      # if there are no referenced children, then it's a variable representing
      # a single data criteria, so just reference it
      if reference_criteria.children_criteria.empty?
        @children_criteria = [reference_criteria.id]
      # otherwise pull all the data criteria info from the reference
      else
        @field_values = reference_criteria.field_values
        @temporal_references = reference_criteria.temporal_references
        @subset_operators = reference_criteria.subset_operators
        @derivation_operator = reference_criteria.derivation_operator
        @definition = reference_criteria.definition
        @description = reference_criteria.description
        @status = reference_criteria.status
        @children_criteria = reference_criteria.children_criteria
      end
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

    # If there is no entry type, extract the entry type from what it references, and extract additional information for
    # specific occurrences. If there are no outbound references, print an error and mark it as variable.
    def definition_for_nil_entry
      reference = @entry.at_xpath('./*/cda:outboundRelationship/cda:criteriaReference', HQMF2::Document::NAMESPACES)
      ref_id = nil
      unless reference.nil?
        ref_id = "#{HQMF2::Utilities.attr_val(reference, 'cda:id/@extension')}_#{HQMF2::Utilities.attr_val(reference, 'cda:id/@root')}"
      end
      reference_criteria = @data_criteria_references[strip_tokens(ref_id)] unless ref_id.nil?
      if reference_criteria
        # we only want to copy the reference criteria definition, status, and code_list_id if this is this is not a grouping criteria (i.e., there are no children)
        if @children_criteria.blank?
          @definition = reference_criteria.definition
          @status = reference_criteria.status
          if @specific_occurrence
            @title = reference_criteria.title
            @description = reference_criteria.description
            @code_list_id = reference_criteria.code_list_id
          end
        else
          # if this is a grouping data criteria (has children) mark it as derived and only pull title and description from the reference criteria
          @definition = 'derived'
          if @specific_occurrence
            @title = reference_criteria.title
            @description = reference_criteria.description
          end
        end
      else
        puts "MISSING_DC_REF: #{ref_id}" unless @variable
        @definition = 'variable'
      end
    end

    # Given an entry type (which describes the criteria's purpose) return the appropriate defintino
    def extract_definition_from_entry_type(entry_type)
      case entry_type
      when 'Problem', 'Problems'
        'diagnosis'
      when 'Encounter', 'Encounters'
        'encounter'
      when 'LabResults', 'Results'
        'laboratory_test'
      when 'Procedure', 'Procedures'
        'procedure'
      when 'Demographics'
        definition_for_demographic
      when 'Derived'
        'derived'
      else
        fail "Unknown data criteria template identifier [#{entry_type}]"
      end
    end

    # Return the definition for a known subset of patient characteristics
    def definition_for_demographic
      demographic_type = attr_val('./cda:observationCriteria/cda:code/@code')
      demographic_translation = {
        '21112-8' => 'patient_characteristic_birthdate',
        '424144002' => 'patient_characteristic_age',
        '263495000' => 'patient_characteristic_gender',
        '102902016' => 'patient_characteristic_languages',
        '125680007' => 'patient_characteristic_marital_status',
        '103579009' => 'patient_characteristic_race'
      }
      if demographic_translation[demographic_type]
        demographic_translation[demographic_type]
      else
        fail "Unknown demographic identifier [#{demographic_type}]"
      end
    end
  end
end
