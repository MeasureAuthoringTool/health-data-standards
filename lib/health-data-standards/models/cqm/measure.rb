module HealthDataStandards
  module CQM
    class Measure
      include Mongoid::Document
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
      field :data_criteria, type: Array

      scope :top_level_by_type , ->(type){where({"type"=> type}).any_of({"sub_id" => nil}, {"sub_id" => "a"})}
      scope :top_level , any_of({"sub_id" => nil}, {"sub_id" => "a"})
      scope :order_by_id_sub_id, order_by([["id", :asc],["sub_id", :asc]])

      index({oids: 1})
      index({hqmf_id: 1})
      index({category: 1})
      index "bundle_id" => 1
      
      validates_presence_of :id
      validates_presence_of :name

      def self.categories
        pipeline = []
        pipeline << {'$group' => {_id: "$id", 
                                  name: {"$first" => "$name"},
                                  description: {"$first" => "$description"},
                                  sub_ids: {'$push' => "$sub_id"},
                                  subs: {'$push' => {"sub_id" => "$sub_id", "short_subtitle" => "$short_subtitle"}},
                                  category: {'$first' => "$category"}}}

        pipeline << {'$group' => {_id: "$category",
                                  measures: {'$push' => {"id" => "$_id", 
                                             'name' => "$name",
                                             'description' => "$description",
                                             'subs' => "$subs",
                                             'sub_ids' => "$sub_ids"
                                            }}}}

        pipeline << {'$project' => {'category' => '$_id', 'measures' => 1, '_id' => 0}}
  
        pipeline << {'$sort' => {"category" => 1}}
        Mongoid.default_session.command(aggregate: 'measures', pipeline: pipeline)['result']
      end
    end
  end
end