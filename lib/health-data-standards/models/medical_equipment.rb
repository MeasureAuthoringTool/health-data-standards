class MedicalEquipment < Entry
  
  field :manufacturer, type: String
  field :anatomicalStructure, type: Hash
  field :removalTime, type: Integer

  alias :anatomical_structure :anatomicalStructure
  alias :anatomical_structure= :anatomicalStructure=
  alias :removal_time :removalTime
  alias :removal_time= :removalTime=

   def shift_dates(date_diff)
   	super
    self.removalTime = self.removalTime.nil? ? nil : self.removalTime + date_diff
  end
end