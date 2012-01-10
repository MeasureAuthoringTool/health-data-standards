class Encounter < Entry
  field :performer, type: Hash
  field :facility, type: Hash
  field :admitType, type: Hash
  field :dischargeDisp, type: Hash
  embeds_one :reason, class_name: "Entry"
  
  alias :admit_type :admitType
  alias :admit_type= :admitType=
  alias :discharge_disp :dischargeDisp
  alias :discharge_disp= :dischargeDisp=
end