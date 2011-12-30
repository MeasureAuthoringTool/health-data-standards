class Record

  include Mongoid::Document
  
  field :first, type: String
  field :last, type: String
  field :gender, type: String
  field :birthdate, type: Integer
  field :race, type: String
  field :ethnicity, type: String
  field :test_id, type: BSON::ObjectId
  field :medical_record_number, type: String

  Sections = [:allergies, :care_goals, :conditions, :encounters, :immunizations, :medical_equipment,
   :medications, :procedures, :results, :social_history, :vital_signs]

  Sections.each do |section|
    embeds_many section, as: :entry_list, class_name: "Entry"
  end
  
  def over_18?
    Time.at(birthdate) < Time.now.years_ago(18)
  end
end