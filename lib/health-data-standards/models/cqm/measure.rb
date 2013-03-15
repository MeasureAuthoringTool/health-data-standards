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
    end
  end
end