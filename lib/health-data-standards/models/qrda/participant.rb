module Qrda

  class Participant
	include Mongoid::Document
    embeds_one :identifier, class_name: "Qrda::Id"
    embeds_many :addresses
  end
  
end
