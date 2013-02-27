module HQMF1
  
  class Precondition
  
    include HQMF1::Utilities
    
    attr_reader :restrictions, :preconditions, :subset, :expression, :id
  
    def initialize(entry, parent, doc)
      @doc = doc
      @entry = entry
      @id = attr_val('./*/cda:id/@root')
      @restrictions = []
      
      local_subset = attr_val('./cda:subsetCode/@code')
      if local_subset
        @subset = local_subset
      end
      #@subset = attr_val('./cda:subsetCode/@code')
      
      local_restrictions = @entry.xpath('./*/cda:sourceOf[@typeCode!="PRCN" and @typeCode!="COMP"]').collect do |entry|
        Restriction.new(entry, self, @doc)
      end
      @restrictions.concat(local_restrictions)

      @expression = Expression.new(@entry) if @entry.at_xpath('./*/cda:derivationExpr')

      @preconditions = @entry.xpath('./*/cda:sourceOf[@typeCode="PRCN"]').collect do |entry|
        Precondition.new(entry, self, @doc)
      end
    end
    
    # Get the conjunction code, e.g. AND, OR
    # @return [String] conjunction code
    def conjunction
      attr_val('./cda:conjunctionCode/@code')
    end
    
    # Return whether the precondition is negated (true) or not (false)
    def negation
      if @entry.at_xpath('./cda:act[@actionNegationInd="true"]')
        is_negation_rationale = (comparison.restrictions.map {|restriction| restriction.type }).include? 'RSON' if comparison
        if is_negation_rationale
          false
        else
          true
        end
      else
        false
      end
    end
    
    def comparison
      comparison_def = @entry.at_xpath('./*/cda:sourceOf[@typeCode="COMP"]')
      if comparison_def
        data_criteria_id = attr_val('./*/cda:id/@root')
        @comparison = Comparison.new(data_criteria_id, comparison_def, self, @doc)
      end
    end
    
    def first_comparison
      if comparison
        return comparison
      elsif @preconditions
        @preconditions.each do |precondition|
          first = precondition.first_comparison
          if first
            return first
          end
        end
      end
      return nil
    end
    
    def to_json
      
      json = build_hash(self, [:id,:conjunction,:negation,:subset])
      json[:comparison] = self.comparison.to_json if self.comparison
      json[:expression] = self.expression.to_json if self.expression
      json[:preconditions] = json_array(self.preconditions)
      json[:restrictions] = json_array(self.restrictions)
      json
      
    end
    
  end
  
  
end