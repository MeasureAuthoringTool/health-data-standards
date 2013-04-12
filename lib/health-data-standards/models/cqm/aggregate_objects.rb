module HealthDataStandards
  module CQM

    module PopulationSelectors
      def numerator
        populations.find {|pop| pop.type == 'NUMER'}
      end

      def denominator
        populations.find {|pop| pop.type == 'DENOM'}
      end

      def denominator_exceptions
        populations.find {|pop| pop.type == 'DENEXCEP'}
      end

      def denominator_exclusions
        populations.find {|pop| pop.type == 'DENEX'}
      end

      def population_count(population_type)
        population = populations.find {|pop| pop.type == population_type}
        if population
          population.value
        else
          0
        end
      end

      def population_id(population_type)
        populations.find {|pop| pop.type == population_type}.id
      end
    end

    class Population
      attr_accessor :type, :value, :id
    end

    class Stratification
      attr_accessor :id, :populations
      include PopulationSelectors

      def initialize
        @populations = []
      end
    end

    class AggregateCount
      attr_accessor :measure_id, :stratifications, :top_level_populations, :supplemental_data
      alias :populations :top_level_populations
      include PopulationSelectors

      def initialize
        @stratifications = []
        @top_level_populations = []
      end

      def is_cv?
        top_level_populations.any? {|pop| pop.type == 'MSRPOPL'}
      end

      def performance_rate
        population_count('NUMER').to_f / 
          (population_count('DENOM') - population_count('DENEX') - population_count('DENEXCEP'))
      end

      def supplemental_data_for(population_type, supplemental_data_type)
        supplemental_data[population_type][supplemental_data_type]
      end
    end
  end
end