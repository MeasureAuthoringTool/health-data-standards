class Immunization < Entry
  field :refusalInd, type: Boolean
  field :refusalReason, type: Hash
  
  belongs_to :performer, class_name: "Provider"
  
  alias :refusal_ind :refusalInd
  alias :refusal_ind= :refusalInd=
  alias :refusal_reason :refusalReason
  alias :refusal_reason= :refusalReason=
end