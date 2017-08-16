# QDM 5.0 addition
class AdverseEvent < Entry
  field :type, type: Hash
  field :severity, type: Hash
  field :facility, type: Hash
end
