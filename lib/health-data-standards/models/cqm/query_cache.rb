module HealthDataStandards
  module CQM
    class QueryCache
      include Mongoid::Document
      include Mongoid::Timestamps
      store_in collection: 'query_cache'

      field :calculation_date, type: Time
      field :status, type: Hash
      field :measure_id, type: String
      field :sub_id, type: String
      field :population_ids, type: Hash
      field :effective_date, type: Integer
      field :IPP, type: Integer
      field :DENOM, type: Integer
      field :NUMER, type: Integer
      field :NUMEX, type: Integer
      field :antinumerator, type: Integer
      field :DENEX, type: Integer
      field :DENEXCEP, type: Integer
      field :MSRPOPL, type: Integer
      field :MSRPOPLEX, type: Integer
      field :OBSERV, type: Float
      field :supplemental_data, type: Hash

      def self.aggregate_measure(measure_id, effective_date, filters=nil, test_id=nil)
        query_hash = {'effective_date' => effective_date, 'measure_id' => measure_id,
                      'test_id' => test_id}
        if filters
          query_hash.merge!(filters)
        end
        cache_entries = self.where(query_hash)
        aggregate_count = AggregateCount.new(measure_id)
        cache_entries.each do |cache_entry|
          aggregate_count.add_entry(cache_entry)
        end
        aggregate_count
      end

      def is_stratification?
        population_ids.has_key?('stratification') || population_ids.has_key?('STRAT')
      end

      def is_cv?
        population_ids.has_key?('MSRPOPL')
      end


    end
  end
end
