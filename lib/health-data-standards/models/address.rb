class Address
  include Mongoid::Document
  
  field :street, type: Array, default: []
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :country, type: String
  field :use, type: String
  
  embedded_in :locatable, polymorphic: true
end