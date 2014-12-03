module HQMF

  # Used to represent 'any value' in criteria that require a value be present but
  # don't specify any restrictions on that value
  class AnyValue
    include HQMF::Conversion::Utilities
    attr_reader :type
    
    def initialize(type='ANYNonNull')
      @type = type 
    end
    
    def derived?
      false
    end

    def self.from_json(json)
      type = json["type"] || 'ANYNonNull'
      HQMF::AnyValue.new(type)
    end
    
    def to_json
      hash = build_hash(self, [:type])
      hash
    end    
  end
  
  # Represents a bound within a HQMF pauseQuantity, has a value, a unit and an
  # inclusive/exclusive indicator
  class Value
    include HQMF::Conversion::Utilities
    attr_reader :unit,:expression
    attr_accessor :type, :value, :inclusive
    
    # Create a new HQMF::Value
    # @param [String] type
    # @param [String] unit
    # @param [String] value
    # @param [Boolean] inclusive
    # @param [Boolean] derived
    # @param [String] expression
    def initialize(type,unit,value,inclusive,derived,expression)
      @type = type || 'PQ'
      @unit = unit
      @value = value
      @inclusive = inclusive == nil ? true : inclusive
      @derived = derived || false
      @expression = expression
    end
    
    def self.from_json(json)
      type = json["type"] if json["type"]
      unit = json["unit"] if json["unit"]
      value = json["value"] if json["value"]
      inclusive = json["inclusive?"] unless json["inclusive?"].nil?
      derived = json["derived?"] unless json["derived?"].nil?
      expression = json["expression"] if json["expression"]
      
      HQMF::Value.new(type,unit,value,inclusive,derived,expression)
    end
    
    
    def inclusive?
      @inclusive
    end

    def derived?
      @derived
    end
    
    def to_json
      build_hash(self, [:type,:unit,:value,:inclusive?,:derived?,:expression])
    end
    
    def stringify
      "#{inclusive? ? '=' : ''}#{value}#{unit ? ' '+unit : ''}"
    end

    def ==(other)
      check_equality(self,other)
    end
    
  end
  
  # Represents a HQMF physical quantity which can have low and high bounds
  class Range
    include HQMF::Conversion::Utilities
    attr_accessor :type, :low, :high, :width
    
    # Create a new HQMF::Value
    # @param [String] type
    # @param [Value] low
    # @param [Value] high
    # @param [Value] width
    def initialize(type,low,high,width)
      @type = type || 'IVL_PQ'
      @low = low
      @high = high
      @width = width
    end
    
    def self.from_json(json)
      type = json["type"] if json["type"]
      low = HQMF::Value.from_json(json["low"]) if json["low"]
      high = HQMF::Value.from_json(json["high"]) if json["high"]
      width = HQMF::Value.from_json(json["width"]) if json["width"]
      
      HQMF::Range.new(type,low,high,width)
    end
    
    def to_json
      json = build_hash(self, [:type])
      json[:low] = self.low.to_json if self.low
      json[:high] = self.high.to_json if self.high
      json[:width] = self.width.to_json if self.width
      json
    end
    
    def stringify
      if (@high && @low)
        if (@high.value == @low.value and @high.inclusive? and low.inclusive?)
          "#{@low.stringify}"
        else
          ">#{@low.stringify} and <#{@high.stringify}}"
        end
      elsif (@high)
        "<#{@high.stringify}"
      elsif (@low)
        ">#{@low.stringify}"
      else
        raise "cannot convert range to string"
      end
    end
    
    def ==(other)
      check_equality(self,other)
    end
    
    
  end
  
  # Represents a HQMF effective time which is a specialization of a interval
  class EffectiveTime < Range
    def initialize(low,high,width)
      super('IVL_TS', low, high, width)
    end
    
    def type
      'IVL_TS'
    end
    
  end
  
  # Represents a HQMF CD value which has a code and codeSystem
  class Coded
    include HQMF::Conversion::Utilities
    attr_reader :type, :system, :code, :code_list_id, :title, :null_flavor, :original_text
    
    # Create a new HQMF::Coded
    # @param [String] type
    # @param [String] system
    # @param [String] code
    # @param [String] code_list_id
    def initialize(type,system,code,code_list_id=nil,title=nil,null_flavor=nil,original_text=nil)
      @type = type
      @system = system
      @code = code
      @code_list_id = code_list_id
      @title = title
      @null_flavor = null_flavor
      @original_text = original_text
    end
    
    def self.for_code_list(code_list_id,title=nil)
      HQMF::Coded.new('CD',nil,nil,code_list_id,title)
    end
    
    def self.for_single_code(system,code,title=nil)
      HQMF::Coded.new('CD',system,code,nil,title)
    end

    def self.for_null_flavor(null_flavor,original_text=nil)
      HQMF::Coded.new('CD',nil,nil,nil,nil,null_flavor,original_text)
    end
    
    def self.from_json(json)
      json = json.with_indifferent_access
      type = json["type"] if json["type"]
      system = json["system"] if json["system"]
      code = json["code"] if json["code"]
      code_list_id = json["code_list_id"] if json["code_list_id"]
      title = json["title"] if json["title"]
      null_flavor = json["null_flavor"] if json["null_flavor"]
      original_text = json["original_text"] if json["original_text"]
      
      HQMF::Coded.new(type,system,code,code_list_id,title, null_flavor, original_text)
    end
    
    def to_json
      build_hash(self, [:type,:system,:code,:code_list_id,:title,:null_flavor,:original_text])
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
    
    def ==(other)
      check_equality(self,other)
    end
    
  end

  class TemporalReference
    include HQMF::Conversion::Utilities
    
    TYPES = ['DURING','OVERLAP','SBS','SAS','SBE','SAE','EBS','EAS','EBE','EAE','SDU','EDU','ECW','SCW','ECWS','SCWE','SBCW','SBCWE','SACW','SACWE','SBDU','EBCW','EBCWS','EACW','EACWS','EADU','CONCURRENT']
    INVERSION = {'SBS' => 'SAS','EAE' => 'EBE','SAS' => 'SBS','EBE' => 'EAE','SBE' => 'EAS','EAS' => 'SBE','SAE' => 'EBS','EBS' => 'SAE'}
    
    attr_reader :type, :reference, :range
    
    # @param [String] type
    # @param [Reference] reference
    # @param [Range] range
    def initialize(type, reference, range)
      @type = type
      @reference = reference
      if (range.is_a? HQMF::Value)
        @range = HQMF::Range.new('IVL_PQ', range, range, nil)
      else
        @range = range
      end
    end
    
    def self.from_json(json)
      type = json["type"] if json["type"]
      reference = HQMF::Reference.new(json["reference"]) if json["reference"]
      range = HQMF::Range.from_json(json["range"]) if json["range"]
      
      HQMF::TemporalReference.new(type,reference,range)
    end
    
    
    def to_json
      json = build_hash(self, [:type])
      json[:reference] = @reference.to_json if @reference
      json[:range] = @range.to_json if @range
      json
    end
    
    def ==(other)
      check_equality(self,other)
    end
    
  end

  class SubsetOperator
    include HQMF::Conversion::Utilities
    
    TYPES = ['COUNT', 'FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH', 'RECENT', 'LAST', 'MIN', 'MAX', 'DATEDIFF', 'TIMEDIFF', 'DATETIMEDIFF', 'MEDIAN', 'MEAN', 'SUM']
    
    attr_accessor :type, :value
    # @param [String] type
    # @param [Value] value
    def initialize(type,value)
      @type = type
      if (value.is_a? HQMF::Value)
        value.inclusive = true
        @value = HQMF::Range.new('IVL_PQ',value,value,nil)
      else
        @value = value
      end
    end
    
    def supports_grouper_criteria?
      ['FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH', 'RECENT', 'LAST'].include? @type
    end

    def self.from_json(json)
      type = json["type"] if json["type"]

      value = HQMF::DataCriteria.convert_value(json["value"]) if json["value"]
      
      HQMF::SubsetOperator.new(type,value)
    end
    
    
    def to_json
      json = build_hash(self, [:type])
      json[:value] = @value.to_json if @value
      json
    end
    
    def ==(other)
      check_equality(self,other)
    end
    
  end

 # Represents a HQMF reference from a precondition to a data criteria
  class TypedReference
    include HQMF::Conversion::Utilities
    attr_accessor :reference, :type, :mood
    
    # Create a new HQMF::Reference
    # @param [String] id
    def initialize(reference,type,mood=nil)
      @reference = reference
      @type = type
      @mood = mood
    end
    
    def self.from_json(json)
      type = json["type"] 
      reference = json["reference"]
      mood = json["mood"]
      new(reference,type,mood)
    end

    def to_json
      build_hash(self, [:type, :reference,:mood])
    end
    
    def ==(other)
      check_equality(self,other)
    end
    
  end
  
  # Represents a HQMF reference from a precondition to a data criteria
  class Reference
    include HQMF::Conversion::Utilities
    attr_accessor :id
    
    # Create a new HQMF::Reference
    # @param [String] id
    def initialize(id)
      @id = id
    end
    
    def to_json
      @id
    end
    
    def ==(other)
      check_equality(self,other)
    end
    
  end

  class Identifier
    include HQMF::Conversion::Utilities
    attr_accessor :type, :root, :extension

    def initialize(type, root, extension=nil)
      @type = type || 'II'
      @root = root
      @extension = extension
    end

    def self.from_json(json)
      json = json.with_indifferent_access
      HQMF::Identifier.new(json['type'], json['root'], json['extension'])
    end

    def to_json
      build_hash(self, [:type, :root, :extension])
    end

    def ==(other)
      check_equality(self,other)
    end
  end

  # What does ED stand for?
  # ED has a lot more elements / attributes to represent, but only caring about what I see used...
  class ED
    include HQMF::Conversion::Utilities
    attr_accessor :type, :value, :media_type

    def initialize(type, value, media_type)
      @type = type || 'ED'
      @value = value
      @media_type = media_type
    end

    def self.from_json(json)
      json = json.with_indifferent_access
      HQMF::ED.new(json['type'], json['value'], json['media_type'])
    end

    def to_json
      build_hash(self, [:type, :value, :media_type])
    end

    def ==(other)
      check_equality(self,other)
    end
  end

  class GenericValueContainer
    include HQMF::Conversion::Utilities
    attr_accessor :type, :value

    def initialize(type, value)
      @type = type
      @value = value
    end

    def self.from_json(json)
      json = json.with_indifferent_access
      HQMF::GenericValueContainer.new(json['type'], json['value'])
    end

    def to_json
      build_hash(self, [:type, :value])
    end

    def ==(other)
      check_equality(self,other)
    end
  end
  
end