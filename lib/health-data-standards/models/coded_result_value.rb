class CodedResultValue < ResultValue
  include ThingWithCodes
  field :description, type: String
end