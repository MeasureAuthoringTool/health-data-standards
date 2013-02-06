module HQMF
  
  module Converter
  
    class SimplePrecondition < HQMF::Precondition

      COMPARISON = "COMPARISON"
      PRECONDITION = "PRECONDITION"

      attr_accessor :klass, :processed, :subset_comparison, :conjunction_code

      def initialize(id, preconditions,reference,conjunction_code,negation)
        super(id, preconditions,reference,conjunction_code,negation)
        @id = HQMF::Counter.instance.next if (@id.nil?)
        @klass = PRECONDITION
      end
      
      def to_json
        json = super
#        json[:klass] = @klass
        json
      end
      
      def comparison?
        @klass == COMPARISON
      end
      def restriction?
        false
      end
      
      def has_preconditions?
        preconditions and !preconditions.empty?
      end
      
      def restrictions
        preconditions.select {|precondition| precondition.restriction?}
      end
      
      def reference=(reference)
        @reference = reference
      end
      
      def delete_converted_restrictions!
        preconditions.delete_if {|precondition| precondition.restriction? and precondition.converted}
      end
      
    end
  end
  
  
end