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
		  

		  def key
		    "#{self['id']}#{sub_id}"
		  end
		  
		  def is_cv?
		    ! population_ids[QME::QualityReport::MSRPOPL].nil?
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
		    
		    MONGO_DB.command( :group=> {:ns=>"measures", :key => {:id=>1, :name=>1, :category=>1}, :initial => {:subs => []}, "$reduce" => reduce})["retval"]
		  end

		  def display_name
		    "#{self['nqf_id']} - #{name}"
		  end
		  

		  def set_id
		    self.hqmf_set_id
		  end

		  def measure_id
		    self['id']
		  end

		  def continuous?
		    population_ids[QME::QualityReport::MSRPOPL]
		  end

		  def title
		    self.name
		  end

		  def all_data_criteria
		    return @crit if @crit
		    @crit = []
		    self.data_criteria.each do |dc|
		      dc.each_pair do |k,v|
		        @crit <<HQMF::DataCriteria.from_json(k,v)
		      end
		    end
		    @crit
		  end


		end
	end
end