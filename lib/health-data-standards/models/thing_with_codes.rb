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
  def preferred_code(preferred_code_sets, codes_attribute=:codes, value_set_map=nil)
    codes_value = send(codes_attribute)
    preferred_code_sets = value_set_map ? (preferred_code_sets & value_set_map.collect{|cs| cs["set"]}) : preferred_code_sets
    matching_code_sets = preferred_code_sets & codes_value.keys 
    if matching_code_sets.present?
      if value_set_map
        matching_code_sets.each do |matching_code_set|
           matching_codes = codes_value[matching_code_set] & value_set_map.collect{|cs| cs["set"] == matching_code_set ? cs["values"] : []}.flatten.compact
           if matching_codes.present?
             return {'code' => matching_codes.first, 'code_set' => matching_code_set}
           end
        end
      else
      code_set = matching_code_sets.first
      {'code' => codes_value[code_set].first, 'code_set' => code_set}
      end
    else
      nil
    end
  end

  # Will return an Array of code and code_set hashes for all codes for this entry
  # except for the preferred_code. It is intended that these codes would be used in
  # the translation elements as childern of a CDA code element
  def translation_codes(preferred_code_sets,value_set_map=nil)
    tx_codes = []
    matching_codes = value_set_map ? codes_in_code_set(value_set_map) : codes
    matching_codes.each_pair do |code_set, code_list|
      code_list.each do |code|
        tx_codes << {'code' => code, 'code_set' => code_set}
      end
    end

    tx_codes - [preferred_code(preferred_code_sets, :codes, value_set_map)]
  end

 # Checks if a code is in the list of possible codes
  # @param [Array] code_set an Array of Hashes that describe the values for code sets
  #                The hash has a key of "set" for the code system name and "values"
  #                for the actual code list
  # @return [all codes that are in the code set
  def codes_in_code_set(code_set)
    matching = {}
    codes.keys.each do |code_system|
      matching_codes = []
      matching[code_system] = matching_codes
      all_codes_in_system = code_set.find_all {|set| set['set'] == code_system}
      all_codes_in_system.each do |codes_in_system|
        matching_codes.concat codes_in_system['values'] & codes[code_system]
      end
    end
    matching
  end


  # Add a code into the Entry
  # @param [String] code the code to add
  # @param [String] code_system the code system that the code belongs to
  def add_code(code, code_system)
    self.codes[code_system] ||= []
    self.codes[code_system] << code
  end
end