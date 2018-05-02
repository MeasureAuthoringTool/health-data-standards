class Medication < Entry
  # administrationTiming is the same as QDM5.3 frequency in Bonnie
  field :administrationTiming, as: :administration_timing, type: Hash
  field :freeTextSig, type: String
  # QDM 5.0 disambiguates dose to be dosage and suppy. 'dose' here represents the QDM 5.0 'dosage'.
  # Bonnie displays this as 'dosage'.
  field :dose, type: Hash
  field :supply, type: Hash
  field :refills, type: Hash
  field :typeOfMedication, as: :type_of_medication, type: Hash
  field :statusOfMedication, as: :status_of_medication, type: Hash
  embeds_many :fulfillmentHistory, class_name: 'FulfillmentHistory'
  embeds_many :orderInformation, class_name: 'OrderInformation'

  field :route, type: Hash
  field :anatomical_approach, type: Hash
  field :doseRestriction, as: :dose_restriction, type: Hash
  field :fulfillmentInstructions, as: :fulfillment_instructions, type: String
  field :indication, type: Hash
  field :productForm, as: :product_form, type: Hash
  field :vehicle, type: Hash
  field :reaction, type: Hash
  field :deliveryMethod, as: :delivery_method, type: Hash
  field :patientInstructions, as: :patient_instructions, type: String
  field :doseIndicator, as: :dose_indicator, type: String

  field :method ,   type: Hash 
  field :active_datetime ,  type: Integer
  field :signed_datetime ,  type: Integer
  
  # This is used for Medicaton, Order. It is the total number of times a dose of a particular
  # medication can be administered. This, coupled with the administrationTiming will
  # give the cumulative medication duration.
  # E.g.
  #  allowedAdministrations = 90 doses
  #  administrationTiming = 1 dose / 12 hours
  #  cumulativeMedicationDuration = allowedAdministrations / administrationTiming * (time conversion)
  #  cumulativeMedicationDuration = (90 doses) * (12 hours)/(1 dose) * (1 day)/(24 hours) = 45 days
  # Medication, Order can't use fulfillmentHistory because the fulfillment of the 
  # medication has not yet happened.
  # This corresponds to 'repeatNumber' in the QRDA representation
  field :allowedAdministrations, as: :allowed_administrations, type: Integer

  # There are currently no importers that support this field
  # It is expected to be a scalar and value, such as 7 days
  field :cumulativeMedicationDuration, as: :cumulative_medication_duration, type: Hash

  alias :fulfillment_history :fulfillmentHistory
  alias :fulfillment_history= :fulfillmentHistory=
  alias :order_information :orderInformation
  alias :order_information= :orderInformation=

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
