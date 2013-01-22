module HQMF2
  # Represents a data criteria specification
  class DataCriteria
  
    include HQMF2::Utilities
    
    attr_reader :property, :type, :status, :value, :effective_time, :section
    attr_reader :temporal_references, :subset_operators, :children_criteria 
    attr_reader :derivation_operator, :negation, :negation_code_list_id, :description
    attr_reader :field_values, :source_data_criteria, :specific_occurrence_const
    attr_reader :specific_occurrence, :is_source_data_criteria
  
    # Create a new instance based on the supplied HQMF entry
    # @param [Nokogiri::XML::Element] entry the parsed HQMF entry
    def initialize(entry)
      @entry = entry
      @status = attr_val('./*/cda:statusCode/@code')
      @description = attr_val('./*/cda:text/@value')
      extract_negation()
      extract_specific_or_source()
      @effective_time = extract_effective_time
      @temporal_references = extract_temporal_references
      @derivation_operator = extract_derivation_operator
      @field_values = extract_field_values
      @subset_operators = extract_subset_operators
      @children_criteria = extract_child_criteria
      @id_xpath = './*/cda:id/cda:item/@extension'
      @code_list_xpath = './*/cda:code'
      @value_xpath = './*/cda:value'
      
      # Try to determine what kind of data criteria we are dealing with
      # First we look for a template id and if we find one just use the definition
      # status and negation associated with that
      if !extract_type_from_template_id()
        # If no template id or not one we recognize then try to determine type from
        # the definition element
        extract_type_from_definition()
      end
      
      patch_xpaths_for_criteria_type()
    end

    def patch_xpaths_for_criteria_type  
      # Patch xpaths when necessary, HQMF data criteria are irregular in structure so
      # the same information is found in different places depending on the type of
      # criteria
      # Assumes @definition and @status are already set
      case @definition
      when 'diagnosis', 'diagnosis_family_history'
        @code_list_xpath = './cda:observationCriteria/cda:value'
      when 'risk_category_assessment', 'procedure_result', 'laboratory_test', 'diagnostic_study_result', 'functional_status_result', 'intervention_result'
        @value = extract_value
      when 'medication'
        case @status
        when 'dispensed', 'ordered'
          @code_list_xpath = './cda:supplyCriteria/cda:participation/cda:role/cda:code'
        else # active or administered
          @code_list_xpath = './cda:substanceAdministrationCriteria/cda:participation/cda:role/cda:code'
        end
      when 'patient_characteristic', 'patient_characteristic_birthdate', 'patient_characteristic_clinical_trial_participant', 'patient_characteristic_expired', 'patient_characteristic_gender', 'patient_characteristic_age', 'patient_characteristic_languages', 'patient_characteristic_marital_status', 'patient_characteristic_race'
        @value = extract_value
      when 'variable'
        @value = extract_value
      end
    end

    def extract_type_from_definition
      # See if we can find a match for the entry definition value and status.
      entry_type = attr_val('./*/cda:definition/*/cda:id/@extension')
      begin
        settings = HQMF::DataCriteria.get_settings_for_definition(entry_type, @status)
        @definition = entry_type
      rescue
        # if no exact match then try a string match just using entry definition value
        case entry_type
        when 'Problem', 'Problems'
          @definition = 'diagnosis'
        when 'Encounter', 'Encounters'
          @definition = 'encounter'
        when 'LabResults', 'Results'
          @definition = 'laboratory_test'
        when 'Procedure', 'Procedures'
          @definition = 'procedure'
        when 'Medication', 'Medications'
          @definition = 'medication'
          if !@status
            @status = 'active'
          end
        when 'RX'
          @definition = 'medication'
          if !@status
            @status = 'dispensed'
          end
        when 'Demographics'
          @definition = definition_for_demographic
        when 'Derived'
          @definition = 'derived'
        when nil
          @definition = 'variable'
        else
          raise "Unknown data criteria template identifier [#{entry_type}]"
        end
      end
    end
    
    def extract_type_from_template_id
      template_ids = @entry.xpath('./*/cda:templateId/cda:item', HQMF2::Document::NAMESPACES).collect do |template_def|
        HQMF2::Utilities.attr_val(template_def, '@root')
      end
      if template_ids.include?(HQMF::DataCriteria::SOURCE_DATA_CRITERIA_TEMPLATE_ID)
        @is_source_data_criteria = true
      end
      template_ids.each do |template_id|
        defs = HQMF::DataCriteria.definition_for_template_id(template_id)
        if defs
          @definition = defs['definition']
          @status = defs['status'].length > 0 ? defs['status'] : nil
          @negation = defs['negation']
          return true
        end
      end
      false
    end
    
    def to_s
      props = {
        :property => property,
        :type => type,
        :status => status,
        :section => section
      }
      "DataCriteria#{props.to_s}"
    end
    
    # Get the identifier of the criteria, used elsewhere within the document for referencing
    # @return [String] the identifier of this data criteria
    def id
      attr_val(@id_xpath)
    end
    
    # Get the title of the criteria, provides a human readable description
    # @return [String] the title of this data criteria
    def title
      attr_val("#{@code_list_xpath}/cda:displayName/@value") || id
    end
    
    # Get the code list OID of the criteria, used as an index to the code list database
    # @return [String] the code list identifier of this data criteria
    def code_list_id
      attr_val("#{@code_list_xpath}/@valueSet")
    end
    
    def inline_code_list
      codeSystem = attr_val("#{@code_list_xpath}/@codeSystem")
      if codeSystem
        codeSystemName = HealthDataStandards::Util::CodeSystemHelper.code_system_for(codeSystem)
      else
        codeSystemName = attr_val("#{@code_list_xpath}/@codeSystemName")
      end
      codeValue = attr_val("#{@code_list_xpath}/@code")
      if codeSystemName && codeValue
        {codeSystemName => [codeValue]}
      else
        nil
      end
    end
    
    def to_model
      mv = value ? value.to_model : nil
      met = effective_time ? effective_time.to_model : nil
      mtr = temporal_references.collect {|ref| ref.to_model}
      mso = subset_operators.collect {|opr| opr.to_model}
      field_values = {}
      @field_values.each_pair do |id, val|
        field_values[id] = val.to_model
      end
      
      HQMF::DataCriteria.new(id, title, nil, description, code_list_id, children_criteria, 
        derivation_operator, @definition, status, mv, field_values, met, inline_code_list, 
        @negation, @negation_code_list_id, mtr, mso, @specific_occurrence, 
        @specific_occurrence_const, @source_data_criteria)
    end
    
    private
    
    def extract_negation
      negation = attr_val('./*/@actionNegationInd')
      @negation = (negation=='true')
      if @negation
        @negation_code_list_id = attr_val('./*/cda:reasonCode/cda:item/@valueSet')
      else
        @negation_code_list_id = nil
      end
    end
    
    def extract_child_criteria
      @entry.xpath('./*/cda:excerpt/*/cda:id', HQMF2::Document::NAMESPACES).collect do |ref|
        Reference.new(ref).id
      end.compact
    end
    
    def extract_effective_time
      effective_time_def = @entry.at_xpath('./*/cda:effectiveTime', HQMF2::Document::NAMESPACES)
      if effective_time_def
        EffectiveTime.new(effective_time_def)
      else
        nil
      end
    end
    
    def all_subset_operators
      @entry.xpath('./*/cda:excerpt', HQMF2::Document::NAMESPACES).collect do |subset_operator|
        SubsetOperator.new(subset_operator)
      end
    end
    
    def extract_derivation_operator
      derivation_operators = all_subset_operators.select do |operator|
        ['UNION', 'XPRODUCT'].include?(operator.type)
      end
      raise "More than one derivation operator in data criteria" if derivation_operators.size>1
      derivation_operators.first ? derivation_operators.first.type : nil
    end
    
    def extract_subset_operators
      all_subset_operators.select do |operator|
        operator.type != 'UNION' && operator.type != 'XPRODUCT'
      end
    end
    
    def extract_specific_or_source
      specific_def = @entry.at_xpath('./*/cda:outboundRelationship[cda:subsetCode/@code="SPECIFIC"]', HQMF2::Document::NAMESPACES)
      source_def = @entry.at_xpath('./*/cda:outboundRelationship[cda:subsetCode/@code="SOURCE"]', HQMF2::Document::NAMESPACES)
      if specific_def
        @source_data_criteria = HQMF2::Utilities.attr_val(specific_def, './cda:observationReference/cda:id/@extension')
        @specific_occurrence_const = HQMF2::Utilities.attr_val(specific_def, './cda:localVariableName/@controlInformationRoot')
        @specific_occurrence = HQMF2::Utilities.attr_val(specific_def, './cda:localVariableName/@controlInformationExtension')
      elsif source_def
        @source_data_criteria = HQMF2::Utilities.attr_val(source_def, './cda:observationReference/cda:id/@extension')
      end
    end
    
    def extract_field_values
      fields = {}
      # extract most fields which use the same structure
      @entry.xpath('./*/cda:outboundRelationship[*/cda:code]', HQMF2::Document::NAMESPACES).each do |field|
        code = HQMF2::Utilities.attr_val(field, './*/cda:code/@code')
        code_id = HQMF::DataCriteria::VALUE_FIELDS[code]
        value = DataCriteria.parse_value(field, './*/cda:value')
        fields[code_id] = value
      end
      # special case for facility location which uses a very different structure
      @entry.xpath('./*/cda:outboundRelationship[*/cda:participation]', HQMF2::Document::NAMESPACES).each do |field|
        code = HQMF2::Utilities.attr_val(field, './*/cda:participation/cda:role/@classCode')
        code_id = HQMF::DataCriteria::VALUE_FIELDS[code]
        value = Coded.new(field.at_xpath('./*/cda:participation/cda:role/cda:code', HQMF2::Document::NAMESPACES))
        fields[code_id] = value
      end
      fields
    end
    
    def extract_temporal_references
      @entry.xpath('./*/cda:temporallyRelatedInformation', HQMF2::Document::NAMESPACES).collect do |temporal_reference|
        TemporalReference.new(temporal_reference)
      end
    end
    
    def extract_value()
      DataCriteria.parse_value(@entry, @value_xpath)
    end
    
    def self.parse_value(node, xpath)
      value = nil
      value_def = node.at_xpath(xpath, HQMF2::Document::NAMESPACES)
      if value_def
        value_type_def = value_def.at_xpath('@xsi:type', HQMF2::Document::NAMESPACES)
        if value_type_def
          value_type = value_type_def.value
          case value_type
          when 'TS'
            value = Value.new(value_def)
          when 'IVL_PQ', 'IVL_INT'
            value = Range.new(value_def)
          when 'CD'
            value = Coded.new(value_def)
          when 'ANY'
            value = AnyValue.new()
          else
            raise "Unknown value type [#{value_type}]"
          end
        end
      end
      value
    end
    
    def definition_for_demographic
      demographic_type = attr_val('./cda:observationCriteria/cda:code/@code')
      case demographic_type
      when '21112-8'
        "patient_characteristic_birthdate"
      when '424144002'
        "patient_characteristic_age"
      when '263495000'
        "patient_characteristic_gender"
      when '102902016'
        "patient_characteristic_languages"
      when '125680007'
        "patient_characteristic_marital_status"
      when '103579009'
        "patient_characteristic_race"
      else
        raise "Unknown demographic identifier [#{demographic_type}]"
      end
      
    end

  end
  
end