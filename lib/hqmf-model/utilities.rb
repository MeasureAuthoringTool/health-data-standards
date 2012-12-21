
module HQMF
  module Conversion
    module Utilities
      def build_hash(source, elements)
        hash = {}
        elements.each do |element|
          value = source.send(element)
          hash[element] = value unless value.nil?
        end
        hash
      end

      def json_array(elements) 
        return nil if elements.nil?
        array = []
        elements.each do |element| 
          if (element.is_a? OpenStruct)
            array << openstruct_to_json(element)
          else
            array << element.to_json 
          end
        end
        array.compact!
        (array.empty?) ? nil : array
      end
      
      def openstruct_to_json(element)
        json = {}
        element.marshal_dump.each do |key,value|
          if value.is_a? OpenStruct
            json[key] = openstruct_to_json(value) 
          elsif (value.class.to_s.split("::").first.start_with? 'HQMF')
            json[key] = value.to_json
          else
            json[key] = value
          end
        end
        json
      end
      
      def check_equality(left,right)
        same = true
        left.instance_variables.each do |variable|
          same &&= left.instance_variable_get(variable) == right.instance_variable_get(variable)
        end
        same
      end
      
    end
  end
end
