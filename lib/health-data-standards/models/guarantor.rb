class Guarantor
  include Mongoid::Document
  
  embeds_one :organization
  embeds_one :person
  
  field :start_time, type: Integer
  field :end_time, type: Integer
  
end