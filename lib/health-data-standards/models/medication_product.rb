class MedicationProduct
  include Mongoid::Document
  
  embedded_in :medication
  embeds_one :organization
  
  field :productName, String
  field :brandName, String
  field :codedProductName, Hash
  field :codedBrandName, Hash
  
end