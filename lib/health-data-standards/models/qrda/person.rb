module Qrda

  class Person
	  include Mongoid::Document
    field :given, type: String
    field :family, type: String
    
	
  end
  
end