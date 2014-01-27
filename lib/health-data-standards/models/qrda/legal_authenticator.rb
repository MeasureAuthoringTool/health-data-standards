module Qrda

  class LegalAuthenticator
    include Mongoid::Document

    field :time, type: DateTime, default: Time.now
    field :telecoms, type: Array
    
    embeds_many :ids
    embeds_many :addresses
    embeds_one :person, class_name: "Qrda::Person"
    embeds_one :organization, class_name: "Qrda::Organization"


  end
  
end
