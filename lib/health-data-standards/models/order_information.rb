class OrderInformation
  include Mongoid::Document
  
  field :orderNumber, type: String, as: 'order_number'
  field :fills, type: Integer
  field :quantityOrdered, type: Hash, as: 'quantity_ordered'
  field :orderExpirationDateTime, type: Integer, as: 'order_expiration_date_time'
  field :orderDateTime, type: Integer, as: 'order_date_time'
end