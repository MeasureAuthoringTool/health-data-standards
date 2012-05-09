class Support < Entry
  include Mongoid::Document
  
  Types = ["Guardian", "Next of Kin", "Caregiver", "Emergency Contact"]
  
  embeds_one :address
  embeds_one :telecom
  
  field :title, type: String
  field :given_name, type: String
  field :family_name, type: String
  field :mothers_maiden_name, type: String
  field :type, type: String
  field :relationship, type: String
  
  # validates_inclusion_of :type, :in => Types
  
end