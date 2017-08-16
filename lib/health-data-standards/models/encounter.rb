class Encounter < Entry
  field :admitType, as: :admit_type, type: Hash
  field :dischargeDisposition, as: :discharge_disposition, type: Hash
  field :admitTime, as: :admit_time, type: Integer
  field :dischargeTime, as: :discharge_time, type: Integer
  field :diagnosis, type: Hash # This is a Hash to align with the 'Collection' object
  field :facility, type: Hash

  embeds_one :principalDiagnosis, class_name: "EncounterPrincipalDiagnosis"
  
  embeds_one :transferTo, class_name: "Transfer"
  embeds_one :transferFrom, class_name: "Transfer"

  embeds_one :admission_source, class_name: "AdmissionSource"
  embeds_one :reason, class_name: "Entry"

  belongs_to :performer, class_name: "Provider"

  alias :transfer_to :transferTo
  alias :transfer_to= :transferTo=
  alias :transfer_from :transferFrom
  alias :transfer_from= :transferFrom=
  alias :principal_diagnosis :principalDiagnosis
  alias :principal_diagnosis= :principalDiagnosis=
  alias :admissionSource :admission_source
  alias :admissionSource= :admission_source=

  def shift_dates(date_diff)
    super
    if self.facility
      self.shift_facility_dates(date_diff)
    end
    
    self.admitTime = (self.admitTime.nil?) ? nil : self.admitTime + date_diff
    self.dischargeTime = (self.dischargeTime.nil?) ? nil : self.dischargeTime + date_diff
  end

  def shift_facility_dates(date_diff)
    # Facility is now stored as a Hash; shift its dates by updating its start_time and end_time values.
    if self.facility
      self.facility['start_time'] += date_diff if self.facility['start_time']
      self.facility['end_time'] += date_diff if self.facility['end_time']
    end
  end

end
