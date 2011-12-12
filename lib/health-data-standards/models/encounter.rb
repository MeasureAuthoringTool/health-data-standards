class Encounter < Entry
  field :performer, type: Hash
  field :facility, type: Hash
  field :admit_type, type: Hash, label: 'admitType'
  field :discharge_disp, type: Hash, label: 'dischargeDisp'
  embeds_one :reason, class_name: "Entry"
end