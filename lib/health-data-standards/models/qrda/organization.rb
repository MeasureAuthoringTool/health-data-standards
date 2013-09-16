module Qrda

  class Organization
    include Mongoid::Document
    field :name, type: String
    embeds_many :ids
  end
  
end
