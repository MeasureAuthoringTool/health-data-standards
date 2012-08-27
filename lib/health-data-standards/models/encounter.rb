class Encounter < Entry

  field :admitType, type: Hash
  field :dischargeDisposition, type: Hash
  field :admit_time, type: Integer
  field :discharge_time, type: Integer

  embeds_one :facility
  embeds_one :reason, class_name: "Entry"

  belongs_to :performer, class_name: "Provider"

  alias :admit_type :admitType
  alias :admit_type= :admitType=
  alias :discharge_disposition :dischargeDisposition
  alias :discharge_disposition= :dischargeDisposition=

end