class Condition < Entry
  field :type,          type: String
  field :causeOfDeath,  type: Boolean
  field :time_of_death, type: Integer
  field :priority,      type: Integer
  field :name,          type: String
  field :ordinality,    type: Hash
  field :severity,      type: Hash # Currently unsupported by any importers

  embeds_many :treating_provider,  class_name: "Provider"
  
  alias   :cause_of_death         :causeOfDeath
  alias   :cause_of_death=        :causeOfDeath=

  def shift_dates(date_diff)
    super
    self.time_of_death = self.time_of_death.nil? ? nil : self.time_of_death + date_diff
  end
end