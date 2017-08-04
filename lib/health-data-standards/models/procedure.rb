class Procedure < Entry

  field :incisionTime,        type: Integer,      as: :incision_time 
  field :ordinality,          type: Hash
  field :source,              type: Hash
  field :anatomical_approach, type: Hash
  field :anatomical_target,   type: Hash
  field :method,              type: Hash
  field :reaction,            type: Hash 
  # The resulting status of a procedure as defined in the QDM documentation. This is different
  # than the status associated with the `Entry` object, which relates to the data criteria
  # status as defined in health-data-standards/lib/hqmf-model/data_criteria.json.
  field :qdm_status,          type: Hash

  # QDM 5.0 addition to Diagnostic Study, Performed
  field :result_date_time,    type: Integer
  # Component attribute is for Diagnostic, Performed which is classified as a procedure
  field :components,          type: Hash
 
  embeds_one :facility

  belongs_to :performer, class_name: "Provider"

  def shift_dates(date_diff)
  	super
  	self.incisionTime = self.incisionTime.nil? ? nil : self.incisionTime + date_diff
  end
end
