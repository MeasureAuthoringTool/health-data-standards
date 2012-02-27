class OrganizationVisit
  include Mongoid::Document

  field :start, type: Integer
  field :end, type: Integer

  embedded_in :encounter
  belongs_to :organization
end