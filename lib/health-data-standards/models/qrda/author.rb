module Qrda

  class Author

    include Mongoid::Document
    field :time, type: DateTime, default: Time.now
    embeds_many :ids
    embeds_many :addresses, class_name: "HealthDataStandards::Address"
    embeds_many :telecoms, class_name: "HealthDataStandards::Telecom"
    embeds_one :person, class_name: "Qrda::Person"
    embeds_one :device
    embeds_one :organization, class_name: "Qrda::Organization"

  end

end