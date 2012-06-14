class Condition < Entry
  field :type,          type: String
  field :causeOfDeath,  type: Boolean
  field :priority,      type: Integer
  
  embeds_many :treating_provider,  class_name: "Provider"
  
  alias   :cause_of_death         :causeOfDeath
  alias   :cause_of_death=        :causeOfDeath=
end