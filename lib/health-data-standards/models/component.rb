class Component
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  
  field :type, type: String
  field :code, type: Hash    # Hash of HQMF::Coded
  field :result, type: Hash  # Hash of HQMF::Value
  
end

class ResultComponent < Component
  field :range, type: Hash # Hash of HQMF::Range 

end