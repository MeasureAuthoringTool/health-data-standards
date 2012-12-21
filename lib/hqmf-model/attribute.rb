module HQMF
  
  class Attribute
    include HQMF::Conversion::Utilities
    attr_reader :id,:code,:value,:unit,:name
    # @param [String] id
    # @param [String] code
    # @param [String] value
    # @param [String] unit
    # @param [String] name
    def initialize(id,code,value,unit,name)
      @id = id
      @code = code
      @value = value
      @unit = unit
      @name = name
    end
  
    def self.from_json(json)
      id = json["id"] if json["id"]
      code = json["code"] if json["code"]
      value = json["value"] if json["value"]
      unit = json["unit"] if json["unit"]
      name = json["name"] if json["name"]
    
      HQMF::Attribute.new(id,code,value,unit,name)
    end
  
    def to_json
      json = build_hash(self, [:id,:code,:value,:unit,:name])
      json
    end
  
  end
end
