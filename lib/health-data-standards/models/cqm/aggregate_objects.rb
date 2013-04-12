module HealthDataStandards
  module CQM
    class Population
      attr_accessor :type, :value, :id
    end

    class Stratification
      attr_accessor :id, :populations

      def initialize
        @populations = []
      end
    end

    class AggregateCount
      attr_accessor :measure_id, :stratifications, :top_level_populations

      def initialize
        @stratifications = []
        @top_level_populations = []
      end
    end
  end
end