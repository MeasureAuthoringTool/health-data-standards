module Qrda

  class Header

    embeds_many :authors
    embeds_one :custodian
    embeds_one :legal_authenticator
    embeds_many :performers
    
    has_one :record_target

  end
  
end