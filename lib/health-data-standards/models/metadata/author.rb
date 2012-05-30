module Metadata
  class Author
    include Mongoid::Document
    
    embedded_in :pedigree, class_name: "Metadata::Pedigree"
    
    Types = %w(authenticator authorcustodiandataEnterer informant 
    legalAuthenticator participant performer recordTarget)
    
    field :name, type: String
    field :type, type: String
    field :role, type: String
    
    validates_inclusion_of :type, in: Types, allow_nil: true
  end
end