class Immunization < Entry
  field :refusalInd, type: Boolean
  field :refusalReason, type: Hash
  field :seriesNumber, type: Integer
  
  belongs_to :performer, class_name: "Provider"
  
  embeds_one :medication_product
  
  alias :refusal_ind :refusalInd
  alias :refusal_ind= :refusalInd=
  alias :refusal_reason :refusalReason
  alias :refusal_reason= :refusalReason=
  alias :series_number :seriesNumber
  alias :series_number= :seriesNumber=
end