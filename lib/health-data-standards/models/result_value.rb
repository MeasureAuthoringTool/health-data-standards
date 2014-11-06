module HealthDataStandards
  class ResultValue
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
    embedded_in :entry, class_name: "HealthDataStandards::Entry"
  end
end