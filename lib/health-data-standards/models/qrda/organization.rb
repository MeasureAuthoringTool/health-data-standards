module Qrda

  class Organization
    include Mongoid::Document
    field :name, type: String
    embeds_many :ids
    embeds_many :addresses, class_name: "HealthDataStandards::Address"
    embeds_many :telecoms, class_name: "HealthDataStandards::Telecom"
  end

end
