class MedicalEquipment < Entry
  
  embeds_one :manufacturer, class_name: "Organization"
   
end