module HQMF
  class Attribute
    include HQMF::Conversion::Utilities
    attr_reader :id,:code,:value,:unit,:name,:id_obj,:code_obj,:value_obj
    # @param [String] id
    # @param [String] code
    # @param [String] value
    # @param [String] unit
    # @param [String] name
    # @param [HQMF::Identifier] id_obj
    # @param [HQMF::Coded] code_obj
    # @param [Object] value_obj
    def initialize(id,code,value,unit,name,id_obj=nil,code_obj=nil,value_obj=nil)
      @id = id
      @code = code
      @value = value
      @unit = unit
      @name = name
      # enhanced model
      @id_obj = id_obj
      @code_obj = code_obj
      @value_obj = value_obj
    end

    def self.from_json(json)
      json = json.with_indifferent_access

      id = json["id"] if json["id"]
      code = json["code"] if json["code"]
      value = json["value"] if json["value"]
      unit = json["unit"] if json["unit"]
      name = json["name"] if json["name"]
      # enhanced model
      id_obj = HQMF::Identifier::from_json(json["id_obj"]) if json["id_obj"]
      code_obj = HQMF::Coded::from_json(json["code_obj"]) if json["code_obj"]
      value_obj = nil
      if (json["value_obj"])
        json_value = json["value_obj"].with_indifferent_access
        case json_value["type"]
        when 'II'
          value_obj = HQMF::Identifier::from_json(json_value)
        when 'CD'
          value_obj = HQMF::Coded::from_json(json_value)
        when 'ED'
          value_obj = HQMF::ED::from_json(json_value)
        else
          value_obj = json_value["value"].nil? ? HQMF::AnyValue::from_json(json_value) : HQMF::GenericValueContainer::from_json(json_value)
        end
      end

      HQMF::Attribute.new(id,code,value,unit,name,id_obj,code_obj,value_obj)
    end

    def to_json
      json = build_hash(self, [:id,:code,:value,:unit,:name])
      json[:id_obj] = @id_obj.to_json if @id_obj
      json[:code_obj] = @code_obj.to_json if @code_obj
      json[:value_obj] = @value_obj.to_json if @value_obj
      json
    end

  end
end
