module HealthDataStandards
  class PhysicalQuantityResultValue < HealthDataStandards::ResultValue
    field :scalar
    field :units, type: String
  end
end