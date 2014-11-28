module HealthDataStandards
  class Guarantor
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic

    embeds_one :organization, class_name: "HealthDataStandards::Organization"
    embeds_one :person, class_name: "HealthDataStandards::Person"

    field :time, type: Integer
    field :start_time, type: Integer
    field :end_time, type: Integer


    def shift_dates(date_diff)
      self.start_time = (self.start_time.nil?) ? nil : self.start_time + date_diff
      self.end_time = (self.end_time.nil?) ? nil : self.end_time + date_diff
    end
  end
end