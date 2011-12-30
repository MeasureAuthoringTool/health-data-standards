class LabResult < Entry
  field :referenceRange, type: String, as: 'reference_range'
  field :interpretation, type: Hash
end