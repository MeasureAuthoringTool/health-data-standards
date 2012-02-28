class OrganizationVisit
  include Mongoid::Document

  field :start_time, type: Integer
  field :end_time, type: Integer

  embedded_in :encounter
  belongs_to :organization
end