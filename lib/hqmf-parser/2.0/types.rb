module HQMF2

  # TODO: Clean up debug print statements!

  # Used to represent 'any value' in criteria that require a value be present but
  # don't specify any restrictions on that value
  class AnyValue
    attr_reader :type

    def initialize(type='ANYNonNull')
      @type = type
    end

    def to_model
      HQMF::AnyValue.new(@type)
    end
  end

  # Represents a bound within a HQMF pauseQuantity, has a value, a unit and an
  # inclusive/exclusive indicator
  class Value
    include HQMF2::Utilities

    attr_reader :type, :unit, :value

    def initialize(entry, default_type='PQ', force_inclusive=false)
      @entry = entry
      @type = attr_val('./@xsi:type') || default_type
      @unit = attr_val('./@unit')
      @value = attr_val('./@value')
      @force_inclusive = force_inclusive

      # FIXME: Remove below when lengthOfStayQuantity unit is fixed
      @unit = 'd' if @unit=='days'
    end

    def inclusive?
      # FIXME: NINF is used instead of 0 sometimes...? (not in the IG)
      # FIXME: Given nullFlavor, but IG uses it and nullValue everywhere...

      # temporal references
      less_than_equal_tr = attr_val("../@lowClosed")=='true' &&
        attr_val("../@highClosed")=='true' &&
        attr_val("../cda:low/@value")=="0"
      greater_than_equal_tr = attr_val("../cda:high/@nullFlavor")=="PINF" &&
        attr_val("../cda:low/@value") &&
        attr_val("../@lowClosed")=='true'
      equivalent = attr_val("../@lowClosed")=='true' &&
        attr_val("../@highClosed")=='true' &&
        attr_val("../cda:low/@value")==attr_val("../cda:high/@value")

      # lengthOfStay - EH111, EH108
      less_than_equal_los = attr_val("../cda:low/@nullFlavor")=="NINF" &&
        attr_val("../@highClosed")!='false'

      # subset - EP128, EH108
      greater_than_equal_ss = attr_val("../cda:low/@value")!="0" &&
        !attr_val("../cda:high/@value") &&
        attr_val("../@lowClosed")!='false'

      less_than_equal_tr || less_than_equal_los || greater_than_equal_tr || greater_than_equal_ss || equivalent || @force_inclusive
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

    def to_model
      HQMF::Value.new(type,unit,value,inclusive?,derived?,expression)
    end
  end

  # Represents a HQMF physical quantity which can have low and high bounds
  class Range
    include HQMF2::Utilities
    attr_accessor :low, :high, :width

    def initialize(entry, type=nil)
      @type = type
      @entry = entry
      if @entry
        @low = optional_value("#{default_element_name}/cda:low", default_bounds_type)
        @low = nil unless (@low.try(:value) || @low.kind_of?( HQMF2::AnyValue))
        @high = optional_value("#{default_element_name}/cda:high", default_bounds_type)
        @high = nil unless (@high.try(:value) || @high.kind_of?(HQMF2::AnyValue))
        # Unset low bound to resolve verbose value bounds descriptions
        @low = nil if @high.try(:value) && @high.value.try(:to_i) > 0 && @low.try(:value) && @low.value.try(:to_i) == 0
        @width = optional_value("#{default_element_name}/cda:width", 'PQ')
      end
    end

    def type
      @type || attr_val('./@xsi:type')
    end

    def to_model
      lm = low ? low.to_model : nil
      hm = high ? high.to_model : nil
      wm = width ? width.to_model : nil
      model_type = type
      if @entry.at_xpath('./cda:uncertainRange', HQMF2::Document::NAMESPACES)
        model_type = 'IVL_PQ'
      end
      HQMF::Range.new(model_type, lm, hm, wm)
    end

    private

    def optional_value(xpath, type)
      value_def = @entry.at_xpath(xpath, HQMF2::Document::NAMESPACES)
      if value_def # && (!value_def["value"].blank? && value_def["value"].to_i > 0)
        if value_def["flavorId"] == "ANY.NONNULL"
          AnyValue.new
        else
          Value.new(value_def, type)
        end
      else
        nil
      end
    end

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

    def default_bounds_type
      case type
      when 'IVL_TS'
        'TS'
      else
        'PQ'
      end
    end
  end

  # Represents a HQMF effective time which is a specialization of a interval
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

    def to_model
      HQMF::Coded.new(type, system, code, code_list_id, title)
    end

  end

  class SubsetOperator
    include HQMF2::Utilities

    attr_reader :type, :value
    ORDER_SUBSETS = ['FIRST','SECOND','THIRD','FOURTH','FIFTH']
    LAST_SUBSETS = ['LAST', 'RECENT']
    TIME_SUBSETS = ['DATEDIFF', 'TIMEDIFF']
    QDM_TYPE_MAP = {'QDM_LAST:'=>'RECENT', 'QDM_SUM:SUM' => 'COUNT'}

    def initialize(entry)
      @entry = entry

      sequence_number = attr_val('./cda:sequenceNumber/@value')
      qdm_subset_code = attr_val('./qdm:subsetCode/@code')
      subset_code = attr_val('./cda:subsetCode/@code')
      if (sequence_number)
        @type = ORDER_SUBSETS[sequence_number.to_i-1]
      else
        @type = translate_type(subset_code, qdm_subset_code)
      end

      value_def = @entry.at_xpath('./*/cda:repeatNumber', HQMF2::Document::NAMESPACES)
      if !value_def
        # TODO: HQMF needs better differentiation between SUM & COUNT...
        # currently using presence of repeatNumber...
        @type = "SUM" if @type == "COUNT"
        value_def = @entry.at_xpath('./*/cda:value', HQMF2::Document::NAMESPACES)
      end
      if value_def
        value_type = value_def.at_xpath('./@xsi:type', HQMF2::Document::NAMESPACES)
        if String.try_convert(value_type) ==  "ANY"
          @value = HQMF2::AnyValue.new()
        end
      end

      # TODO: Resolve extracting values embedded in criteria within outboundRel's
      if @type=="SUM"
        value_def = @entry.at_xpath('./*/*/*/cda:value', HQMF2::Document::NAMESPACES)
      end

      if value_def && !@value
        @value = HQMF2::Range.new(value_def, 'IVL_PQ')
      end
    end

    def translate_type(subset_code, qdm_subset_code)
      combined = "#{qdm_subset_code}:#{subset_code}"
      if (QDM_TYPE_MAP[combined])
        QDM_TYPE_MAP[combined]
      else
        subset_code
      end

    end

    def to_model
      vm = value ? value.to_model : nil
      HQMF::SubsetOperator.new(type, vm)
    end
  end

  class TemporalReference
    include HQMF2::Utilities

    attr_reader :type, :reference, :range

    # Use updated mappings to HDS temporal reference types (as used in SimpleXML Parser)
    # https://github.com/projecttacoma/simplexml_parser/blob/fa0f589d98059b88d77dc3cb465b62184df31671/lib/model/types.rb#L167
    UPDATED_TYPES = {
      "EAOCW" => "EACW",
      "EAEORECW" => "EACW",
      "EAOCWSO" => "EACWS",
      "EASORECWS" => "EACWS",
      "EBOCW" => "EBCW",
      "EBEORECW" => "EBCW",
      "EBOCWSO" => "EBCWS",
      "EBSORECWS" => "EBCWS",
      "ECWSO" => "ECWS",
      "SAOCWEO" => "SACWE",
      "SAEORSCWE" => "SACWE",
      "SAOCW" => "SACW",
      "SASORSCW" => "SACW",
      "SBOCWEO" => "SBCWE",
      "SBEORSCWE" => "SBCWE",
      "SBOCW" => "SBCW",
      "SBSORSCW" => "SBCW",
      "SCWEO" => "SCWE",
      "OVERLAPS" => "OVERLAP"
    }

    def initialize(entry)
      @entry = entry
      @type = UPDATED_TYPES[attr_val('./@typeCode')] || attr_val('./@typeCode')
      @reference = Reference.new(@entry.at_xpath('./*/cda:id', HQMF2::Document::NAMESPACES))
      range_def = @entry.at_xpath('./qdm:temporalInformation/qdm:delta', HQMF2::Document::NAMESPACES)
      if range_def
        @range = HQMF2::Range.new(range_def, 'IVL_PQ')
      end
    end

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
    def initialize(entry, type=nil, verbose=false)
      @entry = entry
      @type = type || attr_val('./@classCode')
      @mood = attr_val('./@moodCode')
      @entry = entry.elements.first unless entry.at_xpath('./@extension')
      @verbose = verbose
    end

    def reference
      if @verbose
        value = "#{attr_val('./@extension')}_#{attr_val('./@root')}"
        # puts "Using verbose typed reference for #{value}"
      else
        value = attr_val('./@extension')
      end
      strip_tokens value
    end

    def to_model
      HQMF::TypedReference.new(reference,@type,@mood)
    end

  end

  # Represents a HQMF reference from a precondition to a data criteria
  class Reference
    include HQMF2::Utilities

    def initialize(entry, verbose=false)
      @entry = entry
      @verbose = verbose
    end

    def id
      if @entry.kind_of? String
        @entry
      else
        if @verbose
          value = "#{attr_val('./@extension')}_#{attr_val('./@root')}"
          # puts "Using verbose reference for #{value}"
        else
          value = attr_val('./@extension')
        end
        id = strip_tokens value
        # Handle MeasurePeriod references for calculation code
        id = 'MeasurePeriod' if id.try(:start_with?,'measureperiod')
        id
      end
    end

    def update_verbose(verbose=false)
      @verbose = verbose
    end

    def to_model
      HQMF::Reference.new(id)
    end
  end

  class DataCriteriaWrapper

    attr_accessor  :status, :value, :effective_time
    attr_accessor :temporal_references, :subset_operators, :children_criteria
    attr_accessor :derivation_operator, :negation, :negation_code_list_id, :description
    attr_accessor :field_values, :source_data_criteria, :specific_occurrence_const
    attr_accessor :specific_occurrence, :comments
    attr_accessor :id, :title, :definition, :variable, :code_list_id, :value, :inline_code_list

    def initialize(opts={})
     opts.each { |k,v| instance_variable_set("@#{k}", v) }
    end

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
