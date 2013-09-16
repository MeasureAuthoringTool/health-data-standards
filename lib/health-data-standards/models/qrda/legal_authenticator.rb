module Qrda

  class LegalAuthenticator
    include Mongoid::Document

    field :time, type: Integer
    
    embeds_many :ids
    embeds_one :person
    embeds_one :organization


  end
  
end
