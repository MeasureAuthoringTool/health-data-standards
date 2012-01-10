class Encounter < Entry
  field :performer, type: Hash
  field :facility, type: Hash
  field :admitType, type: Hash
  field :dischargeDisp, type: Hash
  embeds_one :reason, class_name: "Entry"
  
  alias admitType, admit_type
  alias dischargeDisp, discharge_disp
end