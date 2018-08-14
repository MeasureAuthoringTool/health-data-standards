class Communication < Entry
  # :direction is deprecated as of QDM 5.4
  field :direction,           type: String

  # QDM 5.4 merges all communication types.
  # The following attributes were added for QDM 5.4
  # * category
  # * sender
  # * recipient
  # * medium
  field :category,            type: Hash
  field :sender,              type: Hash
  field :recipient,           type: Hash
  field :medium,              type: Hash
end
