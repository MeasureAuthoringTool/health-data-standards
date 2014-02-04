class Provider
  include Personable
  include Mongoid::Tree
  
  field :npi         , type: String
  field :tin         , type: String
  field :specialty   , type: String
  field :phone       , type: String
  
  validates_uniqueness_of :npi, allow_blank: true
  
  embeds_one :organization


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

  #this is intentially left blank. When using the ProviderImporter class this method will be called
  # if a parsed provider can not be found in the database if the parsed provider does not have an 
  # npi number associated with it.  This allows applications to handle this how they see fit by redefining
  # this method.  If this method call return nil an attempt will be made to discover the Provider by name 
  # matching and if that fails a Provider will be created in the db based on the information in the parsed
  #  hase
  def self.resolve_provider(provider_hash)

  end
end