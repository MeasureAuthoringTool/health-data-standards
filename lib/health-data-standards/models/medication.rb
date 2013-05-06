class Medication < Entry
  field :administrationTiming, type: Hash
  field :freeTextSig, type: String
  field :dose, type: Hash
  field :typeOfMedication, type: Hash
  field :statusOfMedication, type: Hash
  embeds_many :fulfillmentHistory, class_name: 'FulfillmentHistory'
  embeds_many :orderInformation, class_name: 'OrderInformation'

  field :route, type: Hash
  field :site, type: Hash
  field :doseRestriction, type: Hash
  field :fulfillmentInstructions, type: String
  field :indication, type: Hash
  field :productForm, type: Hash
  field :vehicle, type: Hash
  field :reaction, type: Hash
  field :deliveryMethod, type: Hash
  field :patientInstructions, type: String
  field :doseIndicator, type: String

  # There are currently no importers that support this field
  # It is expected to be a scalar and value, such as 7 days
  field :cumulativeMedicationDuration, type: Hash
  
  alias :administration_timing :administrationTiming
  alias :administration_timing= :administrationTiming=
  alias :type_of_medication :typeOfMedication
  alias :type_of_medication= :typeOfMedication=
  alias :status_of_medication :statusOfMedication
  alias :status_of_medication= :statusOfMedication=
  alias :fulfillment_history :fulfillmentHistory
  alias :fulfillment_history= :fulfillmentHistory=
  alias :order_information :orderInformation
  alias :order_information= :orderInformation=
  alias :dose_restriction :doseRestriction
  alias :dose_restriction= :doseRestriction=
  alias :fulfillment_instructions :fulfillmentInstructions
  alias :fulfillment_instructions= :fulfillmentInstructions=
  alias :product_form :productForm
  alias :product_form= :productForm=
  alias :delivery_method :deliveryMethod
  alias :delivery_method= :deliveryMethod=
  alias :patient_instructions :patientInstructions
  alias :patient_instructions= :patientInstructions=
  alias :dose_indicator :doseIndicator
  alias :dose_indicator= :doseIndicator=
  alias :cumulative_medication_duration :cumulativeMedicationDuration
  alias :cumulative_medication_duration= :cumulativeMedicationDuration=

  def shift_dates(date_diff)
    super
    self.fulfillmentHistory.each do |fh|
      fh.shift_dates(date_diff)
    end
    self.orderInformation.each do |oi|
      oi.shift_dates(date_diff)
    end
  end

end