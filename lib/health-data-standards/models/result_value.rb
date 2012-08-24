class ResultValue
  include Mongoid::Document
  embedded_in :entry
end