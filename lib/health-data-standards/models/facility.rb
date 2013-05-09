class Facility
  include Mongoid::Document
  
  field :name, type: String
  field :code, type: Hash
  
  field :start_time, type: Integer
  field :end_time, type: Integer
  
  embeds_many :addresses, as: :locatable
  embeds_many :telecoms, as: :contactable

   def shift_dates(date_diff)
    self.start_time = (self.start_time.nil?) ? nil : self.start_time + date_diff
    self.end_time = (self.end_time.nil?) ? nil : self.end_time + date_diff
  end
end