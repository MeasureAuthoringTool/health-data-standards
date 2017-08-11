class Communication < Entry
  field :direction,           type: String
  field :relatedTo,           type: Hash, as: :related_to
end
