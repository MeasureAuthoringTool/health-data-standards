module HealthDataStandards
  class Organization
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic

    field :name, type: String

    embeds_many :addresses, as: :locatable, class_name: "HealthDataStandards::Address"
    embeds_many :telecoms, as: :contactable, class_name: "HealthDataStandards::Telecom"
  end
end