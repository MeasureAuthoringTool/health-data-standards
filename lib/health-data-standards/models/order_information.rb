class OrderInformation
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :orderNumber, as: :order_number, type: String
  field :fills, type: Integer
  field :quantityOrdered, as: :quantity_ordered, type: Hash
  field :orderExpirationDateTime, as: :order_expiration_date_time, type: Integer
  field :orderDateTime, as: :order_date_time, type: Integer
  
  belongs_to :provider


  def shift_dates(date_diff)
    self.orderDateTime = self.orderDateTime.nil? ? nil : self.orderDateTime + date_diff
    self.orderExpirationDateTime = self.orderExpirationDateTime.nil? ? nil : self.orderExpirationDateTime + date_diff
  end
end