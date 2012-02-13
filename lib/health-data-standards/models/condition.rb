class Condition < Entry
  field :type,          type: Hash
  field :causeOfDeath,  type: Boolean

  embeds_many :treating_provider,  class_name: "Provider"
  
  alias   :cause_of_death         :causeOfDeath
  alias   :cause_of_death=        :causeOfDeath=
end