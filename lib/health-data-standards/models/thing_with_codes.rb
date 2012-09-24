module ThingWithCodes
  def self.included(receiver)
    receiver.field :codes, type: Hash, default: {}
  end
  
  def single_code_value?
    codes.size == 1 && codes.first[1].size == 1
  end

  def codes_to_s
    ThingWithCodes.convert_codes_to_s(codes)
  end
  
  def self.convert_codes_to_s(codes)
    codes.map {|code_set, codes| "#{code_set}: #{codes.join(', ')}"}.join(' ')
  end

  # Will return a single code and code set if one exists in the code sets that are
  # passed in. Returns a hash with a key of code and code_set if found, nil otherwise
  def preferred_code(preferred_code_sets, codes_attribute=:codes)
    codes_value = send(codes_attribute)
    matching_code_sets = preferred_code_sets & codes_value.keys
    if matching_code_sets.present?
      code_set = matching_code_sets.first
      {'code' => codes_value[code_set].first, 'code_set' => code_set}
    else
      nil
    end
  end

  # Will return an Array of code and code_set hashes for all codes for this entry
  # except for the preferred_code. It is intended that these codes would be used in
  # the translation elements as childern of a CDA code element
  def translation_codes(preferred_code_sets)
    tx_codes = []
    codes.each_pair do |code_set, code_list|
      code_list.each do |code|
        tx_codes << {'code' => code, 'code_set' => code_set}
      end
    end

    tx_codes - [preferred_code(preferred_code_sets)]
  end

  # Add a code into the Entry
  # @param [String] code the code to add
  # @param [String] code_system the code system that the code belongs to
  def add_code(code, code_system)
    self.codes[code_system] ||= []
    self.codes[code_system] << code
  end
end