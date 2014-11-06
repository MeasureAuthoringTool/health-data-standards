module HealthDataStandards
  class LabResult < HealthDataStandards::Entry
    field :referenceRange, as: :reference_range, type: String
    field :interpretation, type: Hash
  end
end