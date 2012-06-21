class Entry

  include Mongoid::Document

  # embedded_in :entry_list, polymorphic: true
  
  embedded_in :record
  
  field :description, type: String
  field :specifics, type: String
  field :time, type: Integer
  field :start_time, type: Integer
  field :end_time, type: Integer
  field :status, type: String
  field :codes, type: Hash, default: {}
  field :value, type: Hash, default: {}
  field :free_text, type: String
  field :mood_code, type: String, default: "EVN"
  
  attr_protected :version
  attr_protected :_id
  attr_protected :created_at
  attr_protected :updated_at

  def single_code_value?
    codes.size == 1 && codes.first[1].size == 1
  end

  def codes_to_s
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
  
  def times_to_s
    if start_time.present? || end_time.present?
      start_string = start_time ? Time.at(start_time).utc.to_formatted_s(:long_ordinal) : 'UNK'
      end_string = end_time ? Time.at(end_time).utc.to_formatted_s(:long_ordinal) : 'UNK'
      "#{start_string} - #{end_string}"
    elsif time.present?
      Time.at(time).utc.to_formatted_s(:long_ordinal)
    end
  end
  
  # def to_effective_time(xml)
  #   if time.present?
  #     xml.effectiveTime("value" => Time.at(time).utc.to_formatted_s(:number))
  #   else
  #     xml.effectiveTime do
  #       if start_time.present?
  #         xml.low("value" => Time.at(start_time).utc.to_formatted_s(:number))
  #       else
  #         xml.low("nullFlavor" => "UNK")
  #       end
  #       if end_time.present?
  #         xml.high("value" => Time.at(end_time).utc.to_formatted_s(:number))          
  #       else
  #         xml.high("nullFlavor" => "UNK")          
  #       end
  #     end
  #   end
  # end
  
  def self.from_event_hash(event)
    entry = Entry.new
    if event['code']
      entry.add_code(event['code'], event['code_set'])
    end
    entry.time = event['time']
    if event['value']
      entry.set_value(event['value'], event['unit'])
    end
    if event['description']
      entry.description = event['description']
    end
    if event['specifics']
      entry.specifics = event['specifics']
    end
    if event['status']
      entry.status = event['status']
    end
    entry
  end

  # Add a code into the Entry
  # @param [String] code the code to add
  # @param [String] code_system the code system that the code belongs to
  def add_code(code, code_system)
    self.codes[code_system] ||= []
    self.codes[code_system] << code
  end

  # Sets the value for the entry
  # @param [String] scalar the value
  # @param [String] units the units of the scalar value
  def set_value(scalar, units=nil)
    self.value[:scalar] = scalar
    self.value[:units] = units
  end

  # Checks if a code is in the list of possible codes
  # @param [Array] code_set an Array of Hashes that describe the values for code sets
  # @return [true, false] whether the code is in the list of desired codes
  def is_in_code_set?(code_set)
    codes.keys.each do |code_system|
      all_codes_in_system = code_set.find_all {|set| set['set'] == code_system}
      all_codes_in_system.each do |codes_in_system|
        matching_codes = codes_in_system['values'] & codes[code_system]
        if matching_codes.length > 0
          return true
        end
      end
    end
    false
  end

  # Tries to find a single point in time for this entry. Will first return time if it is present,
  # then fall back to start_time and finally end_time
  def as_point_in_time
    if time
      time
    elsif start_time
      start_time
    else
      end_time
    end
  end

  # Checks to see if this Entry can be used as a date range
  # @return [true, false] If the Entry has a start and end time returns true, false otherwise.
  def is_date_range?
    start_time.present? && end_time.present?
  end

  # Checks to see if this Entry is usable for measure calculation. This means that it contains
  # at least one code and has one of its time properties set (start, end or time)
  # @return [true, false]
  def usable?
    codes.present? && (start_time.present? || end_time.present? || time.present?)
  end
  
  # Compares hash values to determine equality
  def ==(other)
    self.class==other.class && self.hash==other.hash
  end
  
  # Returns the hash value, calculating it if not already done
  def hash
    @hash || calculate_hash!
  end
  
  # Calculates a hash value for this entry
  def calculate_hash!
    entry_hash = to_hash
    entry_hash['description']=nil
    @hash = entry_hash.hash
  end
  
  # Creates a Hash for this Entry
  # @return [Hash] a Hash representing the Entry
  def to_hash
    entry_hash = {}
    entry_hash['codes'] = codes
    unless value.empty?
      entry_hash['value'] = value
    end
    
    if is_date_range?
      entry_hash['start_time'] = start_time
      entry_hash['end_time'] = end_time
    else
      entry_hash['time'] = as_point_in_time
    end
    
    if status
      entry_hash['status'] = status
    end
    
    if description
      entry_hash['description'] = description
    end

    if specifics
      entry_hash['specifics'] = specifics
    end
    
    entry_hash
  end
end