class Assessment < Entry
  field :method,              type: Hash
  field :components,           type: Array, default: []
end
