class Transfer
  include Mongoid::Document
  include ThingWithCodes

  field :time, type: Integer 

  embedded_in :encounter, class_name: "Encounter"
end
