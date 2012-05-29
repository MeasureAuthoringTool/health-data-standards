class Procedure < Entry
  field :site,          type: Hash
  
  belongs_to :performer, class_name: "Provider"
end