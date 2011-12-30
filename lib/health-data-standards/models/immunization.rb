class Immunization < Entry
  field :refusalInd, type: Boolean, as: 'refusal_ind'
  field :performer, type: Hash
  field :refusalReason, type: Hash, as: 'refusal_reason'
end