module HQMF2
  # Represents a data criteria specification
  class DataCriteria
    include HQMF2::Utilities, HQMF2::DataCriteriaTypeAndDefinitionExtraction, HQMF2::DataCriteriaPostProcessing

    attr_accessor :id
    attr_accessor :original_id
    attr_reader :property, :type, :status, :value, :effective_time, :section
    attr_reader :temporal_references, :subset_operators, :children_criteria
    attr_reader :derivation_operator, :negation, :negation_code_list_id, :description
    attr_reader :field_values, :source_data_criteria, :specific_occurrence_const
    attr_reader :specific_occurrence, :comments, :is_derived_specific_occurrence_variable
    attr_reader :entry, :definition, :variable, :local_variable_name

    CRITERIA_GLOB = "*[substring(name(),string-length(name())-7) = \'Criteria\']"

    # Create a new instance based on the supplied HQMF entry
    # @param [Nokogiri::XML::Element] entry the parsed HQMF entry
    def initialize(entry, data_criteria_references = {}, occurrences_map = {})
      @entry = entry
      @data_criteria_references = data_criteria_references
      @occurrences_map = occurrences_map
      basic_setup
      @variable = DataCriteriaMethods.extract_variable(@local_variable_name, @id)
      @field_values = DataCriteriaMethods.extract_field_values(@entry, @negation)
      @description = extract_description
      obtain_specific_and_source = SpecificOccurrenceAndSource.new(@entry, @id, @local_variable_name,
                                                                   @data_criteria_references, @occurrences_map)
      # Pulling these 5 variables out via destructing
      @source_data_criteria,
        @source_data_criteria_root,
        @source_data_criteria_extension,
        @specific_occurrence,
        @specific_occurrence_const = obtain_specific_and_source.extract_specific_occurrences_and_source_data_criteria
      extract_definition_from_template_or_type
      post_processing
    end

    def to_s
      props = {
        property: property,
        type: type,
        status: status,
        section: section
      }
      "DataCriteria#{props}"
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
      disp_value = attr_val("#{@code_list_xpath}/cda:displayName/@value")
      @title || disp_value || @description || id # allow defined titles to take precedence
    end

    # Get the code list OID of the criteria, used as an index to the code list database
    # @return [String] the code list identifier of this data criteria
    def code_list_id
      @code_list_id || attr_val("#{@code_list_xpath}/@valueSet")
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      mv = value.try(:to_model)
      met = effective_time.try(:to_model)
      mtr = temporal_references.collect(&:to_model)
      mso = subset_operators.collect(&:to_model)
      field_values = retrieve_field_values_model_for_model

      retrieve_title_and_description_for_model unless @variable || @derivation_operator

      @code_list_id = nil if @derivation_operator

      # prevent json model generation of empty children and comments
      cc = children_criteria.present? ? children_criteria : nil
      comments = @comments.present? ? @comments : nil

      HQMF::DataCriteria.new(id, title, nil, description, @code_list_id, cc, derivation_operator, @definition, status,
                             mv, field_values, met, retrieve_code_system_for_model, @negation, @negation_code_list_id,
                             mtr, mso, @specific_occurrence, @specific_occurrence_const, @source_data_criteria,
                             comments, @variable)
    end

    # Return a new DataCriteria instance with only grouper attributes set.
    # A grouper criteria allows multiple data criteria events to be contained in a single
    # logical set (a union or intersection of these multiple events - i.e. A during (B or C or D)).
    # Grouper criteria also provide a way to combine multiple criteria that reference a specific
    # occurrence of an event.
    def extract_variable_grouper
      return unless @variable
      @variable = false
      @id = "GROUP_#{@id}"
      if @children_criteria.length == 1 && @children_criteria[0] =~ /GROUP_/
        reference_criteria = @data_criteria_references[@children_criteria.first]
        return if reference_criteria.nil?
        duplicate_child_info(reference_criteria)
        @definition = reference_criteria.definition
        @status = reference_criteria.status
        @children_criteria = []
      end
      @specific_occurrence = nil
      @specific_occurrence_const = nil
      # set the source data criteria id to the id for variables
      @source_data_criteria = @id
      DataCriteria.new(@entry, @data_criteria_references, @occurrences_map).extract_as_grouper
    end

    # Extract this data criteria as a grouper data criteria
    # SHOULD only be called on a variable data criteria instance
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

    # Handle elements that are marked as variable groupers that should not be turned into a "holding element"
    # (defined as a data criteria that encapsulates the calculation material for other data criteria elements,
    # where the other data criteria elements reference the holding element as a child element)
    def handle_derived_specific_occurrence_variable
      # If the first child is all the exists, and it has been marked as a "group" element, switch this over to map to
      # the new element.
      if !@data_criteria_references["GROUP_#{@children_criteria.first}"].nil? && @children_criteria.length == 1
        @children_criteria[0] = "GROUP_#{@children_criteria.first}"
      # If the group element is not found, extract the information from the child and force it into the variable.
      elsif @children_criteria.length == 1 && @children_criteria.first.present?
        reference_criteria = @data_criteria_references[@children_criteria.first]
        return if reference_criteria.nil?
        duplicate_child_info(reference_criteria)
        @children_criteria = reference_criteria.children_criteria
      end
    end

    # clone method. This is needed because we need to extract a new source data criteria for variables
    # typically "cloning" is done by re-parsing the xml entry, however with post processing that does
    # not give us the correct SDC data when we are trying to recreate since we are looping back through
    # the same data criteria before it has finished processing: See: DocUtilities.extract_source_data_criteria
    def clone
      other = DataCriteria.new(@entry, @data_criteria_references, @occurrences_map)
      other.instance_variable_set(:@id, @id)
      other.instance_variable_set(:@original_id, @original_id)
      other.instance_variable_set(:@property, @property)
      other.instance_variable_set(:@type, @type)
      other.instance_variable_set(:@status, @status)
      other.instance_variable_set(:@code_list_id, @code_list_id)
      other.instance_variable_set(:@value, @value)
      other.instance_variable_set(:@effective_time, @effective_time)
      other.instance_variable_set(:@section, @section)
      other.instance_variable_set(:@temporal_references, @temporal_references)
      other.instance_variable_set(:@subset_operators, @subset_operators)
      other.instance_variable_set(:@children_criteria, @children_criteria)
      other.instance_variable_set(:@derivation_operator, @derivation_operator)
      other.instance_variable_set(:@negation, @negation)
      other.instance_variable_set(:@negation_code_list_id, @negation_code_list_id)
      other.instance_variable_set(:@description, @description)
      other.instance_variable_set(:@field_values, @field_values)
      other.instance_variable_set(:@source_data_criteria, @source_data_criteria)
      other.instance_variable_set(:@specific_occurrence_const, @specific_occurrence_const)
      other.instance_variable_set(:@specific_occurrence, @specific_occurrence)
      other.instance_variable_set(:@comments, @comments)
      other.instance_variable_set(:@is_derived_specific_occurrence_variable, @is_derived_specific_occurrence_variable)
      other.instance_variable_set(:@entry, @entry)
      other.instance_variable_set(:@definition, @definition)
      other.instance_variable_set(:@variable, @variable)
      other.instance_variable_set(:@local_variable_name, @local_variable_name)
      other
    end

    private

    # Handles elments that can be extracted directly from the xml. Utilises the "BaseExtractions" class.
    def basic_setup
      @status = attr_val('./*/cda:statusCode/@code')
      @id_xpath = './*/cda:id/@extension'
      @id = "#{attr_val('./*/cda:id/@extension')}_#{attr_val('./*/cda:id/@root')}"
      @comments = @entry.xpath("./#{CRITERIA_GLOB}/cda:text/cda:xml/cda:qdmUserComments/cda:item/text()",
                               HQMF2::Document::NAMESPACES).map(&:content)
      @code_list_xpath = './*/cda:code'
      @value_xpath = './*/cda:value'
      @is_derived_specific_occurrence_variable = false
      simple_extractions = DataCriteriaBaseExtractions.new(@entry)
      @template_ids = simple_extractions.extract_template_ids
      @local_variable_name = simple_extractions.extract_local_variable_name
      @temporal_references = simple_extractions.extract_temporal_references
      @derivation_operator = simple_extractions.extract_derivation_operator
      @children_criteria = simple_extractions.extract_child_criteria
      @subset_operators = simple_extractions.extract_subset_operators
      @negation, @negation_code_list_id = simple_extractions.extract_negation
    end

    # Extract the description (with some special handling if this is a variable). The MAT has added an encoded
    # form of the variable name in the localVariableName field which is used if available. If not, fall back
    # to the extension.
    def extract_description
      if @variable
        encoded_name = attr_val('./cda:localVariableName/@value')
        encoded_name = DataCriteriaMethods.extract_description_for_variable(encoded_name) if encoded_name
        return encoded_name if encoded_name.present?
        attr_val("./#{CRITERIA_GLOB}/cda:id/@extension")
      else
        attr_val("./#{CRITERIA_GLOB}/cda:text/@value") ||
          attr_val("./#{CRITERIA_GLOB}/cda:title/@value") ||
          attr_val("./#{CRITERIA_GLOB}/cda:id/@extension")
      end
    end

    # Extract the code system from the xml taht the document should use
    def retrieve_code_system_for_model
      code_system = attr_val("#{@code_list_xpath}/@codeSystem")
      if code_system
        code_system_name = HealthDataStandards::Util::CodeSystemHelper.code_system_for(code_system)
      else
        code_system_name = attr_val("#{@code_list_xpath}/@codeSystemName")
      end
      code_value = attr_val("#{@code_list_xpath}/@code")
      { code_system_name => [code_value] } if code_system_name && code_value
    end

    # Duplicates information from a child element to this data criteria if none exits.
    # If the duplication requires that come values should be overwritten, do so only in the function calling this.
    def duplicate_child_info(child_ref)
      @title ||= child_ref.title
      @type ||= child_ref.subset_operators
      @definition ||= child_ref.definition
      @status ||= child_ref.status
      @code_list_id ||= child_ref.code_list_id
      @temporal_references = child_ref.temporal_references if @temporal_references.empty?
      @subset_operators ||= child_ref.subset_operators
      @variable ||= child_ref.variable
      @value ||= child_ref.value
    end

    # Generate the models of the field values
    def retrieve_field_values_model_for_model
      field_values = {}
      @field_values.each_pair do |id, val|
        field_values[id] = val.to_model
      end
      @code_list_id ||= code_list_id

      # Model transfers as a field
      if %w(transfer_to transfer_from).include? @definition
        field_code_list_id = @code_list_id
        @code_list_id = nil
        unless field_code_list_id
          field_code_list_id = attr_val("./#{CRITERIA_GLOB}/cda:outboundRelationship/#{CRITERIA_GLOB}/cda:value/@valueSet")
        end
        field_values[@definition.upcase] = HQMF::Coded.for_code_list(field_code_list_id, title)
      end

      return field_values unless field_values.empty?
    end

    # Generate the title and description used when producing the model
    def retrieve_title_and_description_for_model
      # drop "* Value Set" from titles
      exact_desc = title.split(' ')[0...-3].join(' ')
      # don't drop anything for patient characterstic titles
      exact_desc = title if @definition.start_with?('patient_characteristic') && !title.end_with?('Value Set')

      # remove * Value Set from title
      title_match = title.match(/(.*) \w+ [Vv]alue [Ss]et/)
      @title = title_match[1] if title_match && title_match.length > 1

      @description = "#{@description}: #{exact_desc}"
    end
  end

  # Holds methods not tied to the data criteria's instance variables
  class DataCriteriaMethods
    #  Given an entry, and whether or not it's negated, extract out the proper field values for the data criteria.
    def self.extract_field_values(entry, negation)
      fields = {}
      # extract most fields which use the same structure
      entry.xpath('./*/cda:outboundRelationship[*/cda:code]', HQMF2::Document::NAMESPACES).each do |field|
        code = HQMF2::Utilities.attr_val(field, './*/cda:code/@code')
        code_id = HQMF::DataCriteria::VALUE_FIELDS[code]
        # No need to run if there is no code id
        next if (negation && code_id == 'REASON') || code_id.nil?
        value = DataCriteriaMethods.parse_value(field, './*/cda:value')
        value ||= DataCriteriaMethods.parse_value(field, './*/cda:effectiveTime')
        fields[code_id] = value
      end
      # special case for facility location which uses a very different structure
      entry.xpath('./*/cda:outboundRelationship[*/cda:participation]', HQMF2::Document::NAMESPACES).each do |field|
        code = HQMF2::Utilities.attr_val(field, './*/cda:participation/cda:role/@classCode')
        code_id = HQMF::DataCriteria::VALUE_FIELDS[code]
        next if code_id.nil?
        value = Coded.new(field.at_xpath('./*/cda:participation/cda:role/cda:code', HQMF2::Document::NAMESPACES))
        fields[code_id] = value
      end

      fields.merge! HQMF2::FieldValueHelper.parse_field_values(entry)
      # special case for fulfills operator.  assuming there is only a possibility of having one of these
      fulfills = entry.at_xpath('./*/cda:outboundRelationship[@typeCode="FLFS"]/cda:criteriaReference',
                                HQMF2::Document::NAMESPACES)
      # grab the child element if we don't have a reference
      fields['FLFS'] = TypedReference.new(fulfills) if fulfills
      fields
    end

    # Use the new MAT feature to extract the human generated (or computer generated) variable names from the xml.
    def self.extract_description_for_variable(encoded_name)
      if encoded_name.match(/^qdm_var_/)
        # Strip out initial qdm_var_ string, trailing _*, and possible occurrence reference
        encoded_name.gsub!(/^qdm_var_|/, '')
        encoded_name.gsub!(/Occurrence[A-Z]of/, '')
        # This code needs to handle measures created before the MAT added variable name hints; for those, don't strip
        # the final identifier
        unless encoded_name.match(/^(SATISFIES ALL|SATISFIES ANY|UNION|INTERSECTION)/)
          encoded_name.gsub!(/_[^_]+$/, '')
        end
        encoded_name
      elsif encoded_name.match(/^localVar_/)
        encoded_name.gsub!(/^localVar_/, '')
        encoded_name
      end
    end

    # Parses the value for a given xpath
    def self.parse_value(node, xpath)
      value_def = node.at_xpath(xpath, HQMF2::Document::NAMESPACES)
      if value_def
        return AnyValue.new if value_def.at_xpath('@flavorId') == 'ANY.NONNULL'
        value_type_def = value_def.at_xpath('@xsi:type', HQMF2::Document::NAMESPACES)
        return handle_value_type(value_type_def, value_def) if value_type_def
      end
    end

    # Derives the type associated with a specific value
    def self.handle_value_type(value_type_def, value_def)
      value_type = value_type_def.value
      case value_type
      when 'PQ'
        Value.new(value_def, 'PQ', true)
      when 'TS'
        Value.new(value_def)
      when 'IVL_PQ', 'IVL_INT'
        Range.new(value_def)
      when 'CD'
        Coded.new(value_def)
      when 'ANY', 'IVL_TS'
        # FIXME: (10/26/2015) IVL_TS should be able to handle other values, not just AnyValue
        AnyValue.new
      else
        fail "Unknown value type [#{value_type}]"
      end
    end

    # Determine if this instance is a qdm variable
    def self.extract_variable(local_variable_name, id)
      variable = (local_variable_name =~ /.*qdm_var_/).present? unless local_variable_name.blank?
      variable ||= (id =~ /.*qdm_var_/).present? unless id.blank?
      variable
    end
  end
end
