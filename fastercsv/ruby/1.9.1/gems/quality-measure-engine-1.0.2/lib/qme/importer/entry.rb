module QME
  module Importer
    # Object that represents a CDA Entry (or act, observation, etc.)
    class Entry
      attr_accessor :start_time, :end_time, :time, :status, :description
      attr_reader :codes, :value

      def initialize 
        @codes = {}
        @value = {}
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
        if event['status']
          entry.status = event['status']
        end
        entry
      end

      # Add a code into the Entry
      # @param [String] code the code to add
      # @param [String] code_system the code system that the code belongs to
      def add_code(code, code_system)
        @codes[code_system] ||= []
        @codes[code_system] << code
      end

      # Sets the value for the entry
      # @param [String] scalar the value
      # @param [String] units the units of the scalar value
      def set_value(scalar, units=nil)
        @value[:scalar] = scalar
        @value[:units] = units
      end

      # Checks if a code is in the list of possible codes
      # @param [Array] code_set an Array of Hashes that describe the values for code sets
      # @return [true, false] whether the code is in the list of desired codes
      def is_in_code_set?(code_set)
        @codes.keys.each do |code_system|
          all_codes_in_system = code_set.find_all {|set| set['set'] == code_system}
          all_codes_in_system.each do |codes_in_system|
            matching_codes = codes_in_system['values'] & @codes[code_system]
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
        if @time
          @time
        elsif @start_time
          @start_time
        else
          @end_time
        end
      end

      # Checks to see if this Entry can be used as a date range
      # @return [true, false] If the Entry has a start and end time returns true, false otherwise.
      def is_date_range?
        (! @start_time.nil?) && (! @end_time.nil?) 
      end

      # Checks to see if this Entry is usable for measure calculation. This means that it contains
      # at least one code and has one of its time properties set (start, end or time)
      # @return [true, false]
      def usable?
        (! @codes.empty?) && ((! @start_time.nil?) || (! @end_time.nil?) || (! @time.nil?))
      end
      
      # Creates a Hash for this Entry
      # @return [Hash] a Hash representing the Entry
      def to_hash
        entry_hash = {}
        entry_hash['codes'] = @codes
        unless @value.empty?
          entry_hash['value'] = @value
        end
        
        if is_date_range?
          entry_hash['start_time'] = @start_time
          entry_hash['end_time'] = @end_time
        else
          entry_hash['time'] = as_point_in_time
        end
        
        if @status
          entry_hash['status'] = @status
        end
        
        if @description
          entry_hash['description'] = @description
        end
        
        entry_hash
      end
    end
  end
end
