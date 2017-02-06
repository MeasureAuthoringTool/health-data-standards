# This is used for QDM 5.0 Allergy/Intollerance. The only fields used are type and severity.
class Allergy < Entry
  field :type, type: Hash
  field :reaction, type: Hash
  field :severity, type: Hash
end
