class InsuranceProvider
  include Mongoid::Document
  
  embeds_one :payer, class_name: "Organization"
  embeds_many :guarantors, class_name: "Guarantor"
  embeds_one :subscriber, class_name: "Person"
  
  field :type, type: String
  field :time, type: Integer
  field :start_time, type: Integer
  field :end_time, type: Integer
  field :member_id, type: String
  field :relationship, type: Hash
  field :financial_responsibility_type, type: Hash
  field :name, type: String
  
end