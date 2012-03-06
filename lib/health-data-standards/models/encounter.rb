class Encounter < Entry
  field :admitType, type: Hash
  field :dischargeDisposition, type: Hash
  field :free_text, type: String
  
  embeds_one :facility, class_name: "OrganizationVisit"
  embeds_one :reason, class_name: "Entry"
  
  belongs_to :performer, class_name: "Provider"

  alias :admit_type :admitType
  alias :admit_type= :admitType=
  alias :discharge_disposition :dischargeDisposition
  alias :discharge_disposition= :dischargeDisposition=
  alias :freeText :free_text
  alias :freeText= :free_text=
end