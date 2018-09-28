module Qrda

  class InformationRecipient
	include Mongoid::Document
    embeds_one :identifier, class_name: "Qrda::Id"
  end
  
end
