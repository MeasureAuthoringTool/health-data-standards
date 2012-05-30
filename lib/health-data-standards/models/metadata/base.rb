# Represents the metadata associated with a hData section
module Metadata
  NS = 'http://www.hl7.org/schemas/hdata/2009/11/metadata'

  class Base
    include Mongoid::Document
 
    field :mime_types, type: Array
    field :confidentiality, type: String
    field :original_creation_time, type: Time
    
    embedded_in :entry
    
    embeds_many :pedigrees, class_name: "Metadata::Pedigree"
    embeds_many :modified_dates, class_name: "Metadata::ChangeInfo"
    embeds_many :copied_dates, class_name: "Metadata::ChangeInfo"
    embeds_many :linked_documents, class_name: "Metadata::LinkInfo"

  end
end