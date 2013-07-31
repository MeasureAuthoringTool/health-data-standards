class InsuranceProvider < Entry
  include Mongoid::Document
  include ThingWithCodes
  
  embedded_in :record, class_name: 'Record'
  embeds_one :payer, class_name: "Organization"
  embeds_many :guarantors, class_name: "Guarantor"
  embeds_one :subscriber, class_name: "Person"
  
  field :type, type: String
  field :time, type: Integer
  field :start_time, type: Integer
  field :end_time, type: Integer
  field :member_id, type: String
  field :relationship, type: Hash
  field :financial_responsibility_type, type: Hash
  field :name, type: String
  field :free_text, type: String
  

  def shift_dates(date_diff)
    self.start_time = self.start_time.nil? ? nil : self.start_time + date_diff
    self.end_time = self.end_time.nil? ? nil : self.end_time + date_diff
    self.time = self.time.nil? ? nil : self.time + date_diff
    self.guarantors.each do |g|
      g.shift_dates(date_diff)
    end
    
  end
end