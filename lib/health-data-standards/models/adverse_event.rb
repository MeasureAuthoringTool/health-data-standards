# QDM 5.0 addition
class AdverseEvent < Entry
  field :type, type: Hash
  field :severity, type: Hash
  # TODO: encounter includes a `facility` object. should that be done here? all we care about is the location.
  #field :facilityLocation, as: :facility_location, type: String
  embeds_one :facility
end
