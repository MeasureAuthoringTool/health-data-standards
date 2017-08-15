# QDM 5.0 addition
class AdverseEvent < Entry
  field :type, type: Hash
  field :severity, type: Hash
  field :facility, type: Hash # This is a hash to align with the 'Collections' object
  # TODO: encounter includes a `facility` object. should that be done here? all we care about is the location.
  #field :facilityLocation, as: :facility_location, type: String
end
