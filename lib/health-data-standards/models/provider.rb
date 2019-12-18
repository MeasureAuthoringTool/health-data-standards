class Provider
  include Personable
  include Mongoid::Tree
  include Mongoid::Attributes::Dynamic

  NPI_OID = '2.16.840.1.113883.4.6'
  TAX_ID_OID = '2.16.840.1.113883.4.2'
  CCN_OID = '2.16.840.1.113883.4.336'.freeze

  field :specialty   , type: String
  field :phone       , type: String

  validates_uniqueness_of :npi, allow_blank: true

  embeds_one :organization
  embeds_many :cda_identifiers, class_name: "CDAIdentifier", as: :cda_identifiable

  scope :by_npi, ->(an_npi){ where("cda_identifiers.root" => NPI_OID, "cda_identifiers.extension" => an_npi)}

  def npi=(an_npi)
    cda_id_npi = self.cda_identifiers.where(root: NPI_OID).first
    if cda_id_npi
      cda_id_npi.extension = an_npi
      cda_id_npi.save!
    else
      self.cda_identifiers << CDAIdentifier.new(root: NPI_OID, extension: an_npi)
    end
  end

  def npi
    cda_id_npi = self.cda_identifiers.where(root: NPI_OID).first
    cda_id_npi ? cda_id_npi.extension : nil
  end

  def tin=(a_tin)
    self.cda_identifiers << CDAIdentifier.new(root: TAX_ID_OID, extension: a_tin)
  end

  def tin
    cda_id_tin = self.cda_identifiers.where(root: TAX_ID_OID).first
    cda_id_tin ? cda_id_tin.extension : nil
  end

  def ccn=(a_ccn)
    cda_id_ccn = self.cda_identifiers.where(root: CCN_OID).first
    if cda_id_ccn
      cda_id_ccn.extension = a_ccn
      cda_id_ccn.save!
    else
      self.cda_identifiers << CDAIdentifier.new(root: CCN_OID, extension: a_ccn)
    end
  end

  def ccn
    cda_id_ccn = self.cda_identifiers.where(root: CCN_OID).first
    cda_id_ccn ? cda_id_ccn.extension : nil
  end

  def records(effective_date=nil)
    Record.by_provider(self, effective_date)
  end

  # validate the NPI, should be 10 or 15 digits total with the final digit being a
  # checksum using the Luhn algorithm with additional special handling as described in
  # https://www.cms.gov/NationalProvIdentStand/Downloads/NPIcheckdigit.pdf
  def self.valid_npi?(npi)
    return false unless npi
    return false if npi.length != 10 and npi.length != 15
    return false if npi.gsub(/\d/, '').length > 0 # npi must be all digits
    return false if npi.length == 15 and (npi =~ /^80840/)==nil # 15 digit npi must start with 80840

    # checksum is always calculated as if 80840 prefix is present
    if npi.length==10
      npi = '80840'+npi
    end

    return luhn_checksum(npi[0,14])==npi[14]
  end

  def self.luhn_checksum(num)
    double = {'0' => 0, '1' => 2, '2' => 4, '3' => 6, '4' => 8, '5' => 1, '6' => 3, '7' => 5, '8' => 7, '9' => 9}
    sum = 0
    num.reverse!
    num.split("").each_with_index do |char, i|
      if (i%2)==0
        sum+=double[char]
      else
        sum+=char.to_i
      end
    end
    sum = (9*sum)%10

    return sum.to_s
  end

  # When using the ProviderImporter class this method will be called if a parsed
  # provider can not be found in the database if the parsed provider does not
  # have an npi number associated with it.  This allows applications to handle
  # this how they see fit by redefining this method.  The default implementation
  # is to return an orphan parent (the singular provider without an NPI) if one
  # exists.  If this method call return nil an attempt will be made to discover
  # the Provider by name matching and if that fails a Provider will be created
  # in the db based on the information in the parsed hash.
  def self.resolve_provider(provider_hash, patient=nil)
    Provider.where(:npi => nil).first
  end
end
