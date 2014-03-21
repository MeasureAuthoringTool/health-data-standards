module HealthDataStandards
  module CQM
    class Measure
      include Mongoid::Document
      include Mongoid::Timestamps

      MSRPOPL = 'MSRPOPL'

      store_in collection: 'measures'
      field :id, type: String
      field :sub_id, type: String
      field :name, type: String
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
      scope :top_level_by_type , ->(type){where({"type"=> type}).any_of({"sub_id" => nil}, {"sub_id" => "a"})}
      scope :top_level , any_of({"sub_id" => nil}, {"sub_id" => "a"})
      scope :order_by_id_sub_id, order_by([["id", :asc],["sub_id", :asc]])

      index oids: 1
      index hqmf_id: 1
      index category: 1
      index sub_id: 1
      index _id: 1, sub_id: 1
      index bundle_id: 1

      validates_presence_of :id
      validates_presence_of :name

      def self.categories
        pipeline = []
        pipeline << {'$group' => {_id: "$id",
                                  name: {"$first" => "$name"},
                                  description: {"$first" => "$description"},
                                  subs: {'$push' => {"sub_id" => "$sub_id", "short_subtitle" => "$short_subtitle"}},
                                  sub_ids: {'$push' => "$sub_id"},
                                  nqf_id: {"$first" => "$nqf_id"},
                                  cms_id: {"$first" => "$cms_id"},
                                  continuous_variable: {"$first" => "$continuous_variable"},
                                  category: {'$first' => "$category"}}}

        pipeline << {'$group' => {_id: "$category",
                                  measures: {'$push' => {"id" => "$_id",
                                             'name' => "$name",
                                             'description' => "$description",
                                             'subs' => "$subs",
                                             'sub_ids' => "$sub_ids",
                                             'nqf_id' => "$nqf_id",
                                             'cms_id' => "$cms_id",
                                             'continuous_variable' => "$continuous_variable"
                                            }}}}

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
    end
  end
end