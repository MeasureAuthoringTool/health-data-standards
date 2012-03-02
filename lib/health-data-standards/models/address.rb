class Address
  include Mongoid::Document
  
  field :street, type: Array
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :country, type: String
  
  embedded_in :locatable, polymorphic: true
end