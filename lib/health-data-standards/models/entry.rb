class Entry

  include Mongoid::Document
  include ThingWithCodes

  # embedded_in :entry_list, polymorphic: true
  
  embedded_in :record
  embeds_one :cda_identifier, class_name: "CDAIdentifier"
  embeds_many :values, class_name: "ResultValue"
  
  field :description, type: String
  field :specifics, type: String
  field :time, type: Integer
  field :start_time, type: Integer
  field :end_time, type: Integer
  field :status_code, type: Hash
  field :free_text, type: String
  field :mood_code, type: String, default: "EVN"
  field :negationInd, type: Boolean
  field :negationReason, type: Hash
  field :oid, type: String
  field :reason, type: Hash
  
  alias :negation_ind :negationInd
  alias :negation_ind= :negationInd=
  alias :negation_reason :negationReason
  alias :negation_reason= :negationReason=
  
  attr_protected :version
  attr_protected :_id
  attr_protected :created_at
  attr_protected :updated_at
  
  def times_to_s(nil_string='UNK')
    if start_time.present? || end_time.present?
      start_string = start_time ? Entry.time_to_s(start_time) : nil_string
      end_string = end_time ? Entry.time_to_s(end_time) : nil_string
      "#{start_string} - #{end_string}"
    elsif time.present?
      Time.at(time).utc.to_formatted_s(:long_ordinal)
    end
  end
  
  def self.time_to_s(input_time)
    Time.at(input_time).utc.to_formatted_s(:long_ordinal)
  end
  
  # Entry previously had a status field that dropped the code set and converted
  # the status to a String. Entry now preserves the original code and code set.
  # This method is here to maintain backwards compatibility.
  def status
    if status_code.present?
      if status_code['HL7 ActStatus']
        status_code['HL7 ActStatus'].first()
      elsif status_code['SNOMED-CT']
        case status_code['SNOMED-CT'].first()
        when '55561003'
          'active'
        when '73425007'
          'inactive'
        when '413322009'      
          'resolved'
        end
      end
    end
  end
  
  def status=(status_text)
    case status_text.to_s # makes sure that any Symbols passed in are stringified
    when 'active'
      self.status_code = {'SNOMED-CT' => ['55561003'], 'HL7 ActStatus' => ['active']}
    when 'inactive'
      self.status_code = {'SNOMED-CT' => ['73425007']}
    when 'resolved'
      self.status_code = {'SNOMED-CT' => ['413322009']}
    else
      self.status_code = {'HL7 ActStatus' => [status_text]}
    end
  end
  
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

  # Sets the value for the entry
  # @param [String] scalar the value
  # @param [String] units the units of the scalar value
  def set_value(scalar, units=nil)
    pq_value = PhysicalQuantityResultValue.new(scalar: scalar, units: units)
    self.values << pq_value
  end

  # Checks if a code is in the list of possible codes
  # @param [Array] code_set an Array of Hashes that describe the values for code sets
  #                The hash has a key of "set" for the code system name and "values"
  #                for the actual code list
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
    unless values.empty?
      entry_hash['value'] = values
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


  def shift_dates(date_diff)
    self.start_time = self.start_time.nil? ? nil : (self.start_time + date_diff)
    self.end_time = self.end_time.nil? ? nil : (self.end_time + date_diff)
    self.time = self.time.nil? ? nil : (self.time + date_diff)
  end

end