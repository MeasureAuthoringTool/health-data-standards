module HQMF
  
  module Converter
  
    class SimpleRestriction

      include HQMF::Conversion::Utilities
    
      attr_accessor :operator, :target, :preconditions, :negation, :converted, :generated_data_criteria
      def initialize(operator, target, preconditions = [])
        @operator = operator
        @target = target
        @preconditions = preconditions
      end
    
      # Create a new population criteria from a JSON hash keyed off symbols
      def self.from_json(json)
        raise "not implemented"
      end
      
      def klass
        "RESTRICTION"
      end
      
      def comparison?
        false
      end
      def restriction?
        true
      end

      def has_preconditions?
        preconditions and !preconditions.empty?
      end
      
      def single_target?
        !target.nil?
      end
      def multi_target?
        has_preconditions?
      end
      
      def restrictions
        preconditions.select {|precondition| precondition.restriction?}
      end
      
      def to_json
        x = nil
        json = {}
        json[:klass] = klass
        json[:operator] = @operator.to_json if @operator
        json[:target] = @target if @target
        json[:negation] = @negation if @negation
        if (@preconditions)
          json[:preconditions] = x if x = json_array(@preconditions)
        end
        json
      end
    
    end
  end
  
  
end