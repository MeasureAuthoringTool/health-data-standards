module HealthDataStandards
  class CodedResultValue < HealthDataStandards::ResultValue
    include HealthDataStandards::ThingWithCodes
    field :description, type: String
  end
end