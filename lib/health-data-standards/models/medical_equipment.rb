class MedicalEquipment < Entry
  
  field :manufacturer, type: String
  field :anatomicalStructure, type: Hash

  alias :anatomical_structure :anatomicalStructure
  alias :anatomical_structure= :anatomicalStructure=
end