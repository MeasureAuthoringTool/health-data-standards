module HQMF
  
  module Converter
  
    class SimpleOperator
      
      TEMPORAL = 'TEMPORAL'
      SUMMARY = 'SUMMARY'
      UNKNOWN = 'UNKNOWN'
      
      VALUE_FIELD_TIMES = {
        'FACILITY_LOCATION_START' => 'FACILITY_LOCATION_ARRIVAL_DATETIME',
        'FACILITY_LOCATION_END' => 'FACILITY_LOCATION_DEPARTURE_DATETIME'
      }
      

      attr_accessor :type, :value, :category, :field, :field_code, :field_time

      def initialize(category, type, value, field = nil, field_code=nil, field_time=nil)
        @category = category
        @type = type
        @value = value
        @field = field
        @field_code = field_code
        @field_time = field_time
      end
      
      def temporal?
        category == TEMPORAL
      end
      def summary?
        category == SUMMARY
      end
      
      def to_json
        json = {}
        json[:category] = @category if @category
        json[:type] = @type if @type
        json[:field] = @field if @field
        json[:field_code] = @field_code if @field_code
        json[:value] = @value.to_json if @value
        json
      end
      
      def field_value_key
        key = HQMF::DataCriteria::VALUE_FIELDS[field_code]
        key = VALUE_FIELD_TIMES["#{key}_#{field_time.to_s.upcase}"] if (field_time) 
        raise "unsupported field value: #{field_code}, #{field}" unless key
        key
      end

      def self.parse_value(value)
        return nil unless value
        return value if value.is_a? String
        if (value[:value])
          # values should be inclusive since we will be asking if it equals the value, ranther than being part of a range
          # if it's an offset we do not care that it is inclusive
          val = HQMF::Value.from_json(JSON.parse(value.to_json))
          val.inclusive=true
          val
        elsif (value[:high] or value[:low])
          HQMF::Range.from_json(JSON.parse(value.to_json))
        elsif (value[:type] == 'CD')
          HQMF::Coded.from_json(JSON.parse(value.to_json))
        elsif (value[:type] == 'ANYNonNull')
          HQMF::AnyValue.from_json(JSON.parse(value.to_json))
        else
          raise "Unexpected value format: #{value.to_json}"
        end
      end
      
      def self.find_category(type)
        return TEMPORAL if HQMF::TemporalReference::TYPES.include? type
        return SUMMARY if HQMF::SubsetOperator::TYPES.include? type
        return UNKNOWN
      end



    end
    
    
    
  end
  


  
end