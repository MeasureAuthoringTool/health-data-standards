class Procedure < Entry
  field :type,          type: String
  field :performer,     type: Hash
  field :site,          type: Hash
  field :description,   type: String
end