module HQMF2
  # Represents a data criteria specification
  class DataCriteria

  VALUESET_MAP = {"2.16.840.1.113883.10.20.28.3.7" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.8" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.9" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.10" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.11" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.12" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.13" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.14" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.15" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.16" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.1" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.17" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.18" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.19" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.20" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS']/cda:observationCriteria/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.21" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS']/cda:observationCriteria/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.22" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.23" => {valueset_path:"./*/cda:code", result_path: "./*/cda:value"},
      "2.16.840.1.113883.10.20.28.3.24" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.26" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.27" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.5 " => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.28" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.29" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.30" => {valueset_path:"./*/cda:code", result_path: "./*/cda:value"},
      "2.16.840.1.113883.10.20.28.3.31" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.33" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS' and @inversionId=true]/cda:procedureCriteria/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.34" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS']/cda:actCriteria/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.35" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.36" => {valueset_path:"./*/cda:code", result_path: "./*/cda:outboundRelationship[@typeCode='REFR']//cda:code[@code='394617004']/../cda:value"},
      "2.16.840.1.113883.10.20.28.3.37" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.39" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS']/cda:observationCriteria/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.40" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS']/cda:observationCriteria/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.41" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.42" => {valueset_path:"./*/cda:code", result_path: "./*/cda:value"},
      "2.16.840.1.113883.10.20.28.3.43" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.44" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role/cda:playingMaterial[@classCode='MMAT']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.45" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='MANU']/cda:playingManufacturedMaterial[@classCode='MMAT']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.46" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='MANU']/cda:playingEntity[@classCode='MMAT']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.47" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='MANU']/cda:playingEntity[@classCode='MMAT']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.48" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='MANU']/cda:playingManufacturedMaterial[@classCode='MMAT']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.49" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='MANU']/cda:playingMaterial[@classCode='MMAT']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.50" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='MANU']/cda:playingMaterial[@classCode='MMAT']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.51" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='MANU']/cda:playingMaterial[@classCode='MMAT']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.52" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.53" => {valueset_path:"./*/cda:code", result_path: "./*/cda:value"},
      "2.16.840.1.113883.10.20.28.3.6" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.54" => {valueset_path: nil,  result_path: nil },
      "2.16.840.1.113883.10.20.28.3.56" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.57" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.58" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.59" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.55" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.86" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.61" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.62" => {valueset_path:"./*/cda:value", result_path: "./*/cda:outboundRelationship[@typeCode='REFR']//cda:code[@code='394617004']/../cda:value"},
      "2.16.840.1.113883.10.20.28.3.63" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.64" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS' and @inversionId=true]/cda:procedureCriteria/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.65" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS' and @inversionId=true]/cda:procedureCriteria/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.66" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.67" => {valueset_path:"./*/cda:code", result_path:"./*/cda:outboundRelationship[@typeCode='REFR']//cda:code[@code='394617004']/../cda:value"},
      "2.16.840.1.113883.10.20.28.3.68" => {valueset_path:"./*/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.70" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.71" => {valueset_path:"./*/cda:participation/cda:role[@classCode='ASSIGNED']/cda:playingDevice[@classCode='DEV' and @determinerCode='KIND']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.87" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.72" => {valueset_path:"./*/cda:code", result_path: "./*/cda:value"},
      "2.16.840.1.113883.10.20.28.3.93" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.73" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='ADMM']/cda:playingMaterial[@classCode='MAT' and @determinerCode='KIND']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.74" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='ADMM']/cda:playingMaterial[@classCode='MAT' and @determinerCode='KIND']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.75" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='ADMM']/cda:playingMaterial[@classCode='MAT' and @determinerCode='KIND']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.76" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='ADMM']/cda:playingMaterial[@classCode='MAT' and @determinerCode='KIND']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.77" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='ADMM']/cda:playingMaterial[@classCode='MAT' and @determinerCode='KIND']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.78" => {valueset_path:"./*/cda:participation[@typeCode='CSM']/cda:role[@classCode='MANU']/cda:playingMaterial[@classCode='MMAT' and @determinerCode='KIND']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.79" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.80" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.81" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.82" => {valueset_path:"./*/cda:value", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.84" => {valueset_path:"./*/cda:participation[@typeCode='ORG']/cda:role[@classCode='LOCE']/cda:code", result_path: nil },
      "2.16.840.1.113883.10.20.28.3.85" => {valueset_path:"./*/cda:participation[@typeCode='ORG']/cda:role[@classCode='LOCE']/cda:code", result_path: nil }
       }

    include HQMF2::Utilities

    attr_reader :property, :type, :status, :value, :effective_time, :section
    attr_reader :temporal_references, :subset_operators, :children_criteria
    attr_reader :derivation_operator, :negation, :negation_code_list_id, :description
    attr_reader :field_values, :source_data_criteria, :specific_occurrence_const
    attr_reader :specific_occurrence, :is_source_data_criteria, :comments
    attr_reader :id, :entry, :definition

    VARIABLE_TEMPLATE = "0.1.2.3.4.5.6.7.8.9.1"
    SATISFIES_ANY_TEMPLATE = "2.16.840.1.113883.10.20.28.3.108"
    SATISFIES_ALL_TEMPLATE = "2.16.840.1.113883.10.20.28.3.109"

    CONJUNCTION_CODE_TO_DERIVATION_OP = {
      'OR' => 'UNION',
      'AND' => 'XPRODUCT'
    }

    CRITERIA_GLOB = "*[substring(name(),string-length(name())-7) = \'Criteria\']"

    # Create a new instance based on the supplied HQMF entry
    # @param [Nokogiri::XML::Element] entry the parsed HQMF entry
    def initialize(entry, data_criteria_references = nil)
      @entry = entry
      @template_ids = extract_template_ids
      @data_criteria_references = data_criteria_references
      @local_variable_name = extract_local_variable_name
      @status = attr_val('./*/cda:statusCode/@code')
      @description = attr_val("./#{CRITERIA_GLOB}/cda:text/@value") || attr_val("./#{CRITERIA_GLOB}/cda:title/@value") || attr_val("./#{CRITERIA_GLOB}/cda:id/@extension")
      extract_negation()
      extract_specific_or_source()
      @temporal_references = extract_temporal_references
      @derivation_operator = extract_derivation_operator
      @field_values = extract_field_values
      @subset_operators = extract_subset_operators
      @children_criteria = extract_child_criteria
      @id_xpath = './*/cda:id/@extension'
      @id = attr_val(@id_xpath)
      @code_list_xpath = './*/cda:code'
      @value_xpath = './*/cda:value'
      @comments = @entry.xpath("./#{CRITERIA_GLOB}/cda:text/cda:xml/cda:qdmUserComments/cda:item/text()", HQMF2::Document::NAMESPACES).map{ |v| v.content }
      @variable = extract_variable

      # Try to determine what kind of data criteria we are dealing with
      # First we look for a template id and if we find one just use the definition
      # status and negation associated with that
      if !extract_type_from_template_id()
        # If no template id or not one we recognize then try to determine type from
        # the definition element
        extract_type_from_definition()
      end

      set_code_list_path_and_result_value()

      # prefix ids that start with numerical values, and strip tokens from others
      if @id =~ /^[0-9]/ then @id = "prefix_#{strip_tokens(@id)}" else @id = strip_tokens(@id) end
      @children_criteria.map! {|cc| if cc =~ /^[0-9]/ then cc = "prefix_#{strip_tokens(cc)}" else strip_tokens(cc) end }
      @source_data_criteria = strip_tokens(@source_data_criteria) unless @source_data_criteria.nil?
      @specific_occurrence_const = strip_tokens(@specific_occurrence_const) unless @specific_occurrence_const.nil?
      set_intersection
    end


    def set_code_list_path_and_result_value

       @template_ids.each do |t|
        mapping = VALUESET_MAP[t]
        if mapping && mapping[:valueset_path] && @entry.at_xpath(mapping[:valueset_path])
          @code_list_xpath = mapping[:valueset_path]
          @value = DataCriteria.parse_value(@entry,mapping[:result_path]) if mapping[:result_path]
        end
       end

    end


    def extract_local_variable_name
      lvn = @entry.at_xpath("./cda:localVariableName")
      lvn["value"] if lvn
    end

    def extract_type_from_definition
      if @entry.at_xpath("./cda:grouperCriteria")
        if @local_variable_name && @local_variable_name.match(/qdm_/)
          @variable = true
        end
        @definition = 'derived'
        return
      end
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
          reference = @entry.at_xpath('./*/cda:outboundRelationship/cda:criteriaReference', HQMF2::Document::NAMESPACES)
          reference_criteria = @data_criteria_references[strip_tokens(HQMF2::Utilities.attr_val(reference, 'cda:id/@extension'))] if reference
          if reference_criteria
            @definition = reference_criteria.definition
            @status = reference_criteria.status
          else
            @definition = 'variable'
          end
        else
          raise "Unknown data criteria template identifier [#{entry_type}]"
        end
      end
    end

    def extract_type_from_template_id
      if @template_ids.include?(HQMF::DataCriteria::SOURCE_DATA_CRITERIA_TEMPLATE_ID)
        @is_source_data_criteria = true
      end
      found = false

      @template_ids.each do |template_id|
        defs = HQMF::DataCriteria.definition_for_template_id(template_id, 'r2')
        if defs
          @definition = defs['definition']
          @status = defs['status'].length > 0 ? defs['status'] : nil
          found ||= true
        elsif template_id == VARIABLE_TEMPLATE
          @derivation_operator = HQMF::DataCriteria::INTERSECT if @derivation_operator == HQMF::DataCriteria::XPRODUCT
          @definition ||= 'derived'
          @negation = false
          @variable = true
          found ||= true
        elsif template_id == SATISFIES_ANY_TEMPLATE
          @definition = HQMF::DataCriteria::SATISFIES_ANY
          @negation = false
          return true
        elsif template_id == SATISFIES_ALL_TEMPLATE
          @definition = HQMF::DataCriteria::SATISFIES_ALL
          @derivation_operator = HQMF::DataCriteria::INTERSECT
          @negation = false
          found ||= true
        end
      end

      found
    end

    def set_intersection
       # Need to handle grouper criteria that do not have template ids -- these will be union of and intersection criteria
      if @template_ids.empty?
        # Change the XPRODUCT to an INTERSECT otherwise leave it as a UNION
        @derivation_operator = HQMF::DataCriteria::INTERSECT if @derivation_operator == HQMF::DataCriteria::XPRODUCT
        @description ||= (@derivation_operator == HQMF::DataCriteria::INTERSECT) ? "Intersect" : "Union"
      end
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

    # TODO: Remove id method if id attribute is sufficient
    # Get the identifier of the criteria, used elsewhere within the document for referencing
    # @return [String] the identifier of this data criteria
    # def id
    #   attr_val(@id_xpath)
    # end

    # Get the title of the criteria, provides a human readable description
    # @return [String] the title of this data criteria
    def title
      dispValue = attr_val("#{@code_list_xpath}/cda:displayName/@value")
      dispValue || @description || id
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

      # Model transfers as a field
      if ['transfer_to', 'transfer_from'].include? @definition
        field_values ||= {}
        field_code_list_id = @code_list_id
        if !field_code_list_id
          field_code_list_id = attr_val("./#{CRITERIA_GLOB}/cda:outboundRelationship/#{CRITERIA_GLOB}/cda:value/@valueSet")
        end
        field_values[@definition.upcase] = HQMF::Coded.for_code_list(field_code_list_id, title)
      end

      field_values = nil if field_values.empty?

      unless @variable || @derivation_operator
        exact_desc = title.split(' ')[0...-3].join(' ')
        @description = "#{@description}: #{exact_desc}"
      end

      HQMF::DataCriteria.new(id, title, nil, description, code_list_id, children_criteria,
        derivation_operator, @definition, status, mv, field_values, met, inline_code_list,
        @negation, @negation_code_list_id, mtr, mso, @specific_occurrence,
        @specific_occurrence_const, @source_data_criteria, @comments, @variable)
    end

    # Return a new DataCriteria instance with only source data criteria attributes set
    def extract_source_data_criteria
      DataCriteria.new(@entry, @data_criteria_references).extract_as_source_data_criteria(@id, @source_data_criteria)
    end

    # Set this data criteria's specific attributes to empty/nil
    # SHOULD only be called on the source data criteria instance
    def extract_as_source_data_criteria(id, source_data_criteria)
      @field_values = {}
      @temporal_references = []
      @subset_operators = []
      @is_source_data_criteria = true
      # @specific_occurrence = nil
      # @specific_occurrence_const = nil
      @id = strip_tokens(id)
      self
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
      @entry.xpath("./*/cda:outboundRelationship[@typeCode='COMP']/cda:criteriaReference/cda:id", HQMF2::Document::NAMESPACES).collect do |ref|
        Reference.new(ref).id
      end.compact
    end


    def all_subset_operators
      @entry.xpath('./*/cda:excerpt', HQMF2::Document::NAMESPACES).collect do |subset_operator|
        SubsetOperator.new(subset_operator)
      end
    end

    def extract_derivation_operator
      codes = @entry.xpath("./*/cda:outboundRelationship[@typeCode='COMP']/cda:conjunctionCode/@code", HQMF2::Document::NAMESPACES)
      codes.inject(nil) do | d_op, code |
        raise "More than one derivation operator in data criteria" if d_op && d_op != CONJUNCTION_CODE_TO_DERIVATION_OP[code.value]
        CONJUNCTION_CODE_TO_DERIVATION_OP[code.value]
      end
    end

    def extract_subset_operators
      all_subset_operators.select do |operator|
        operator.type != 'UNION' && operator.type != 'XPRODUCT'
      end
    end

    def extract_specific_or_source
      specific_def = @entry.at_xpath('./*/cda:outboundRelationship[@typeCode="OCCR"]', HQMF2::Document::NAMESPACES)
      source_def = @entry.at_xpath('./*/cda:outboundRelationship[cda:subsetCode/@code="SOURCE"]', HQMF2::Document::NAMESPACES)
      if specific_def
        @source_data_criteria = HQMF2::Utilities.attr_val(specific_def, './cda:criteriaReference/cda:id/@extension')
        @specific_occurrence_const = HQMF2::Utilities.attr_val(specific_def, './cda:localVariableName/@controlInformationRoot')
        @specific_occurrence = HQMF2::Utilities.attr_val(specific_def, './cda:localVariableName/@controlInformationExtension')
        if !@specific_occurrence
          @specific_occurrence = "A"
          @specific_occurrence_const = @source_data_criteria.upcase
        end
      elsif source_def
        @source_data_criteria = HQMF2::Utilities.attr_val(source_def, './cda:criteriaReference/cda:id/@extension')
      end
    end

    def extract_field_values
      fields = {}
      # extract most fields which use the same structure
      @entry.xpath('./*/cda:outboundRelationship[*/cda:code]', HQMF2::Document::NAMESPACES).each do |field|
        code = HQMF2::Utilities.attr_val(field, './*/cda:code/@code')
        code_id = HQMF::DataCriteria::VALUE_FIELDS[code]
        value = DataCriteria.parse_value(field, './*/cda:value')
        fields[code_id] = value if value && code_id
      end
      # special case for facility location which uses a very different structure
      @entry.xpath('./*/cda:outboundRelationship[*/cda:participation]', HQMF2::Document::NAMESPACES).each do |field|
        code = HQMF2::Utilities.attr_val(field, './*/cda:participation/cda:role/@classCode')
        code_id = HQMF::DataCriteria::VALUE_FIELDS[code]
        value = Coded.new(field.at_xpath('./*/cda:participation/cda:role/cda:code', HQMF2::Document::NAMESPACES))
        fields[code_id] = value if value && code_id
      end

      fields.merge! HQMF2::FieldValueHelper.parse_field_values(@entry, @negation)
      # special case for fulfills operator.  assuming there is only a possibility of having one of these
      fulfils = @entry.at_xpath('./*/cda:outboundRelationship[@typeCode="FLFS"]/cda:criteriaReference', HQMF2::Document::NAMESPACES)
      fields["FLFS"] =  TypedReference.new(fulfils) if fulfils
      fields
    end

    def extract_temporal_references
      @entry.xpath('./*/cda:temporallyRelatedInformation', HQMF2::Document::NAMESPACES).collect do |temporal_reference|
        TemporalReference.new(temporal_reference)
      end
    end

    def extract_value()
      # need to look in both places for result criteria because
      #procedureCriteria does not have a value element while observationCriteria does
      DataCriteria.parse_value(@entry, "./*/cda:value") ||
      DataCriteria.parse_value(@entry, "./*/cda:outboundRelationship/cda:code[@code='394617004']/../cda:value")
    end

    def self.parse_value(node, xpath)
      value = nil
      value_def = node.at_xpath(xpath, HQMF2::Document::NAMESPACES)
      if value_def
        return AnyValue.new if value_def.at_xpath('@flavorId') == "ANY.NONNULL"
        value_type_def = value_def.at_xpath('@xsi:type', HQMF2::Document::NAMESPACES)
        if value_type_def
          value_type = value_type_def.value
          case value_type
          when 'PQ'
            value = Value.new(value_def, 'PQ', true)
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

    # Determine if this instance is a qdm variable
    def extract_variable
      variable = !(@local_variable_name =~ /.*qdm_var_/).nil? unless @local_variable_name.blank?
      variable ||= !(@id =~ /.*qdm_var_/).nil? unless @id.blank?
      variable ||= false
    end

    def extract_template_ids 
      @entry.xpath('./*/cda:templateId/cda:item', HQMF2::Document::NAMESPACES).collect do |template_def|
        HQMF2::Utilities.attr_val(template_def, '@root')
      end
    end
  end

end
