class FulfillmentHistory
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :prescriptionNumber, as: :prescription_number, type: String
  field :dispenseDate, as: :dispense_date, type: Integer
  field :quantityDispensed, as: :quantity_dispensed, type: Hash
  field :fillNumber, as: :fill_number, type: Integer
  field :fillStatus, as: :fill_status, type: String
  
  belongs_to :provider, class_name: "Provider"

  def shift_dates(date_diff)
    self.dispenseDate = (self.dispenseDate.nil?) ? nil : self.dispenseDate + date_diff
  end
end