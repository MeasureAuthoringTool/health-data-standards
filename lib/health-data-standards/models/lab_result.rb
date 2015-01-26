class LabResult < Entry
  field :referenceRange, as: :reference_range, type: String
  field :interpretation, type: Hash  
  field :reaction,   type: Hash
  field :method,  type: Hash

  
end