class LabResult < Entry
  field :referenceRange, as: :reference_range, type: String
  field :referenceRangeHigh, as: :reference_range_high, type: String
  field :referenceRangeLow, as: :reference_range_low, type: String
  field :interpretation, type: Hash  
  field :reaction,   type: Hash
  field :method,  type: Hash
  
end
