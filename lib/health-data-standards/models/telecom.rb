class Telecom
  include Mongoid::Document
  
  field :use, type: String
  field :value, type: String
  field :preferred, type: Boolean
  
  embedded_in :contactable, polymorphic: true
end