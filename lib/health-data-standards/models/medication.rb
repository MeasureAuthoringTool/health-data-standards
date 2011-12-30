class Medication < Entry
  field :administrationTiming, type: Hash, as: 'administration_timing'
  field :freeTextSig, type: String, as: 'free_text_sig'
  field :dose, type: Hash
  field :brandName, type: String, as: 'brand_name'
  field :typeOfMedication, type: Hash, as: 'type_of_medication'
  field :statusOfMedication, type: Hash, as: 'status_of_medication'
  embeds_many :fulfillmentHistory, class_name: 'FulfillmentHistory'
  embeds_many :orderInformation, class_name: 'OrderInformation'
  field :route, type: Hash
  field :site, type: Hash
  field :doseRestriction, type: Hash, as: 'dose_restriction'
  field :fulfillmentInstructions, type: String, as: 'fulfillment_instructions'
  field :indication, type: Hash
  field :productForm, type: Hash, as: 'product_form'
  field :vehicle, type: Hash
  field :reaction, type: Hash
  field :deliveryMethod, type: Hash, as: 'delivery_method'
  field :patientInstructions, type: String, as: 'patient_instructions'
  
  alias :fulfillment_history :fulfillmentHistory
  alias :fulfillment_history= :fulfillmentHistory=
  alias :order_information :orderInformation
  alias :order_information= :orderInformation=
end