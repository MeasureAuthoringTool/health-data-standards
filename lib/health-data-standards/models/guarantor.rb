class Guarantor
  include Mongoid::Document
  
  embeds_one :organization
  embeds_one :person
  
  field :time, type: Integer
  field :start_time, type: Integer
  field :end_time, type: Integer
  

  def shift_dates(date_diff)
    self.start_time = (self.start_time.nil?) ? nil : self.start_time + date_diff
    self.end_time = (self.end_time.nil?) ? nil : self.end_time + date_diff
  end
end