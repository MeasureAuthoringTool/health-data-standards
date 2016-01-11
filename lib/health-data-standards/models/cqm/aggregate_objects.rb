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

      def population_count(population_type, population_id)
        population = populations.find {|pop| pop.type == population_type && pop.id == population_id}
        if population
          population.value
        else
          0
        end
      end

      def population_id(population_type)
        populations.find {|pop| pop.type == population_type}.id
      end

      def method_missing(method, *args, &block)
        match_data = method.to_s.match(/^(.+)_count$/)
        if match_data
          population = self.send(match_data[1])
          if population
            population.value
          else
            0
          end
        else
          super
        end
      end

      # Returns true if there is more than one IPP or DENOM, etc.
      def multiple_population_types?
        population_groups = populations.group_by {|pop| pop.type}
        population_groups.values.any? { |pops| pops.size > 1 }
      end
    end
    class Population
      attr_accessor :type, :value, :id, :stratifications, :supplemental_data

      def initialize
        @stratifications = []
      end

      def add_stratification(id,value)
        unless stratifications.find{|st| st.id == id}
          stratifications << Stratification.new(id,value)
        end
      end

    end

    class Stratification
      attr_accessor :id, :value
      def initialize(id,value)
        @id = id
        @value = value
      end

    end

    class PopulationGroup
      include PopulationSelectors
      attr_accessor :populations
      def performance_rate
        numerator_count.to_f / 
          (performance_rate_denominator)
      end

      def performance_rate_denominator
        denominator_count - denominator_exclusions_count - denominator_exceptions_count
      end

      def is_cv?
        populations.any? {|pop| pop.type == 'MSRPOPL'}
      end

    end

    class AggregateCount
      attr_accessor :measure_id,  :populations, :population_groups

      def initialize(measure_id)
        @populations = []
        @measure_id = measure_id
        @population_groups = []
      end

      def add_entry(cache_entry)
        entry_populations = []
        cache_entry.population_ids.each do |population_type, population_id|
          population = populations.find{|pop| pop.id == population_id}
          if population.nil? && population_type != 'stratification' && population_type != 'STRAT'
            population = Population.new
            population.type = population_type
            population.id = population_id
            populations << population
          end
          unless population_type == 'stratification' || population_type == 'STRAT'
            if cache_entry.is_stratification?
              strat_id = cache_entry.population_ids['STRAT']
              population.add_stratification(strat_id,cache_entry[population_type])
            else
              population.value = cache_entry[population_type]
              population.supplemental_data = cache_entry.supplemental_data[population_type]
            end
          end
          entry_populations << population if population
        end
         pgroup = population_groups.find{|pg| pg.populations.collect{|p| p.id}.sort == entry_populations.collect{|p| p.id}.sort }
         unless pgroup
          pg = PopulationGroup.new
          pg.populations = entry_populations
          population_groups << pg
         end
      end

      def is_cv?
        populations.any? {|pop| pop.type == 'MSRPOPL'}
      end

    end
  end
end