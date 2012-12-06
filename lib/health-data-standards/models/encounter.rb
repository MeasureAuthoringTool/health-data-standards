class Encounter < Entry
  field :admitType, type: Hash
  field :dischargeDisposition, type: Hash
  field :admitTime, type: Integer
  field :dischargeTime, type: Integer
  field :transferTo, type: Hash
  field :transferFrom, type: Hash

  embeds_one :facility
  embeds_one :reason, class_name: "Entry"

  belongs_to :performer, class_name: "Provider"

  alias :admit_time :admitTime
  alias :admit_time= :admitTime=
  alias :admit_type :admitType
  alias :admit_type= :admitType=
  alias :discharge_disposition :dischargeDisposition
  alias :discharge_disposition= :dischargeDisposition=
  alias :discharge_time :dischargeTime
  alias :discharge_time= :dischargeTime=
  alias :transfer_to :transferTo
  alias :transfer_to= :transferTo=
  alias :transfer_from :transferFrom
  alias :transfer_from= :transferFrom=
end