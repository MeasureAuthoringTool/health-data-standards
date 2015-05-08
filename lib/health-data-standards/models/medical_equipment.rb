class MedicalEquipment < Entry
  
  field :manufacturer, type: String
  field :anatomicalStructure, as: :anatomical_structure, type: Hash
  field :removalTime, as: :removal_time, type: Integer
  field :anatomical_approach , type: Hash 
  field :reaction, type: Hash 
   def shift_dates(date_diff)
   	super
    self.removalTime = self.removalTime.nil? ? nil : self.removalTime + date_diff
  end
end