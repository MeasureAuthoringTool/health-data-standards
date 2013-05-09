class OrderInformation
  include Mongoid::Document
  
  field :orderNumber, type: String
  field :fills, type: Integer
  field :quantityOrdered, type: Hash
  field :orderExpirationDateTime, type: Integer
  field :orderDateTime, type: Integer
  
  belongs_to :provider
  
  alias :order_number :orderNumber
  alias :order_number= :orderNumber=
  alias :quantity_ordered :quantityOrdered
  alias :quantity_ordered= :quantityOrdered=
  alias :order_expiration_date_time :orderExpirationDateTime
  alias :order_expiration_date_time= :orderExpirationDateTime=
  alias :order_date_time :orderDateTime
  alias :order_date_time= :orderDateTime=


  def shift_dates(date_diff)
    self.orderDateTime = self.orderDateTime.nil? ? nil : self.orderDateTime + date_diff
    self.orderExpirationDateTime = self.orderExpirationDateTime.nil? ? nil : self.orderExpirationDateTime + date_diff
  end
end