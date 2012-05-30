class Allergy < Entry
  field :type, type: String
  field :reaction, type: Hash
  field :severity, type: Hash
end