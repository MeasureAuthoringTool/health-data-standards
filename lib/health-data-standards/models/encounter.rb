class Encounter < Entry
  field :admitType, as: :admit_type, type: Hash
  field :dischargeDisposition, as: :discharge_disposition, type: Hash
  field :admitTime, as: :admit_time, type: Integer
  field :dischargeTime, as: :discharge_time, type: Integer
  field :principalDiagnosis, as: :principal_diagnosis, type: Hash
  field :diagnosis, type: Hash
  
  embeds_one :transferTo, class_name: "Transfer"
  embeds_one :transferFrom, class_name: "Transfer"

  embeds_one :facility, class_name: "HealthDataStandards::Facility"
  embeds_one :reason, class_name: "Entry"

  belongs_to :performer, class_name: "HealthDataStandards::Provider"

  alias :transfer_to :transferTo
  alias :transfer_to= :transferTo=
  alias :transfer_from :transferFrom
  alias :transfer_from= :transferFrom=

  def shift_dates(date_diff)
    super
    if self.facility
      self.facility.shift_dates(date_diff)
    end
    
    self.admitTime = (self.admitTime.nil?) ? nil : self.admitTime + date_diff
    self.dischargeTime = (self.dischargeTime.nil?) ? nil : self.dischargeTime + date_diff
  end

end