module Qrda

  class Author

    include Mongoid::Document
    embeds_many :ids
    embeds_many :addresses
    embeds_many :telecoms
    embeds_one :person
    embeds_one :device
    embeds_one :organization

  end
  
end