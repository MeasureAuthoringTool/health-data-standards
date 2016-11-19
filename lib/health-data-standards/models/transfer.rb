class Transfer
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ThingWithCodes

  field :time, type: Integer 

  embedded_in :encounter, class_name: "Encounter", inverse_of: nil
end
