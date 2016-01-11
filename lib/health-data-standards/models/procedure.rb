class Procedure < Entry

  field :incisionTime,        type: Integer,      as: :incision_time 
  field :ordinality,          type: Hash
  field :source,              type: Hash
  field :anatomical_approach, type: Hash
  field :anatomical_target,   type: Hash
  field :method,              type: Hash
  field :reaction,            type: Hash 

  field :radiation_dose,      type: Hash 
  field :radiation_duration,  type: Hash 

  embeds_one :facility

  belongs_to :performer, class_name: "Provider"

  def shift_dates(date_diff)
  	super
  	self.incisionTime = self.incisionTime.nil? ? nil : self.incisionTime + date_diff
  end
end