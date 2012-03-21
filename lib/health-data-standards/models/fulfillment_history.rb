class FulfillmentHistory
  include Mongoid::Document
  
  field :prescriptionNumber, type: String
  field :dispenseDate, type: Integer
  field :quantityDispensed, type: Hash
  field :fillNumber, type: Integer
  field :fillStatus, type: String
  
  belongs_to :provider, class_name: "Provider"

  alias :prescription_number :prescriptionNumber
  alias :prescription_number= :prescriptionNumber=
  alias :dispense_date :dispenseDate
  alias :dispense_date= :dispenseDate=
  alias :quantity_dispensed :quantityDispensed
  alias :quantity_dispensed= :quantityDispensed=
  alias :fill_number :fillNumber
  alias :fill_number= :fillNumber=
  alias :fill_status :fillStatus
  alias :fill_status= :fillStatus=
  alias :prescription_number :prescriptionNumber
  alias :prescription_number= :prescriptionNumber=
end