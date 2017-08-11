class Assessment < Entry
  field :components,          type: Hash
  field :method,              type: Hash
  field :relatedTo,           type: Hash, as: :related_to
end
