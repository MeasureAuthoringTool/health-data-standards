class Guarantor
  include Mongoid::Document
  
  embeds_one :organization
  embeds_one :person
  
  field :time, type: Integer
  field :start_time, type: Integer
  field :end_time, type: Integer
  
end