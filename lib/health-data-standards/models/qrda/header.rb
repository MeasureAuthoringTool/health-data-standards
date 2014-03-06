module Qrda

  class Header
    include Mongoid::Document
    embeds_one :identifier, class_name: "Qrda::Id"
    embeds_many :authors
    embeds_one :custodian
    embeds_one :legal_authenticator
    embeds_many :performers, class_name: "Provider"

    field  :time , type: DateTime, default: Time.now
  end
  
end