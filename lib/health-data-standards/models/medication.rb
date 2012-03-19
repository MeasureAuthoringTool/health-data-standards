class Medication < Entry
  field :administrationTiming, type: Hash
  field :freeTextSig, type: String
  field :dose, type: Hash
  field :typeOfMedication, type: Hash
  field :statusOfMedication, type: Hash
  embeds_many :fulfillmentHistory, class_name: 'FulfillmentHistory'
  embeds_many :orderInformation, class_name: 'OrderInformation'
  embeds_one :medication_product
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
  
  alias :administration_timing :administrationTiming
  alias :administration_timing= :administrationTiming=
  alias :free_text_sig :freeTextSig
  alias :free_text_sig= :freeTextSig=
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
end