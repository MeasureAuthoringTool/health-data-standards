class MedicationProduct
  include Mongoid::Document
  
  embedded_in :medication
  embeds_one :organization
  
  field :productName, type: String
  field :brandName, type: String
  field :codedProductName, type: Hash
  field :codedBrandName, type: Hash
  
end