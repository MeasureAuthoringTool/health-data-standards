class Facility
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  # A Facility has a 'Facility Location' code as well as a 'Location Period'.
  # A 'Location Period' is a start time and end time.

  field :name, type: String
  field :code, type: Hash           # Represents the 'FACILITY_LOCATION'
  field :type, type: String

  field :start_time, type: Integer  # Represents Location Period Low
  field :end_time, type: Integer    # Represents Location Period High
  
  embeds_many :addresses, as: :locatable
  embeds_many :telecoms, as: :contactable
end