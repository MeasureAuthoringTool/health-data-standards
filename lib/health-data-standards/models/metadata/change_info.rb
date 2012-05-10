module Metadata
  class ChangeInfo
    include Mongoid::Document
    
    embeds_one :pedigree, class_name: "Metadata::Pedigree"
    
    field :timestamp, type: Time
  end
end
