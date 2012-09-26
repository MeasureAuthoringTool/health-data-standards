class Facility
  include Mongoid::Document
  
  field :name, type: String
  field :code, type: Hash
  
  field :start_time, type: Integer
  field :end_time, type: Integer
  
  embeds_many :addresses, as: :locatable
  embeds_many :telecoms, as: :contactable
end