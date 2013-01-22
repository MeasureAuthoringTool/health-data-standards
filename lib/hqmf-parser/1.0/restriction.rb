module HQMF1
  # Represents a restriction on the allowable values of a data item
  class Restriction
  
    include HQMF1::Utilities
    
    attr_reader :range, :comparison, :restrictions, :subset, :preconditions, :expression
    attr_accessor :from_parent
    
    def initialize(entry, parent, doc)
      @doc = doc
      @entry = entry
      @restrictions = []
      
      range_def = @entry.at_xpath('./cda:pauseQuantity')
      if range_def
        @range = Range.new(range_def)
      end
      
      local_restrictions = @entry.xpath('./*/cda:sourceOf[@typeCode!="PRCN" and @typeCode!="COMP"]').collect do |entry|
        Restriction.new(entry, self, @doc)
      end
      
      @restrictions.concat(local_restrictions)
      
      local_subset = attr_val('./cda:subsetCode/@code')
      if local_subset
        @subset = local_subset
      end
      
      if @entry.at_xpath('./*/cda:derivationExpr')
        @expression = Expression.new(@entry) 
      end
      
      comparison_def = @entry.at_xpath('./*/cda:sourceOf[@typeCode="COMP"]')
      if comparison_def
        data_criteria_id = attr_val('./*/cda:id/@root')
        data_criteria_id = comparison_def.at_xpath('./*/cda:id/@root').value if (data_criteria_id.nil? and comparison_def.at_xpath('./*/cda:id/@root'))
        @comparison = Comparison.new(data_criteria_id, comparison_def, self, @doc)
      end
      
      @preconditions = @entry.xpath('./*/cda:sourceOf[@typeCode="PRCN"]').collect do |entry|
        # create a dummy parent with a single restriction copied from self minus the
        # nested preconditions to avoid an infinite loop
        prior_comparison = nil
        if parent.class==HQMF1::Precondition
          prior_comparison = parent.first_comparison
        else
          prior_comparison = @comparsion
        end
        current_restriction = OpenStruct.new(
          'range' => @range,
          'comparison' => prior_comparison,
          'restrictions' => [],
          'preconditions' => [],
          'subset' => @subset,
          'type' => type,
          'target_id' => target_id,
          'field' => field,
          'field_code' => field_code,
          'field_time' => field_time,
          'value' => value)
        all_restrictions = []
        all_restrictions.concat @restrictions
        all_restrictions << current_restriction
        parent = OpenStruct.new(
          'restrictions' => all_restrictions,
          'subset' => @subset
        )
        p = Precondition.new(entry, parent, @doc)
        
      end
      
    end
    
    # The type of restriction, e.g. SBS, SBE etc
    def type
      attr_val('./@typeCode')
    end

    # is this type negated? true or false
    def negation
      attr_val('./@inversionInd') == "true"
    end
    
    # The id of the data criteria or measurement property that the value
    # will be compared against
    def target_id
      attr_val('./*/cda:id/@root')
    end
    
    def field
      attr_val('./cda:observation/cda:code/@displayName')
    end

    def field_code
      attr_val('./cda:observation/cda:code/@code') || attr_val('./cda:encounter/cda:participant/cda:roleParticipant/@classCode')
    end
    
    def field_time
      effectiveTime = @entry.at_xpath('./cda:observation/cda:effectiveTime') || @entry.at_xpath('./cda:encounter/cda:participant/cda:roleParticipant/cda:effectiveTime')
      
      time = nil
      if effectiveTime
        time = :start if effectiveTime.at_xpath('./cda:low')
        time = :end if effectiveTime.at_xpath('./cda:high')
      end
      time
    end

    
    def value
      value = nil
      type = attr_val('./cda:observation/cda:value/@xsi:type') || 'CD'
      case type
      when 'IVL_PQ'
        value = HQMF1::Range.new(@entry.xpath('./cda:observation/cda:value'))
      when 'PQ'
        value = HQMF1::Value.new(@entry.xpath('./cda:observation/cda:value'))
      when 'CD'
        if field && field.downcase == 'status'
          code = attr_val('./cda:observation/cda:value/@displayName').downcase
          value = HQMF::Coded.for_single_code('status',code,code)
        elsif attr_val('./cda:observation/cda:value/@code')
          oid = attr_val('./cda:observation/cda:value/@code')
          title = attr_val('./cda:observation/cda:value/@displayName')
          value = HQMF::Coded.for_code_list(oid,title)
        elsif attr_val('./cda:encounter/cda:participant/cda:roleParticipant/cda:code/@code')
          oid = attr_val('./cda:encounter/cda:participant/cda:roleParticipant/cda:code/@code')
          title = attr_val('./cda:encounter/cda:participant/cda:roleParticipant/cda:code/@displayName')
          value = HQMF::Coded.for_code_list(oid,title)
        end
      when 'ANYNonNull'
        value = HQMF::AnyValue.new
      else
        raise "Unknown restriction value type #{type}"
      end if type
      value
    end
    
    def to_json 
      return nil if from_parent
      json = build_hash(self, [:subset,:type,:target_id,:field,:field_code,:from_parent, :negation, :field_time])
      json[:range] = range.to_json if range
      if value
        if value.is_a? String
          json[:value] = value
        else
          json[:value] = value.to_json
        end
      end
      json[:comparison] = comparison.to_json if comparison
      json[:restrictions] = json_array(self.restrictions)
      json[:preconditions] = json_array(self.preconditions)
      json[:expression] = self.expression.to_json if self.expression
      json
    end

  end
end