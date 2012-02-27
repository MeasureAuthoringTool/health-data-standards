class Organization
  include Mongoid::Document
  
  field :name, type: String
  
  embeds_many :addresses
  embeds_many :telecoms
end