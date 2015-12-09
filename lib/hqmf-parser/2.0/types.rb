module HQMF2
  # Used to represent 'any value' in criteria that require a value be present but
  # don't specify any restrictions on that value
  class AnyValue
    attr_reader :type

    def initialize(type = 'ANYNonNull')
      @type = type
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      HQMF::AnyValue.new(@type)
    end
  end

  # Represents a bound within a HQMF pauseQuantity, has a value, a unit and an
  # inclusive/exclusive indicator
  class Value
    include HQMF2::Utilities

    attr_reader :type, :unit, :value

    def initialize(entry, default_type = 'PQ', force_inclusive = false, _parent = nil)
      @entry = entry
      @type = attr_val('./@xsi:type') || default_type
      @unit = attr_val('./@unit')
      @value = attr_val('./@value')
      @force_inclusive = force_inclusive

      # FIXME: Remove below when lengthOfStayQuantity unit is fixed
      @unit = 'd' if @unit == 'days'
    end

    def inclusive?
      # If the high and low value are at any time the same, then it must be an inclusive value.
      equivalent = attr_val('../cda:low/@value') == attr_val('../cda:high/@value')

      # If and inclusivity value is set for any specific value, then mark the value as inclusive.
      # IDEA: This could be limited in future iterations by including the parent type (temporal reference, subset code,
      # etc.)
      inclusive_temporal_ref? || inclusive_length_of_stay? || inclusive_basic_values? || inclusive_subsets? ||
        equivalent || @force_inclusive
    end

    # Check whether the temporal reference should be marked as inclusive
    def inclusive_temporal_ref?
      # FIXME: NINF is used instead of 0 sometimes...? (not in the IG)
      # FIXME: Given nullFlavor, but IG uses it and nullValue everywhere...
      less_than_equal_tr = attr_val('../@highClosed') == 'true' &&
                           (attr_val('../cda:low/@value') == '0' || attr_val('../cda:low/@nullFlavor') == 'NINF')
      greater_than_equal_tr = attr_val('../cda:high/@nullFlavor') == 'PINF' &&
                              attr_val('../cda:low/@value')
      # Both less and greater require lowClosed to be set to true
      (less_than_equal_tr || greater_than_equal_tr) && attr_val('../@lowClosed') == 'true'
    end

    # Check whether the length of stay should be inclusive.
    def inclusive_length_of_stay?
      # lengthOfStay - EH111, EH108
      less_than_equal_los = attr_val('../cda:low/@nullFlavor') == 'NINF' &&
                            attr_val('../@highClosed') != 'false'

      greater_than_equal_los = attr_val('../cda:high/@nullFlavor') == 'PINF' &&
                               attr_val('../@lowClosed') != 'false'
      # Both less and greater require that the type is PQ
      (less_than_equal_los || greater_than_equal_los) && attr_val('@xsi:type') == 'PQ'
    end

    # Check is the basic values should be marked as inclusive, currently only checks for greater than case
    def inclusive_basic_values?
      # Basic values - EP65, EP9, and more
      attr_val('../cda:high/@nullFlavor') == 'PINF' &&
        attr_val('../cda:low/@value') &&
        attr_val('../@lowClosed') != 'false' &&
        attr_val('../@xsi:type') == 'IVL_PQ'
    end

    # Check if subset values should be marked as inclusive.  Currently only handles greater than
    def inclusive_subsets?
      # subset - EP128, EH108
      attr_val('../cda:low/@value') != '0' &&
        !attr_val('../cda:high/@value') &&
        attr_val('../@lowClosed') != 'false' &&
        !attr_val('../../../../../qdm:subsetCode/@code').nil?
    end

    def derived?
      case attr_val('./@nullFlavor')
      when 'DER'
        true
      else
        false
      end
    end

    def expression
      if !derived?
        nil
      else
        attr_val('./cda:expression/@value')
      end
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      HQMF::Value.new(type, unit, value, inclusive?, derived?, expression)
    end
  end

  # Represents a HQMF physical quantity which can have low and high bounds
  class Range
    include HQMF2::Utilities
    attr_accessor :low, :high, :width

    def initialize(entry, type = nil)
      @type = type
      @entry = entry
      return unless @entry
      @low = optional_value("#{default_element_name}/cda:low", default_bounds_type)
      @high = optional_value("#{default_element_name}/cda:high", default_bounds_type)
      # Unset low bound to resolve verbose value bounds descriptions
      @low = nil if (@high.try(:value) && @high.value.to_i > 0) && (@low.try(:value) && @low.value.try(:to_i) == 0)
      @width = optional_value("#{default_element_name}/cda:width", 'PQ')
    end

    def type
      @type || attr_val('./@xsi:type')
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      lm = low.try(:to_model)
      hm = high.try(:to_model)
      wm = width.try(:to_model)
      model_type = type
      if @entry.at_xpath('./cda:uncertainRange', HQMF2::Document::NAMESPACES)
        model_type = 'IVL_PQ'
      end

      if generate_any_value?(lm, hm)
        # Generate AnyValue if the only elements in the range are AnyValues.
        HQMF::AnyValue.new
      elsif generate_value?(lm, hm)
        # Generate a singel value if both low and high are the same
        HQMF::Value.new(lm.type, nil, lm.value, lm.inclusive?, lm.derived?, lm.expression)
      else
        HQMF::Range.new(model_type, lm, hm, wm)
      end
    end

    # Check if are only AnyValue elements for low and high
    def generate_any_value?(lm, hm)
      (lm.nil? || lm.is_a?(HQMF::AnyValue)) && (hm.nil? || hm.is_a?(HQMF::AnyValue))
    end

    # Check if the value for the range should actually produce a single value instead of a range (if low and high are
    # the same)
    def generate_value?(lm, hm)
      !lm.nil? && lm.try(:value) == hm.try(:value) && lm.try(:unit).nil? && hm.try(:unit).nil?
    end

    private

    # Either derives a value from a specific path or generates a new value (or returns nil if none found)
    def optional_value(xpath, type)
      value_def = @entry.at_xpath(xpath, HQMF2::Document::NAMESPACES)
      return unless value_def
      if value_def['flavorId'] == 'ANY.NONNULL'
        AnyValue.new
      else
        created_value = Value.new(value_def, type)
        # Return nil if no value was parsed
        created_value if created_value.try(:value)
      end
    end

    # Defines how the time based element should be described
    def default_element_name
      case type
      when 'IVL_PQ'
        '.'
      when 'IVL_TS'
        'cda:phase'
      else
        'cda:uncertainRange'
      end
    end

    # Sets up the default bound type as either time based or a physical quantity
    def default_bounds_type
      case type
      when 'IVL_TS'
        'TS'
      else
        'PQ'
      end
    end
  end

  # Represents an HQMF effective time which is a specialization of an interval
  class EffectiveTime < Range
    def initialize(entry)
      super
    end

    def type
      'IVL_TS'
    end
  end

  # Represents a HQMF CD value which has a code and codeSystem
  class Coded
    include HQMF2::Utilities

    def initialize(entry)
      @entry = entry
    end

    def type
      attr_val('./@xsi:type') || 'CD'
    end

    def system
      attr_val('./@codeSystem')
    end

    def code
      attr_val('./@code')
    end

    def code_list_id
      attr_val('./@valueSet')
    end

    def title
      attr_val('./*/@value')
    end

    def value
      code
    end

    def derived?
      false
    end

    def unit
      nil
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      HQMF::Coded.new(type, system, code, code_list_id, title)
    end
  end
  # Represents a subset of a specific group (the first in the group, the sum of the group, etc.)
  class SubsetOperator
    include HQMF2::Utilities

    attr_reader :type, :value
    ORDER_SUBSETS = %w(FIRST SECOND THIRD FOURTH FIFTH)
    LAST_SUBSETS = %w(LAST RECENT)
    TIME_SUBSETS = %w(DATEDIFF TIMEDIFF)
    QDM_TYPE_MAP = { 'QDM_LAST:' => 'RECENT', 'QDM_SUM:SUM' => 'COUNT' }

    def initialize(entry)
      @entry = entry

      sequence_number = attr_val('./cda:sequenceNumber/@value')
      qdm_subset_code = attr_val('./qdm:subsetCode/@code')
      subset_code = attr_val('./cda:subsetCode/@code')
      if sequence_number
        @type = ORDER_SUBSETS[sequence_number.to_i - 1]
      else
        @type = translate_type(subset_code, qdm_subset_code)
      end

      value_def = handle_value_definition
      @value = HQMF2::Range.new(value_def, 'IVL_PQ') if value_def && !@value
    end

    # Return the value definition (what to calculate it on) associated with this subset.
    # Other values, such as type and value, may be modified depending on this value.
    def handle_value_definition
      value_def = @entry.at_xpath('./*/cda:repeatNumber', HQMF2::Document::NAMESPACES)
      unless value_def
        # TODO: HQMF needs better differentiation between SUM & COUNT...
        # currently using presence of repeatNumber...
        @type = 'SUM' if @type == 'COUNT'
        value_def = @entry.at_xpath('./*/cda:value', HQMF2::Document::NAMESPACES)
      end

      # TODO: Resolve extracting values embedded in criteria within outboundRel's
      if @type == 'SUM'
        value_def = @entry.at_xpath('./*/*/*/cda:value', HQMF2::Document::NAMESPACES)
      end

      if value_def
        value_type = value_def.at_xpath('./@xsi:type', HQMF2::Document::NAMESPACES)
        @value = HQMF2::AnyValue.new if String.try_convert(value_type) == 'ANY'
      end

      value_def
    end

    # Take a qdm type code to map it to a subset operator, or failing at finding that, return the given subset code.
    def translate_type(subset_code, qdm_subset_code)
      combined = "#{qdm_subset_code}:#{subset_code}"
      if QDM_TYPE_MAP[combined]
        QDM_TYPE_MAP[combined]
      else
        subset_code
      end
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      vm = value ? value.to_model : nil
      HQMF::SubsetOperator.new(type, vm)
    end
  end

  # Represents a time bounded reference.  Wraps the "Range" class
  class TemporalReference
    include HQMF2::Utilities

    attr_reader :type, :reference, :range

    # Use updated mappings to HDS temporal reference types (as used in SimpleXML Parser)
    # https://github.com/projecttacoma/simplexml_parser/blob/fa0f589d98059b88d77dc3cb465b62184df31671/lib/model/types.rb#L167
    UPDATED_TYPES = {
      'EAOCW' => 'EACW',
      'EAEORECW' => 'EACW',
      'EAOCWSO' => 'EACWS',
      'EASORECWS' => 'EACWS',
      'EBOCW' => 'EBCW',
      'EBEORECW' => 'EBCW',
      'EBOCWSO' => 'EBCWS',
      'EBSORECWS' => 'EBCWS',
      'ECWSO' => 'ECWS',
      'SAOCWEO' => 'SACWE',
      'SAEORSCWE' => 'SACWE',
      'SAOCW' => 'SACW',
      'SASORSCW' => 'SACW',
      'SBOCWEO' => 'SBCWE',
      'SBEORSCWE' => 'SBCWE',
      'SBOCW' => 'SBCW',
      'SBSORSCW' => 'SBCW',
      'SCWEO' => 'SCWE',
      'OVERLAPS' => 'OVERLAP'
    }

    def initialize(entry)
      @entry = entry
      @type = UPDATED_TYPES[attr_val('./@typeCode')] || attr_val('./@typeCode')
      @reference = Reference.new(@entry.at_xpath('./*/cda:id', HQMF2::Document::NAMESPACES))
      range_def = @entry.at_xpath('./qdm:temporalInformation/qdm:delta', HQMF2::Document::NAMESPACES)
      @range = HQMF2::Range.new(range_def, 'IVL_PQ') if range_def
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      rm = range ? range.to_model : nil
      HQMF::TemporalReference.new(type, reference.to_model, rm)
    end
  end

  # Represents a HQMF reference to a data criteria that has a given type
  class TypedReference
    include HQMF2::Utilities
    attr_accessor :id, :type, :mood

    # Create a new HQMF::Reference
    # @param [String] id
    def initialize(entry, type = nil, verbose = false)
      @entry = entry
      @type = type || attr_val('./@classCode')
      @mood = attr_val('./@moodCode')
      @entry = entry.elements.first unless entry.at_xpath('./@extension')
      @verbose = verbose
    end

    # Generate the reference for the typed reference to use
    def reference
      value = "#{attr_val('./@extension')}_#{attr_val('./@root')}"
      strip_tokens(value)
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      HQMF::TypedReference.new(reference, @type, @mood)
    end
  end

  # Represents a HQMF reference from a precondition to a data criteria
  class Reference
    include HQMF2::Utilities

    def initialize(entry)
      @entry = entry
    end

    # Generates the id to use for a reference
    def id
      if @entry.is_a? String
        @entry
      else
        id = strip_tokens("#{attr_val('./@extension')}_#{attr_val('./@root')}")
        # Handle MeasurePeriod references for calculation code
        id = 'MeasurePeriod' if id.try(:start_with?, 'measureperiod')
        id
      end
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      HQMF::Reference.new(id)
    end
  end

  # Creates a Data Criteria given a map of options, and is used when full
  #  criteria parsing is not necessary.
  class DataCriteriaWrapper
    attr_accessor :status, :value, :effective_time
    attr_accessor :temporal_references, :subset_operators, :children_criteria
    attr_accessor :derivation_operator, :negation, :negation_code_list_id, :description
    attr_accessor :field_values, :source_data_criteria, :specific_occurrence_const
    attr_accessor :specific_occurrence, :comments
    attr_accessor :id, :title, :definition, :variable, :code_list_id, :value, :inline_code_list

    def initialize(opts = {})
      opts.each { |k, v| instance_variable_set("@#{k}", v) }
    end

    # Generates this classes hqmf-model equivalent
    def to_model
      mv = @value ? @value.to_model : nil
      met = @effective_time ? @effective_time.to_model : nil
      mtr = @temporal_references
      mso = @subset_operators
      HQMF::DataCriteria.new(@id, @title, nil, @description, @code_list_id, @children_criteria,
                             @derivation_operator, @definition, @status, mv, field_values, met, @inline_code_list,
                             @negation, @negation_code_list_id, mtr, mso, @specific_occurrence,
                             @specific_occurrence_const, @source_data_criteria, @comments, @variable)
    end
  end
end
