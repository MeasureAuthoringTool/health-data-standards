class AdmissionSource
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  embedded_in :encounter, class_name: "Encounter", inverse_of: nil
  
  field :code, type: String

end
