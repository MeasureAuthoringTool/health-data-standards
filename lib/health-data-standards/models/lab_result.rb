class LabResult < Entry
  field :referenceRange, type: String
  field :interpretation, type: Hash
  
  alias :reference_range :referenceRange
  alias :reference_range= :referenceRange=
  
  
  def value_type
    value[:units] ? :quantity : :integer
  end
  
end