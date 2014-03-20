class Telecom
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :use, type: String
  field :value, type: String
  field :preferred, type: Boolean
  
  embedded_in :contactable, polymorphic: true
end