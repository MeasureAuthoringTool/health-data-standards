class Procedure < Entry
  field :type,          type: String
  field :site,          type: Hash
  field :description,   type: String
  
  belongs_to :performer, class_name: "Provider"
end