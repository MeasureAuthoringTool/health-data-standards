class Procedure < Entry
  field :site,             type: Hash
  field :incisionDateTime, type: Integer
  
  belongs_to :performer, class_name: "Provider"
end