class MedicalEquipment < Entry
  
  field :manufacturer, type: String
  field :anatomicalStructure, type: Hash
  field :removalTime, type: Integer

  alias :anatomical_structure :anatomicalStructure
  alias :anatomical_structure= :anatomicalStructure=
  alias :removal_time :removalTime
  alias :removal_time= :removalTime=
end