module Qrda

  class Custodian
	include Mongoid::Document
    embeds_many :ids
  	embeds_one :person, class_name: "Qrda::Person"
  	embeds_one :organization, class_name: "Qrda::Organization"

  end
  
end