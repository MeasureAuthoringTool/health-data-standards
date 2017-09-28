class Transfer
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include ThingWithCodes

  field :time, type: Integer 

  embedded_in :encounter, class_name: "Encounter", inverse_of: nil

  def shift_dates(date_diff)
    self.time = (self.time.nil?) ? nil : self.time + date_diff
  end

end
