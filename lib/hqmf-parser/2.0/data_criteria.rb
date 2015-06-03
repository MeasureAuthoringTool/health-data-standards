module HQMF2
  # Represents a data criteria specification
  class DataCriteria

    VALUESET_MAP = {"2.16.840.1.113883.10.20.28.3.7" => {valueset_path:"./*/cda:value", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.8" => {valueset_path:"./*/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.9" => {valueset_path:"./*/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.10" => {valueset_path:"./*/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.11" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.12" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.13" => {valueset_path:"./*/cda:participation[@typeCode='DEV']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.14" => {valueset_path:"./*/cda:participation[@typeCode='PRD']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.15" => {valueset_path:"./*/cda:participation[@typeCode='DEV']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.16" => {valueset_path:"./*/cda:participation[@typeCode='DEV']/cda:role[@classCode='MANU']/cda:playingDevice[@classCode='DEV']/cda:code", result_path: nil },
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
                    "2.16.840.1.113883.10.20.28.3.5" => {valueset_path:"./*/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.28" => {valueset_path:"./*/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.29" => {valueset_path:"./*/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.30" => {valueset_path:"./*/cda:code", result_path: "./*/cda:value"},
                    "2.16.840.1.113883.10.20.28.3.31" => {valueset_path:"./*/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.33" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS' and @inversionInd='true']/cda:procedureCriteria/cda:code", result_path: nil },
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
                    "2.16.840.1.113883.10.20.28.3.64" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS' and @inversionInd='true']/cda:procedureCriteria/cda:code", result_path: nil },
                    "2.16.840.1.113883.10.20.28.3.65" => {valueset_path:"./*/cda:outboundRelationship[@typeCode='CAUS' and @inversionInd='true']/cda:procedureCriteria/cda:code", result_path: nil },
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
    attr_reader :id, :entry, :definition, :variable, :local_variable_name

    VARIABLE_TEMPLATE = "0.1.2.3.4.5.6.7.8.9.1"
    SATISFIES_ANY_TEMPLATE = "2.16.840.1.113883.10.20.28.3.108"
    SATISFIES_ALL_TEMPLATE = "2.16.840.1.113883.10.20.28.3.109"

    CONJUNCTION_CODE_TO_DERIVATION_OP = {
      'OR' => 'UNION',
      'AND' => 'XPRODUCT'
    }

    CRITERIA_GLOB = "*[substring(name(),string-length(name())-7) = \'Criteria\']"

    # TODO: Clean up debug print statements!

    # Create a new instance based on the supplied HQMF entry
    # @param [Nokogiri::XML::Element] entry the parsed HQMF entry
    def initialize(entry, data_criteria_references = nil, occurrences_map = nil)
      @entry = entry
      @template_ids = extract_template_ids
      @data_criteria_references = data_criteria_references
      @occurrences_map = occurrences_map
      @local_variable_name = extract_local_variable_name
      @status = attr_val('./*/cda:statusCode/@code')
      @description = attr_val("./#{CRITERIA_GLOB}/cda:text/@value") || attr_val("./#{CRITERIA_GLOB}/cda:title/@value") || attr_val("./#{CRITERIA_GLOB}/cda:id/@extension")
      @id_xpath = './*/cda:id/@extension'
      @id = attr_val(@id_xpath)
      handle_variable_subsets
      @code_list_xpath = './*/cda:code'
      @value_xpath = './*/cda:value'
      extract_negation()
      extract_specific_or_source()
      @temporal_references = extract_temporal_references
      @derivation_operator = extract_derivation_operator
      @field_values = extract_field_values
      @subset_operators = extract_subset_operators
      @children_criteria = extract_child_criteria
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
      @id = strip_tokens @id
      @children_criteria.map! { |cc| strip_tokens cc }
      @source_data_criteria = strip_tokens(@source_data_criteria) unless @source_data_criteria.nil?
      @specific_occurrence_const = strip_tokens(@specific_occurrence_const) unless @specific_occurrence_const.nil?
      set_intersection
      handle_specific_variables
    end

    def handle_variable_subsets
      isGrouper = @entry.at_xpath("./cda:grouperCriteria")
      references = @entry.xpath('./*/cda:outboundRelationship/cda:criteriaReference', HQMF2::Document::NAMESPACES)
      reference = references.first
      # TODO: Figure out when exactly to handle variable references as verbose
      if reference && references.length==1
        ref_id = strip_tokens(HQMF2::Utilities.attr_val(reference, 'cda:id/@extension'))
        verbose_ref_id = strip_tokens("#{HQMF2::Utilities.attr_val(reference, 'cda:id/@extension')}_#{HQMF2::Utilities.attr_val(reference, 'cda:id/@root')}")
        reference_criteria = @data_criteria_references[ref_id] if ref_id
        reference_criteria = @data_criteria_references[verbose_ref_id] if verbose_ref_id && !reference_criteria
        unless reference_criteria
          puts "MISSING_DC_REF: #{ref_id} & #{verbose_ref_id}"
        end
      end
      if isGrouper && reference_criteria.try(:variable)
        idExtension_xpath = './*/cda:id/@extension'
        idRoot_xpath = './*/cda:id/@root'
        return if !(attr_val(idExtension_xpath) =~ /^occ[A-Z]of_qdm_var_/).nil?
        @id = "#{attr_val(idExtension_xpath)}_#{attr_val(idRoot_xpath)}"
        @verbose_reference = true
        # puts "Updated grouper: #{@id} #{@verbose_reference}"
      end
    end

    def set_code_list_path_and_result_value

      if @template_ids.empty? && @specific_occurrence
        template = @entry.document.at_xpath("//cda:id[@root='#{@source_data_criteria_root}' and @extension='#{@source_data_criteria}']/../cda:templateId/cda:item/@root")
        if template
          mapping = VALUESET_MAP[template.to_s]
          @value = DataCriteria.parse_value(@entry,mapping[:result_path]) if mapping && mapping[:result_path]
        end
      else
        @template_ids.each do |t|
          mapping = VALUESET_MAP[t]
          if mapping && mapping[:valueset_path] && @entry.at_xpath(mapping[:valueset_path])
            @code_list_xpath = mapping[:valueset_path]
            @value = DataCriteria.parse_value(@entry,mapping[:result_path]) if mapping[:result_path]
          end
        end
      end
    end


    def extract_local_variable_name
      lvn = @entry.at_xpath("./cda:localVariableName")
      lvn["value"] if lvn
    end

    def extract_type_from_definition
      # if we have a specific occurrence of a variable, pull attributes from the reference
      if @variable && @specific_occurrence
        reference = @entry.at_xpath('./*/cda:outboundRelationship/cda:criteriaReference', HQMF2::Document::NAMESPACES)
        ref_id = strip_tokens(HQMF2::Utilities.attr_val(reference, 'cda:id/@extension')) if reference
        verbose_ref_id = strip_tokens("#{HQMF2::Utilities.attr_val(reference, 'cda:id/@extension')}_#{HQMF2::Utilities.attr_val(reference, 'cda:id/@root')}") if reference
        reference_criteria = @data_criteria_references[ref_id] if ref_id
        reference_criteria = @data_criteria_references[verbose_ref_id] if verbose_ref_id && !reference_criteria
        # if the reference is derived, pull from the original variable
        if reference_criteria && reference_criteria.definition == 'derived'
          reference_criteria = @data_criteria_references["GROUP_#{ref_id}"]
          reference_criteria = @data_criteria_references["GROUP_#{verbose_ref_id}"] if verbose_ref_id && !reference_criteria
        end
        if reference_criteria
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
            @status = reference_criteria.status
            @children_criteria = reference_criteria.children_criteria
          end
        end
      end

      if @entry.at_xpath("./cda:grouperCriteria")
        @definition ||= 'derived'
        return
      end
      # See if we can find a match for the entry definition value and status.
      entry_type = attr_val('./*/cda:definition/*/cda:id/@extension')
      begin
        # settings is required to trigger exceptions, which set the definition
        HQMF::DataCriteria.get_settings_for_definition(entry_type, @status)
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
          ref_id = HQMF2::Utilities.attr_val(reference, 'cda:id/@extension') if reference
          verbose_ref_id = "#{HQMF2::Utilities.attr_val(reference, 'cda:id/@extension')}_#{HQMF2::Utilities.attr_val(reference, 'cda:id/@root')}" if reference
          reference_criteria = @data_criteria_references[strip_tokens(ref_id)] if reference
          reference_criteria = @data_criteria_references[strip_tokens(verbose_ref_id)] if verbose_ref_id && !reference_criteria
          if reference_criteria
            @definition = reference_criteria.definition
            @status = reference_criteria.status
          else
            puts "MISSING_DC_REF: #{ref_id} & #{verbose_ref_id}" unless @variable
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
      @title || dispValue || @description || id # allow defined titles to take precedence
    end

    # Get the code list OID of the criteria, used as an index to the code list database
    # @return [String] the code list identifier of this data criteria
    def code_list_id
      @code_list_id || attr_val("#{@code_list_xpath}/@valueSet")
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
      @code_list_id ||= code_list_id

      # Model transfers as a field
      if ['transfer_to', 'transfer_from'].include? @definition
        field_values ||= {}
        field_code_list_id = @code_list_id
        @code_list_id = nil
        if !field_code_list_id
          field_code_list_id = attr_val("./#{CRITERIA_GLOB}/cda:outboundRelationship/#{CRITERIA_GLOB}/cda:value/@valueSet")
        end
        field_values[@definition.upcase] = HQMF::Coded.for_code_list(field_code_list_id, title)
      end

      field_values = nil if field_values.empty?

      unless @variable || @derivation_operator
        # drop "* Value Set" from titles
        exact_desc = title.split(' ')[0...-3].join(' ')
        # don't drop anything for patient characterstic titles
        exact_desc = title if @definition.start_with?("patient_characteristic") && !title.end_with?("Value Set")
        @description = "#{@description}: #{exact_desc}"
      end

      # prevent json model generation of empty children and comments
      cc = !children_criteria.blank? ? children_criteria : nil
      comments = !@comments.blank? ? @comments : nil

      HQMF::DataCriteria.new(id, title, nil, description, @code_list_id, cc,
                             derivation_operator, @definition, status, mv, field_values, met, inline_code_list,
                             @negation, @negation_code_list_id, mtr, mso, @specific_occurrence,
                             @specific_occurrence_const, @source_data_criteria, comments, @variable)
    end

    # Return a new DataCriteria instance with only source data criteria attributes set
    def extract_source_data_criteria
      DataCriteria.new(@entry, @data_criteria_references, @occurrences_map).extract_as_source_data_criteria(@id, @source_data_criteria)
    end

    # Return a new DataCriteria instance with only grouper attributes set
    def extract_variable_grouper
      return unless @variable
      @variable = false
      @id = "GROUP_#{@id}"
      @specific_occurrence = nil
      @specific_occurrence_const = nil
      DataCriteria.new(@entry, @data_criteria_references, @occurrences_map).extract_as_grouper
    end

    # Set this data criteria's attributes for extraction as a source data criteria
    # SHOULD only be called on the source data criteria instance
    def extract_as_source_data_criteria(id, source_data_criteria)
      @field_values = {}
      @temporal_references = []
      @subset_operators = []
      @is_source_data_criteria = true
      @id = strip_tokens(id)
      # unset variable for source data criteria to prevent duplicates
      if @id.start_with? "GROUP_"
        @title = "GROUP_#{title}"
        @variable = false
      end
      self
    end

    # Set this data criteria's attributes for extraction as a grouper data criteria
    # for encapsulating a variable data criteria
    # SHOULD only be called on the variable data criteria instance
    def extract_as_grouper
      @field_values = {}
      @temporal_references = []
      @subset_operators = []
      @derivation_operator = HQMF::DataCriteria::UNION
      @definition = 'derived'
      @status = nil
      @children_criteria = ["GROUP_#{@id}"]
      @source_data_criteria = @id
      self
    end

    # Patch this data criteria's title and description using id/source data criteria
    def patch_descriptions(data_criteria_references)
      patch_code_list_id(data_criteria_references)
      patch_variable_name
      patch_variable_subsets
      patch_variable_data_criteria
      return unless title.include?("_") || title.include?("-")
      if @specific_occurrence && !@id.include?("Occurrence")
        # This hack is for finding the correct source data criteria for resolving
        # calculation issues with TIMEDIFF and specific occurrence references
        ref_id = @source_data_criteria || @id
        ref_id = strip_tokens "Occurrence#{@specific_occurrence}_#{ref_id}" unless ref_id.start_with?("Occurrence")
        reference = data_criteria_references[ref_id] if !ref_id.blank?

        # if the reference is a specific occurrence
        if reference && reference.specific_occurrence && reference.id.start_with?("Occurrence")
          # just reference the root data criteria that it is an occurrence of
          ref_id = reference.id.gsub(/Occurrence[A-Z]_/,'')
          reference = data_criteria_references[ref_id] if !ref_id.blank?
        end

        @title = reference.title if reference
        @description = reference.description if reference
        @source_data_criteria = reference.id if reference
      else
        ref_id = strip_tokens @source_data_criteria || @id
        reference = data_criteria_references[ref_id] if !ref_id.blank?

        # if the reference is a specific occurrence
        if reference && reference.specific_occurrence && reference.id.start_with?("Occurrence")
          # just reference the root data criteria that it is an occurrence of
          ref_id = reference.id.gsub(/Occurrence[A-Z]_/,'')
          reference = data_criteria_references[ref_id] if !ref_id.blank?
        end

        @title = reference.title if reference
        @description = reference.description if reference
      end
      # FIXME: Back out fix for EP141 to resolve EH109 calculations
      # patch_specific_occurrences(data_criteria_references)
    end

    # Patch specific occurrence code_list_id values using source_data_criteria
    def patch_code_list_id(data_criteria_references)
      return unless @specific_occurrence
      reference = data_criteria_references[(strip_tokens @source_data_criteria)]
      @code_list_id = reference.code_list_id if reference
    end

    # Do the best we can with the variable name; currently, the actual name is not available in the HQMF
    def patch_variable_name
      @description = attr_val("./#{CRITERIA_GLOB}/cda:id/@extension") if @variable
    end

    # Patch variable flag and children_criteria for variables with subset ops
    def patch_variable_subsets
      if @verbose_reference
        @variable = true
        @children_criteria.map! { |cc|
          if !cc.start_with?("GROUP_") && (cc =~ /.*qdm_var_/)
            "GROUP_#{cc}"
          else
            cc
          end
        }
        @derivation_operator = "UNION"
        # puts "Patched #{@id}: #{@children_criteria}, #{@variable}, #{@derivation_operator}"
      end
    end

    # Patch SDC variables that are single data criteria by embedding the grouper
    def patch_variable_data_criteria
      return unless @variable && @is_source_data_criteria && !@derivation_operator
      @derivation_operator = HQMF::DataCriteria::UNION
      @definition = 'derived'
      @status = nil
      @children_criteria = ["GROUP_#{@id}"]
    end

    def patch_specific_occurrences(data_criteria_references)
      # only consider non-variable specific occurrences
      return unless @specific_occurrence && !@variable && !@id.start_with?("GROUP_")
      reference = data_criteria_references[(strip_tokens @source_data_criteria)]
      if reference && !reference.specific_occurrence && @specific_occurrence
        # puts "Patching #{@id} from #{@source_data_criteria} to #{@id}."
        @source_data_criteria = @id
      end
    end

    # Helper method called by specific occurrence handler to set ids
    def patch_sdc_clone(id, sdc, s_occr, s_occr_const)
      @id = id if id
      @source_data_criteria = sdc if sdc
      @specific_occurrence = s_occr if s_occr
      @specific_occurrence_const = s_occr_const if s_occr_const
    end

    private

    def extract_negation
      negation = attr_val('./*/@actionNegationInd')
      @negation = (negation=='true')
      if @negation
        res =  @entry.at_xpath('./*/cda:outboundRelationship/*/cda:code[@code="410666004"]/../cda:value/@valueSet', HQMF2::Document::NAMESPACES)
        @negation_code_list_id =  res.value if res
      else
        @negation_code_list_id = nil
      end
    end

    def extract_child_criteria
      @entry.xpath("./*/cda:outboundRelationship[@typeCode='COMP']/cda:criteriaReference/cda:id", HQMF2::Document::NAMESPACES).collect do |ref|
        child_ref = Reference.new(ref)
        unless @data_criteria_references.keys.include?(strip_tokens child_ref.id)
          # puts "Updated CC: #{child_ref.id}"
          child_ref.update_verbose(true)
          puts "ERROR\t Could not find verbose CC: #{child_ref.id}" unless @data_criteria_references.keys.include?(strip_tokens child_ref.id)
        end
        child_ref.id
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
        @source_data_criteria_root = HQMF2::Utilities.attr_val(specific_def, './cda:criteriaReference/cda:id/@root')
        @specific_occurrence_const = HQMF2::Utilities.attr_val(specific_def, './cda:localVariableName/@controlInformationRoot')
        @specific_occurrence = HQMF2::Utilities.attr_val(specific_def, './cda:localVariableName/@controlInformationExtension')

        # FIXME: Remove debug statements after cleaning up occurrence handling
        # build regex for extracting alpha-index of specific occurrences
        isVariable = extract_variable
        occurrenceIdRegex = isVariable ? 'occ[A-Z]of_' : 'Occurrence[A-Z]_'
        occurrenceLVNRegex = isVariable ? 'occ[A-Z]of_' : 'Occurrence[A-Z]of'
        occurrenceIdentifier = ""
        occIndex = isVariable ? 3 : 10
        strippedSDC = strip_tokens @source_data_criteria
        strippedId = strip_tokens @id
        strippedLVN = strip_tokens @local_variable_name

        # TODO: What should happen is neither @id or @lvn has occurrence label?
        # puts "Checking #{"#{occurrenceIdRegex}#{strippedSDC}"} against #{strippedId}"
        # puts "Checking #{"#{occurrenceLVNRegex}#{strippedSDC}"} against #{strippedLVN}"
        if !(strippedId =~ /^#{occurrenceIdRegex}#{strippedSDC}/).nil?
          occurrenceIdentifier = strippedId[occIndex]
        elsif !(strippedLVN =~ /^#{occurrenceLVNRegex}#{strippedSDC}/).nil?
          occurrenceIdentifier = strippedLVN[occIndex]
        end

        # TODO: Handle specific occurrences of variables that don't self-reference?
        if occurrenceIdentifier.blank? && isVariable
          if !(strippedId =~ /^#{occurrenceIdRegex}qdm_var_/).nil?
            occurrenceIdentifier = strippedId[occIndex]
          elsif !(strippedLVN =~ /^#{occurrenceLVNRegex}qdm_var/).nil?
            occurrenceIdentifier = strippedLVN[occIndex]
          end
        end

        # Handle correct specific occurrence references
        if occurrenceIdentifier.blank? && !(strippedId =~ /^#{strippedSDC}/).nil?
          occurrenceIdentifier = strippedId[occIndex]
        end

        if !occurrenceIdentifier.blank?
          # if it doesn't exist, add extracted occurrence to the map
          # puts "\tSetting #{@source_data_criteria}-#{@source_data_criteria_root} to #{occurrenceIdentifier}"
          @occurrences_map[@source_data_criteria] ||= {}
          @occurrences_map[@source_data_criteria][@source_data_criteria_root] ||= occurrenceIdentifier
          @specific_occurrence ||= occurrenceIdentifier
          @specific_occurrence_const = "#{@source_data_criteria}".upcase
        else
          # create variable occurrences that do not already exist
          if isVariable
            # puts "\tSetting #{@source_data_criteria}-#{@source_data_criteria_root} to #{occurrenceIdentifier}"
            @occurrences_map[@source_data_criteria] ||= {}
            @occurrences_map[@source_data_criteria][@source_data_criteria_root] ||= occurrenceIdentifier
          end
          occurrence = @occurrences_map.try(:[], @source_data_criteria).try(:[], @source_data_criteria_root)
          raise "Could not find occurrence mapping for #{@source_data_criteria}, #{@source_data_criteria_root}" unless occurrence
          # puts "\tUsing #{occurrence} for #{@id}"
          @specific_occurrence ||= occurrence
        end

        @specific_occurrence = "A" unless @specific_occurrence
        @specific_occurrence_const = @source_data_criteria.upcase unless @specific_occurrence_const

        if @verbose_reference
          unless @data_criteria_references.keys.include?(strip_tokens @source_data_criteria)
            # puts "Updated SDC: #{@source_data_criteria}"
            @source_data_criteria = "#{@source_data_criteria}_#{@source_data_criteria_root}"
            @specific_occurrence_const = @source_data_criteria.upcase
            puts "ERROR\t Could not find verbose SDC: #{@source_data_criteria}" unless @data_criteria_references.keys.include?(strip_tokens @source_data_criteria)
          end
        end
      elsif source_def
        @source_data_criteria = HQMF2::Utilities.attr_val(source_def, './cda:criteriaReference/cda:id/@extension')
      end
    end

    # TODO: Why are specific occurrences of variables not building children?
    def handle_specific_variables
      if @definition == 'derived' && @children_criteria.empty?
        # puts "Fixing SO grouper empty children for #{@id} with #{@source_data_criteria}"
        @children_criteria << @source_data_criteria
      end
    end

    def extract_field_values
      fields = {}
      # extract most fields which use the same structure
      @entry.xpath('./*/cda:outboundRelationship[*/cda:code]', HQMF2::Document::NAMESPACES).each do |field|
        code = HQMF2::Utilities.attr_val(field, './*/cda:code/@code')
        code_id = HQMF::DataCriteria::VALUE_FIELDS[code]
        unless @negation && code_id == "REASON"
          value = DataCriteria.parse_value(field, './*/cda:value')
          fields[code_id] = value if value && code_id
        end
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
      if fulfils
        # grab the child element if we don't have a reference
        fields["FLFS"] =  TypedReference.new(fulfils)
      end
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
