class Record
  include Mongoid::Document
  
  field :title, type: String # TODO
  field :first, type: String
  field :last, type: String
  field :gender, type: String
  field :birthdate, type: Integer
  field :deathdate, type: Integer # TODO
  field :religious_affilication, type: Hash # TODO
  field :effective_time, type: Integer
  field :race, type: Hash
  field :ethnicity, type: Hash
  field :languages, type: Array
  field :test_id, type: Moped::BSON::ObjectId
  field :marital_status, type: Hash # TODO
  field :medical_record_number, type: String
  field :expired, type: Boolean
  field :clinicalTrialParticipant, type: Boolean   # Currently not implemented in the C32 importer
                                                   # because it cannot be easily represented in a
                                                   # HITSP C32

  embeds_many :allergies
  embeds_many :care_goals, class_name: "Entry" # This can be any number of different entry types
  embeds_many :conditions
  embeds_many :encounters
  embeds_many :immunizations
  embeds_many :medical_equipment
  embeds_many :medications
  embeds_many :procedures
  embeds_many :results, class_name: "LabResult"
  embeds_many :social_history, class_name: "Entry"
  embeds_many :vital_signs
  embeds_many :support
  embeds_many :advance_directives, class_name: "Entry"
  embeds_many :insurance_providers
  embeds_many :functional_statuses

  Sections = [:allergies, :care_goals, :conditions, :encounters, :immunizations, :medical_equipment,
   :medications, :procedures, :results, :social_history, :vital_signs, :support, :advance_directives,
   :insurance_providers, :functional_statuses]

  embeds_many :provider_performances
  
  scope :by_provider, ->(prov, effective_date) { (effective_date) ? where(provider_queries(prov.id, effective_date)) : where('provider_performances.provider_id'=>prov.id)  }
  scope :by_patient_id, ->(id) { where(:medical_record_number => id) }
  
  def providers
    provider_performances.map {|pp| pp.provider }
  end
  
  def over_18?
    Time.at(birthdate) < Time.now.years_ago(18)
  end

  def entries_for_oid(oid)
    matching_entries_by_section = Sections.map do |section|
      section_entries = self.send(section)
      if section_entries.present?
        section_entries.find_all { |entry| entry.oid == oid }
      else
        []
      end
    end
    matching_entries_by_section.flatten
  end
  
  alias :clinical_trial_participant :clinicalTrialParticipant
  alias :clinical_trial_participant= :clinicalTrialParticipant=
  
  private 
  
  def self.provider_queries(provider_id, effective_date)
   {'$or' => [provider_query(provider_id, effective_date,effective_date), provider_query(provider_id, nil,effective_date), provider_query(provider_id, effective_date,nil)]}
  end
  def self.provider_query(provider_id, start_before, end_after)
    {'provider_performances' => {'$elemMatch' => {'provider_id' => provider_id, '$and'=>[{'$or'=>[{'start_date'=>nil},{'start_date'=>{'$lt'=>start_before}}]}, {'$or'=>[{'end_date'=>nil},{'end_date'=> {'$gt'=>end_after}}]}] } }}
  end
  
end
