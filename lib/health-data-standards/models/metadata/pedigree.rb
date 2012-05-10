module Metadata
  class Pedigree
    include Mongoid::Document

    field :organization, type: String
    field :signature, type: String
    field :document_method, type: String
    field :derived, type: Boolean
    
    embeds_one :author, class_name: "Metadata::Author"
    embeds_many  :source_pedigrees, class_name: "Metadata::Pedigree"
    embeds_many  :source_documents, class_name: "Metadata::LinkInfo"
    
  end
end