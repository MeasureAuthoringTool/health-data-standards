class Immunization < Entry
  field :refusalInd, type: Boolean
  field :performer, type: Hash
  field :refusalReason, type: Hash
  
  alias :refusal_ind :refusalInd
  alias :refusal_ind= :refusalInd=
  alias :refusal_reason :refusalReason
  alias :refusal_reason= :refusalReason=
end