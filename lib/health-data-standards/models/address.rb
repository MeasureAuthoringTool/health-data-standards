class Address
  include Mongoid::Document

  before_save :compute_hash

  field :street, type: Array, default: []
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :country, type: String
  field :use, type: String
  field :address_hash, type: String

  embedded_in :locatable, polymorphic: true

  def compute_hash
        plainText = [ self.street, self.city, self.state, self.zip, self.country ].flatten.reject { |c| c.blank? }.join(", ")
        self.address_hash = Digest::MD5.hexdigest(plainText)
  end

end