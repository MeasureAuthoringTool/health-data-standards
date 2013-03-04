class CDAIdentifier
  include Mongoid::Document

  field :root, type: String
  field :extension, type: String
  embedded_in :entry
end