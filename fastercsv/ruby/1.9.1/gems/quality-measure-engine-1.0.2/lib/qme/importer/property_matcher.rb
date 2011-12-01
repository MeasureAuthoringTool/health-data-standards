module QME
  module Importer
    # Compares Entry objects to measure definition properties.
    class PropertyMatcher
      
      def initialize(property_description)
        @property_description = property_description
      end
      
      # Looks through an Array of Entry objects to see if any of them match the codes needed
      # for a measure property. Will return different types of Arrays depending on the schema
      # of the property
      # @param [Array] entry_list an Array of Entry objects
      # @return An Array of goodness that is ready to be inserted into a measure property on a patient record
      def match(entry_list)
        if is_date_list_property?
          extract_date_list(entry_list)
        elsif is_value_date_property?
          extract_value_date_list(entry_list)
        elsif is_date_range_property?
          extract_date_range_list(entry_list)
        else
          raise "Unknown property schema for property #{@property_description['description']}"
        end
      end
      
      # Extracts the dates of any CDA entries that meet the code set defined for measure property.
      #
      # @param [Array] entry_list an Array of Entry objects
      # @return [Array] Provides an Array of dates for entries that have codes inside of the measure code set
      #         Dates will be represented as an Integer in seconds since the epoch
      def extract_date_list(entry_list)
        basic_extractor(entry_list) do |entry, matching_values|
          matching_values << entry.as_point_in_time
        end
      end
      
      # Extracts the dates of any CDA entries that meet the code set defined for measure property.
      #
      # @param [Array] entry_list an Array of Entry objects
      # @return [Array] Provides an Array of Hashes for entries that have codes inside of the measure code set
      #         Hashes will have a "value" and "date" property containing the respective data
      def extract_value_date_list(entry_list)
        basic_extractor(entry_list) do |entry, matching_values|
          value = entry.value[:scalar]
          if value
            if @property_description['items']['properties']['value']['type'] == 'number'
              value = value.to_f
            end
            
            matching_values << {'date' => entry.as_point_in_time, 'value' => value}
          end
        end
      end
      
      # Extracts the dates of any CDA entries that meet the code set defined for measure property.
      #
      # @param [Array] entry_list an Array of Entry objects
      # @return [Array] Provides an Array of Hashes for entries that have codes inside of the measure code set
      #         Hashes will have a "start" and "end" property containing the respective data
      def extract_date_range_list(entry_list)
        basic_extractor(entry_list) do |entry, matching_values|
          if entry.is_date_range?
            matching_values << {'start' => entry.start_time, 'end' => entry.end_time}
          end
        end
      end
      
      # Determines if the property is a list of dates
      # @return [Boolean] true of false depending on the property
      def is_date_list_property?
        @property_description['type'] == 'array' && @property_description['items']['type'] == 'number'
      end

      # Determines if the property is a list of date and value hashes
      # @return [Boolean] true of false depending on the property
      def is_value_date_property?
        @property_description['type'] == 'array' && @property_description['items']['type'] == 'object' &&
        @property_description['items']['properties']['value'] &&
        @property_description['items']['properties']['date']
      end
      
      # Determines if the property is a list of date ranges represented by a Hash with start and end
      # keys
      # @return [Boolean] true of false depending on the property
      def is_date_range_property?
        @property_description['type'] == 'array' && @property_description['items']['type'] == 'object' &&
        @property_description['items']['properties']['start'] &&
        @property_description['items']['properties']['end']
      end
      
      private
      
      def basic_extractor(entry_list)
        matching_values = []
        entry_list.each do |entry|
          if entry.usable?
            if entry.is_in_code_set?(@property_description['codes'])
              yield entry, matching_values
            end
          end
        end
        
        matching_values
      end
    end
  end
end