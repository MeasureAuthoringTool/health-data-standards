class Encounter < Entry
  field :performer, type: Hash
  field :facility, type: Hash
  field :admiType, type: Hash, as: 'admit_type'
  field :dischargeDisp, type: Hash, as: 'discharge_disp'
  embeds_one :reason, class_name: "Entry"
end