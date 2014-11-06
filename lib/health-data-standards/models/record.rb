module HealthDataStandards
  class Record
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Attributes::Dynamic
    extend Memoist

    field :title, type: String
    field :first, type: String
    field :last, type: String
    field :gender, type: String
    field :birthdate, type: Integer
    field :deathdate, type: Integer
    field :religious_affiliation, type: Hash
    field :effective_time, type: Integer
    field :race, type: Hash
    field :ethnicity, type: Hash
    field :languages, type: Array, default: []
    field :test_id, type: BSON::ObjectId
    field :marital_status, type: Hash
    field :medical_record_number, type: String
    field :medical_record_assigner, type: String
    field :expired, type: Boolean
    field :clinicalTrialParticipant, as: :clinical_trial_participant, type: Boolean   # Currently not implemented in the C32 importer
                                                                                      # because it cannot be easily represented in a
                                                                                      # HITSP C32

    index "last" => 1
    embeds_many :allergies,         class_name: "HealthDataStandards::Allergy"
    embeds_many :care_goals,        class_name: "HealthDataStandards::Entry" # This can be any number of different entry types
    embeds_many :conditions,        class_name: "HealthDataStandards::Condition"
    embeds_many :encounters,        class_name: "HealthDataStandards::Encounter"
    embeds_many :immunizations,     class_name: "HealthDataStandards::Immunization"
    embeds_many :medical_equipment, class_name: "HealthDataStandards::MedicalEquipment"
    embeds_many :medications,       class_name: "HealthDataStandards::Medication"
    embeds_many :procedures,        class_name: "HealthDataStandards::Procedure"
    embeds_many :results,           class_name: "HealthDataStandards::LabResult"
    embeds_many :socialhistories,   class_name: "HealthDataStandards::Entry"

    alias :social_history :socialhistories
    alias :social_history= :socialhistories=

    embeds_many :vital_signs,         class_name: "HealthDataStandards::VitalSign"
    embeds_many :support,             class_name: "HealthDataStandards::Support"
    embeds_many :advance_directives,  class_name: "HealthDataStandards::Entry"
    embeds_many :insurance_providers, class_name: "HealthDataStandards::InsuranceProvider"
    embeds_many :functional_statuses, class_name: "HealthDataStandards::FunctionalStatus"

    Sections = [:allergies, :care_goals, :conditions, :encounters, :immunizations, :medical_equipment,
     :medications, :procedures, :results, :social_history, :vital_signs, :support, :advance_directives,
     :insurance_providers, :functional_statuses]

    embeds_many :provider_performances, class_name: "HealthDataStandards::ProviderPerformance"
    embeds_many :addresses, as: :locatable, class_name: "HealthDataStandards::Address"
    embeds_many :telecoms, as: :contactable, class_name: "HealthDataStandards::Telecom"

    scope :by_provider, ->(prov, effective_date) { (effective_date) ? where(provider_queries(prov.id, effective_date)) : where('provider_performances.provider_id'=>prov.id)  }
    scope :by_patient_id, ->(id) { where(:medical_record_number => id) }

    def self.update_or_create(data)
      existing = HealthDataStandards::Record.where(medical_record_number: data.medical_record_number).first
      if existing
        existing.update_attributes!(data.attributes.except('_id'))
        existing
      else
        data.save!
        data
      end
    end

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
          section_entries.find_all { |entry| (entry.respond_to? :oid) ? entry.oid == oid : false}
        else
          []
        end
      end
      matching_entries_by_section.flatten
    end

    def entries
      Sections.map do |section|
        self.send(section)
      end.flatten
    end

    memoize :entries_for_oid

    alias :clinical_trial_participant :clinicalTrialParticipant
    alias :clinical_trial_participant= :clinicalTrialParticipant=

    # Remove duplicate entries from a section based on cda_identifier or id.
    # This method may lose information because it does not compare entries
    # based on clinical content
    def dedup_section_ignoring_content!(section)
      unique_entries = self.send(section).uniq do |entry|
        entry.identifier
      end
      self.send("#{section}=", unique_entries)
    end
    def dedup_section_merging_codes_and_values!(section)
      unique_entries = {}
      self.send(section).each do |entry|
        if unique_entries[entry.identifier]
          unique_entries[entry.identifier].codes = unique_entries[entry.identifier].codes.deep_merge(entry.codes){ |key, old, new| Array.wrap(old) + Array.wrap(new) }
          unique_entries[entry.identifier].values.concat(entry.values)
        else
          unique_entries[entry.identifier] = entry
        end
      end
      self.send("#{section}=", unique_entries.values)
    end

    def dedup_section!(section)
      [:encounters, :procedures, :results].include?(section) ? dedup_section_merging_codes_and_values!(section) : dedup_section_ignoring_content!(section)
    end
    def dedup_record!
      Record::Sections.each {|section| self.dedup_section!(section)}
    end

    def shift_dates(date_diff)
      self.birthdate = (self.birthdate.nil?) ? nil : self.birthdate + date_diff
      self.deathdate = (self.deathdate.nil?) ? nil : self.deathdate + date_diff
      self.provider_performances.each {|pp| pp.shift_dates(date_diff)}
      Sections.each do |sec|
        (self.send sec || []).each do |ent|
          ent.shift_dates(date_diff)
        end

      end

    end

    private

    def self.provider_queries(provider_id, effective_date)
     {'$or' => [provider_query(provider_id, effective_date,effective_date), provider_query(provider_id, nil,effective_date), provider_query(provider_id, effective_date,nil)]}
    end
    def self.provider_query(provider_id, start_before, end_after)
      {'provider_performances' => {'$elemMatch' => {'provider_id' => provider_id, '$and'=>[{'$or'=>[{'start_date'=>nil},{'start_date'=>{'$lt'=>start_before}}]}, {'$or'=>[{'end_date'=>nil},{'end_date'=> {'$gt'=>end_after}}]}] } }}
    end




  end
end