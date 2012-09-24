class Facility
  include Mongoid::Document
  
  field :name, type: String
  field :code, type: Hash
  
  embeds_many :addresses, as: :locatable
  embeds_many :telecoms, as: :contactable
end