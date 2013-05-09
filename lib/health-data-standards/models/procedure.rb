class Procedure < Entry
  field :site,                type: Hash
  field :incisionTime,        type: Integer
  field :ordinality,          type: Hash
  field :source,              type: Hash
  
  belongs_to :performer, class_name: "Provider"

  alias :incision_time :incisionTime
  alias :incision_time= :incisionTime=

  def shift_dates(date_diff)
  	super
  	self.incisionTime = self.incisionTime.nil? ? nil : self.incisionTime + date_diff
  end
end