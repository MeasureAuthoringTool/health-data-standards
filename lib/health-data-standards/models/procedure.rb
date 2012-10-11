class Procedure < Entry
  field :site,             type: Hash
  field :incisionDateTime, type: Integer
  
  belongs_to :performer, class_name: "Provider"

  alias :incision_date_time :incisionDateTime
  alias :incision_date_time= :incisionDateTime=
end