module HealthDataStandards
  class Allergy < HealthDataStandards::Entry
    field :type, type: Hash
    field :reaction, type: Hash
    field :severity, type: Hash
  end
end