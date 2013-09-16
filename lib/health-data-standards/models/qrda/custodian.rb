module Qrda

  class Custodian
	include Mongoid::Document
  	embeds_one :person
  	embeds_one :organization

  end
  
end