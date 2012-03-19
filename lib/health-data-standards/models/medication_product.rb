class MedicationProduct
  include Mongoid::Document
  
  embedded_in :medication
  embeds_one :organization
  
  field :product_name, type: String
  field :brand_name, type: String
  field :coded_product_name, type: Hash
  field :coded_brand_name, type: Hash
  
  
  def preferred_code(preferred_code_sets, attribute)
    send(attribute)
  end
end