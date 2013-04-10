module HQMF1
  # Represents a bound within a HQMF pauseQuantity, has a value, a unit and an
  # inclusive/exclusive indicator
  class Value
    include HQMF1::Utilities
    
    def initialize(entry, inclusive=nil)
      @entry = entry
  
      if (inclusive.nil?)
        case attr_val('./@inclusive')
        when 'true'
          @inclusive = true
        else
          @inclusive = false
        end
      else
        @inclusive = inclusive
      end

    end
    
    def value
      attr_val('./@value')
    end
    
    def unit
      attr_val('./@unit')
    end
    
    def inclusive?
      @inclusive
    end
    
    def to_json
      build_hash(self, [:value,:unit,:inclusive?])
    end
  end
  
  # Represents a HQMF pauseQuantity which can have low and high bounds
  class Range
    include HQMF1::Utilities
    attr_reader :low, :high
    
    def initialize(entry)
      @entry = entry
      if @entry
        @low = optional_value('./cda:low')
        @high = optional_value('./cda:high')
        if (@low == nil && @high == nil)
          @low = optional_value('.',true)
          @high = optional_value('.',true)
          puts "\tfound = relationship parsing temporal reference (bugfix)"
        end
      end
    end
   
    def to_json
      json = {}
      json[:low] = self.low.to_json if self.low
      json[:high] = self.high.to_json if self.high
      json
    end
    
    private
    
    def optional_value(xpath, inclusive=nil)
      value_def = @entry.at_xpath(xpath)
      if value_def
        Value.new(value_def, inclusive)
      else
        nil
      end
    end
    
  end
end