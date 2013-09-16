module Qrda

  class Device

    include Mongoid::Document

    field :name, type: String
    field :model, type: String

  end
  
end