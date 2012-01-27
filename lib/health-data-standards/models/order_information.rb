class OrderInformation
  include Mongoid::Document
  
  field :orderNumber, type: String
  field :fills, type: Integer
  field :quantityOrdered, type: Hash
  field :orderExpirationDateTime, type: Integer
  field :orderDateTime, type: Integer
  
  alias :order_number :orderNumber
  alias :order_number= :orderNumber=
  alias :quantity_ordered :quantityOrdered
  alias :quantity_ordered= :quantityOrdered=
  alias :order_expiration_date_time :orderExpirationDateTime
  alias :order_expiration_date_time= :orderExpirationDateTime=
  alias :order_date_time :orderDateTime
  alias :order_date_time= :orderDateTime=
end