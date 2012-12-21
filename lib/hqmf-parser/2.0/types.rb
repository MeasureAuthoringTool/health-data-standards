module HQMF2
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
    
    def initialize(entry, default_type='PQ')
      @entry = entry
      @type = attr_val('./@xsi:type') || default_type
      @unit = attr_val('./@unit')
      @value = attr_val('./@value')
    end
    
    def inclusive?
      case attr_val('./@inclusive')
      when 'false'
        false
      else
        true
      end
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
        @low = optional_value('./cda:low', default_bounds_type)
        @high = optional_value('./cda:high', default_bounds_type)
        @width = optional_value('./cda:width', 'PQ')
      end
    end
    
    def type
      @type || attr_val('./@xsi:type')
    end
    
    def to_model
      lm = low ? low.to_model : nil
      hm = high ? high.to_model : nil
      wm = width ? width.to_model : nil
      HQMF::Range.new(type, lm, hm, wm)
    end
    
    private
    
    def optional_value(xpath, type)
      value_def = @entry.at_xpath(xpath, HQMF2::Document::NAMESPACES)
      if value_def
        Value.new(value_def, type)
      else
        nil
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
      attr_val('./@displayName')
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

    def initialize(entry)
      @entry = entry
      @type = attr_val('./cda:subsetCode/@code')
      value_def = @entry.at_xpath('./*/cda:repeatNumber', HQMF2::Document::NAMESPACES)
      if value_def
        @value = HQMF2::Range.new(value_def, 'IVL_INT')
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

    def initialize(entry)
      @entry = entry
      @type = attr_val('./@typeCode')
      @reference = Reference.new(@entry.at_xpath('./*/cda:id', HQMF2::Document::NAMESPACES))
      range_def = @entry.at_xpath('./cda:pauseQuantity', HQMF2::Document::NAMESPACES)
      if range_def
        @range = HQMF2::Range.new(range_def, 'IVL_PQ')
      end
    end
    
    def to_model
      rm = range ? range.to_model : nil
      HQMF::TemporalReference.new(type, reference.to_model, rm)
    end  
  end

  # Represents a HQMF reference from a precondition to a data criteria
  class Reference
    include HQMF2::Utilities
    
    def initialize(entry)
      @entry = entry
    end
    
    def id
      attr_val('./@extension')
    end
    
    def to_model
      HQMF::Reference.new(id)
    end
  end
  
end