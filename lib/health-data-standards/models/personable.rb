module Personable

  def self.included(receiver)
    receiver.send(:include, Mongoid::Document)
    
    receiver.field :title       , type: String
    receiver.field :given_name  , type: String
    receiver.field :family_name , type: String

    receiver.embeds_many :addresses, as: :locatable
    receiver.embeds_many :telecoms, as: :contactable
  end
end