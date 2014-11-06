module HealthDataStandards
  class Immunization < HealthDataStandards::Entry
    field :seriesNumber, type: Integer

    belongs_to :performer, class_name: "HealthDataStandards::Provider"

    embeds_one :medication_product, class_name: "HealthDataStandards::MedicationProduct"

    alias :refusal_ind :negationInd
    alias :refusal_ind= :negationInd=
    alias :refusal_reason :negationReason
    alias :refusal_reason= :negationReason=
    alias :series_number :seriesNumber
    alias :series_number= :seriesNumber=
  end
end