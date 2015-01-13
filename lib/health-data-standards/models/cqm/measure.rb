module HealthDataStandards
  module CQM
    class Measure
      include Mongoid::Document
      include Mongoid::Timestamps

      MSRPOPL = 'MSRPOPL'

      store_in collection: 'measures'
      field :id, as: :id, type: String
      field :sub_id, type: String
      field :cms_id, type: String
      field :name, type: String
      field :title, type: String
      field :description, type: String
      field :subtitle, type: String
      field :short_subtitle, type: String
      field :hqmf_id, type: String
      field :hqmf_set_id, type: String
      field :hqmf_version_number, type: String
      field :nqf_id, type: String
      field :type, type: String
      field :category, type: String
      field :population_ids , type: Hash
      field :oids, type: Array

      field :population_criteria, type: Hash
      field :data_criteria, type: Array, default: []
      field :source_data_criteria, type: Hash, default: {}
      field :measure_period, type: Hash
      field :measure_attributes, type: Hash
      field :populations, type: Array
      field :preconditions, type: Hash
      field :hqmf_document, type: Hash
      field :map_fn, type: String
      field :continuous_variable, type: Boolean
      field :episode_of_care, type: Boolean
      field :aggregator, type: String
      embeds_many :prefilters

      scope :top_level_by_type , ->(type){where({"type"=> type}).any_of({"sub_id" => nil}, {"sub_id" => "a"})}
      scope :top_level , ->{any_of({"sub_id" => nil}, {"sub_id" => "a"})}
      scope :order_by_id_sub_id, ->{order_by([["id", :asc],["sub_id", :asc]])}

      index oids: 1
      index hqmf_id: 1
      index category: 1
      index sub_id: 1
      index _id: 1, sub_id: 1
      index({bundle_id: 1, hqmf_id: 1, sub_id: 1})

      validates_presence_of :id
      validates_presence_of :name

      def self.categories(measure_properties = [])
        measure_properties = Array(measure_properties).map(&:to_s) | %w(
          name description nqf_id cms_id hqmf_id continuous_variable episode_of_care
        )
        pipeline = []

        pipeline << {'$group' =>  measure_properties.inject({
                                    '_id' => "$id",
                                    'subs' => {'$push' => {"sub_id" => "$sub_id", "short_subtitle" => "$short_subtitle"}},
                                    'sub_ids' => {'$push' => "$sub_id"},
                                    'category' => {'$first' => "$category"}
                                  }) do |h, prop|
                                    h[prop] = {"$first" => "$#{prop}"}
                                    h
                                  end
                    }

        pipeline << {'$group' => {
                      _id: "$category",
                      measures: {
                        '$push' =>  measure_properties.inject({
                                      'id' => "$_id",
                                      'hqmf_id' => "$_id",
                                      'subs' => "$subs",
                                      'sub_ids' => "$sub_ids"
                                    }) do |h, prop|
                                      h[prop] = "$#{prop}"
                                      h
                                    end
                      }
                    }}

        pipeline << {'$project' => {'category' => '$_id', 'measures' => 1, '_id' => 0}}

        pipeline << {'$sort' => {"category" => 1}}
        Mongoid.default_session.command(aggregate: 'measures', pipeline: pipeline)['result']
      end


      # Returns the hqmf-parser's ruby implementation of an HQMF document.
      # Rebuild from population_criteria, data_criteria, and measure_period JSON
      def as_hqmf_model
        @hqmf ||=  HQMF::Document.from_json(self.hqmf_document)
      end

      def key
        "#{self['id']}#{sub_id}"
      end

      def is_cv?
        ! population_ids[MSRPOPL].nil?
      end

      def self.installed
        Measure.order_by([["id", :asc],["sub_id", :asc]]).to_a
      end


      # Finds all measures and groups the sub measures
      # @return Array - This returns an Array of Hashes. Each Hash will represent a top level measure with an ID, name, and category.
      #                 It will also have an array called subs containing hashes with an ID and name for each sub-measure.
      def self.all_by_measure
        reduce = 'function(obj,prev) {
                    if (obj.sub_id != null)
                      prev.subs.push({id : obj.id + obj.sub_id, name : obj.subtitle});
                  }'

        self.moped_session.command( :group=> {:ns=>"measures", :key => {:id=>1, :name=>1, :category=>1}, :initial => {:subs => []}, "$reduce" => reduce})["retval"]
      end

      def display_name
        "#{self['cms_id']}/#{self['nqf_id']} - #{name}"
      end


      def set_id
        self.hqmf_set_id
      end

      def measure_id
        self['id']
      end

      def continuous?
        population_ids[MSRPOPL]
      end

      def title
        self.name
      end

      def all_data_criteria
        return @crit if @crit
        @crit = []
        self.data_criteria.each do |dc|
          dc.each_pair do |k,v|
            @crit << HQMF::DataCriteria.from_json(k,v)
          end
        end
        @crit
      end

      # Builds the query hash to pass to MongoDB
      # Calling this method will create Prefilters if they do not exist on the
      # measure
      def prefilter_query!(effective_time)
        self.build_pre_filters! if self.prefilters.empty?

        if self.prefilters.count == 1
          self.prefilters.first.build_query_hash(effective_time)
        else
          self.prefilters.inject({}) do |query, pf|
            query.merge(pf.build_query_hash(effective_time)) do |key, new_val, old_val|
              new_val.merge(old_val)
            end
          end
        end
      end

      # For submeasures, this will return something like IPP_1
      def ipp_id
        ipp_hqmf_id = self.population_ids['IPP']
        pop_id, pop_criteria = hqmf_document['population_criteria'].find do |population_id, population_criteria|
          population_criteria['hqmf_id'] == ipp_hqmf_id
        end
        pop_id
      end

      def build_pre_filters!
        dc = self.data_criteria.inject({}) do |all_dc, single_dc|
          key = single_dc.keys.first
          value = single_dc.values.first
          all_dc[key] = value
          all_dc
        end
        dc.each_pair do |criteria_name, data_criteria|
          if data_criteria['definition'] == 'patient_characteristic_birthdate'
            if data_criteria_in_population?(self.ipp_id, criteria_name)
              prefilter = Prefilter.new(record_field: 'birthdate',
                                        effective_time_based: true)
              if data_criteria['temporal_references']
                data_criteria['temporal_references'].each do |tr|
                  if tr['type'] == 'SBS' && tr['reference'] == 'MeasurePeriod'
                    years = nil
                    if tr['range']['high']
                      prefilter.comparison = '$gte'
                      years = tr['range']['high']['value'].to_i
                    elsif tr['range']['low']
                      prefilter.comparison = '$lte'
                      years = tr['range']['low']['value'].to_i
                    end

                    prefilter.effective_time_offset = 1 + years
                    self.prefilters << prefilter
                  end
                end
              end
            end
          end
        end
      end

      private

      def data_criteria_in_population?(population_id, criteria_name)
        criteria_in_precondition?(self.hqmf_document['population_criteria'][population_id]['preconditions'], criteria_name)
      end

      def criteria_in_precondition?(preconditions, criteria_name)
        preconditions.any? do |precondition|
          (precondition['reference'] == criteria_name) ||
          (precondition['preconditions'] && criteria_in_precondition?(precondition['preconditions'], criteria_name))
        end
      end
    end
  end
end
