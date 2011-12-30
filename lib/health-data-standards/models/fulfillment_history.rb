class FulfillmentHistory
  include Mongoid::Document
  
  field :prescriptionNumber, type: String, as: 'prescription_number'
  field :provider, type: Hash
  field :dispensingPharmacyLocation, type: Hash, as: 'dispensing_pharmacy_location'
  field :dispenseDate, type: Integer, as: 'dispense_date'
  field :quantityDispensed, type: Hash, as: 'quantity_dispensed'
  field :fillNumber, type: Integer, as: 'fill_number'
  field :fillStatus, type: Hash, as: 'fill_status'
end