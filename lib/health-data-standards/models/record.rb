class Record
  include Mongoid::Document
  
  field :first, type: String
  field :last, type: String
  field :gender, type: String
  field :birthdate, type: Integer
  field :effective_time, type: Integer
  field :race, type: Hash
  field :ethnicity, type: Hash
  field :languages, type: Array
  field :test_id, type: BSON::ObjectId
  field :medical_record_number, type: String

  Sections = [:allergies, :care_goals, :conditions, :encounters, :immunizations, :medical_equipment,
   :medications, :procedures, :results, :social_history, :vital_signs]

  embeds_many :provider_performances
  
  Sections.each do |section|
    embeds_many section, as: :entry_list, class_name: "Entry"
  end
  
  scope :by_provider, ->(prov, effective_date) { (effective_date) ? where(provider_queries(prov.id, effective_date)) : where('provider_performances.provider_id'=>prov.id)  }
  scope :by_patient_id, ->(id) { where(:medical_record_number => id) }
  
  def providers
    provider_performances.map {|pp| pp.provider }
  end
  
  def over_18?
    Time.at(birthdate) < Time.now.years_ago(18)
  end
end