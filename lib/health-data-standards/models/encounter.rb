class Encounter < Entry
  field :admitType, type: Hash
  field :dischargeDisposition, type: Hash
  field :free_text, type: String
  
  embeds_one :facility, class_name: "OrganizationVisit"
  embeds_one :performer, class_name: "Provider"
  embeds_one :reason, class_name: "Entry"

  alias :admit_type :admitType
  alias :admit_type= :admitType=
  alias :discharge_disposition :dischargeDisposition
  alias :discharge_disposition= :dischargeDisposition=
  alias :freeText :free_text
  alias :freeText= :free_text=
end