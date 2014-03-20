class Organization
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :name, type: String
  
  embeds_many :addresses, as: :locatable
  embeds_many :telecoms, as: :contactable
end