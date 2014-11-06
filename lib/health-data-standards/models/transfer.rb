module HealthDataStandards
  class Transfer
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    include HealthDataStandards::ThingWithCodes

    field :time, type: Integer

    embedded_in :encounter, class_name: "HealthDataStandards::Encounter"
  end
end