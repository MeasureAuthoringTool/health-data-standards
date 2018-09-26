class Id
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    embedded_in :entry
    field :naming_system, type: String
    field :id_value, type: String
 end
  