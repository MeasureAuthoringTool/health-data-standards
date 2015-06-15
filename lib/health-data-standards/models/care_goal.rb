class CareGoal < Entry
  field :relatedTo,     type: Hash, as: :related_to
  field :targetOutcome, type: Hash, as: :target_outcome
end
