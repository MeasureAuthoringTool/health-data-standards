module QME
  module Importer
    
    # General helpers for working with HL7 data types
    class HL7Helper
      
      # Converts an HL7 timestamp into an Integer
      # @param [String] timestamp the HL7 timestamp. Expects YYYYMMDD format
      # @return [Integer] Date in seconds since the epoch
      def self.timestamp_to_integer(timestamp)
        if timestamp && timestamp.length >= 4
          year = timestamp[0..3].to_i
          month = timestamp.length >= 6 ? timestamp[4..5].to_i : 1
          day = timestamp.length >= 8 ? timestamp[6..7].to_i : 1
          hour = timestamp.length >= 10 ? timestamp[8..9].to_i : 0
          min = timestamp.length >= 12 ? timestamp[10..11].to_i : 0
          sec = timestamp.length >= 14 ? timestamp[12..13].to_i : 0
          
          Time.gm(year, month, day, hour, min, sec).to_i
        else
          nil
        end

      end
    end
  end
end