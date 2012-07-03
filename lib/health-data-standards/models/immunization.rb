class Immunization < Entry
  field :seriesNumber, type: Integer
  
  belongs_to :performer, class_name: "Provider"
  
  embeds_one :medication_product
  
  alias :refusal_ind :negationInd
  alias :refusal_ind= :negationInd=
  alias :refusal_reason :negationReason
  alias :refusal_reason= :negationReason=
  alias :series_number :seriesNumber
  alias :series_number= :seriesNumber=
end