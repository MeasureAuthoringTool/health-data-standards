FactoryGirl.define do
  factory :allergy do |f|
    f.codes {{"RxNorm" => ["70618"]}}
    f.start_time 1264529050
    f.type "complete"
    f.reaction {{"SNOMED-CT" => ["24484000"]}}
    f.severity {{"SNOMED-CT" => ["39579001"]}}
  end

  factory :condition do |f|
    f.codes           { { "SNOMED-CT" => ["16356006"] } }
    f.cause_of_death  false
    f.start_time      1269776601
    f.end_time        1270776601
    f.description     "Tobacco user"
    f.type            "404684003"
  end

  factory :encounter do |f|
    f.codes           { { "CPT" => ["99201"] } }
    f.start_time      1267322332
    f.end_time        1267323432
    f.admit_type      {{"SNOMED-CT" => ["12345678"]}}
    f.discharge_disposition {{"SNOMED-CT" => ["23456789"]}}
    f.free_text       "Sample Encounter"
    f.facility { FactoryGirl.build(:organization) }
  end
  
  factory :entry do |f|
    f.codes           { { "CPT" => ["99201"] } }
    f.start_time      1267322332
    f.end_time        1267323432
  end
  
  factory :medical_equipment, class: "MedicalEquipment" do |f|
    f.codes           { { "SNOMED" => ["598721"] } }
    f.start_time      1267322332
    f.end_time        1267323432
    f.value {{scalar: 5, unit: "strips"}}
  end
  
  factory :support do |f|
    f.given_name "Bob"
    f.family_name "Loblaw"
    f.relationship "Brother"
    f.type "Guardian"
    f.address { FactoryGirl.build(:address) }
    f.telecom { FactoryGirl.build(:telecom) }
  end

  factory :orderInformation do |f|
    f.order_number "5"
    f.fills 4
    f.quantity_ordered {{"value" => "500", "unit" => "mg"}}
    f.order_date_time 1267332332
    f.order_expiration_date_time 1267432332
  end

  factory :fulfillment_history do |f|
    f.prescription_number "B324"
    f.dispense_date 1267332349
    f.quantity_dispensed {{"value" => 200, "unit" => "pills"}}
    f.fill_number 1
    f.fill_status "aborted"
  end

  factory :organization do |f|
    f.name "Doctor Worm & Associates"
  end

  factory :address do |f|
    f.sequence(:street) { |n| ["#{n} Sesame Street", "Apt #{n}"]  }
    f.city "Bedford"
    f.state "MA"
    f.zip "01730"
  end

  factory :telecom do |f|
    f.sequence(:value) { |n| 18005555555 + n }
    f.use { %w(fax phone mobile).sample }
    f.preferred { [true, false].sample }
  end

  factory :social_history do |f|
    f.type { { "SNOMED-CT" => ["398705004"]}}
    f.codes { { "SNOMED-CT" => ["363908000"]}}
  end
  
  factory :advance_directive, class: Entry do |f|
    f.codes { { "SNOMED-CT" => ["4234322"]}}
    f.start_time { 1.month.ago }
    f.end_time { Time.now }
    f.free_text "Go insane"
  end

  factory :immunization do |f|
    f.codes           { { "RxNorm" => ["854931"] } }
    f.time            1264529050
    f.description     "Pneumonia Vaccine"
    f.refusal_ind true
    f.refusal_reason { { "RxNorm" => ["12345"] } }
    f.series_number 1
  end
  FactoryGirl.define do

  end
  factory :lab_result do |f|
  end

  factory :medication do |f|
    f.codes           { { "SNOMED-CT" => ["105075"] } }
    f.description     "Tobacco Cessation Agent"
    f.start_time 1267332332
    f.end_time 1267333332
    f.administrationTiming { {:institution_specified => true, :period => {"value" => 5.0, "unit" => "hours"}} }
    f.dose { {"RxNorm" => ["12345"]}}
    f.status "complete"
    f.typeOfMedication { {"RxNorm" => ["12345"]}}
    f.statusOfMedication { {"RxNorm" => ["12345"]}}
    f.route { {"RxNorm" => ["12345"]}}
    f.site { {"RxNorm" => ["12345"]}}
    f.doseRestriction { {"RxNorm" => ["12345"]}}
    f.fulfillmentInstructions "Fulfillment Instructions"
    f.indication { {"RxNorm" => ["12345"]}}
    f.vehicle { {"RxNorm" => ["12345"]}}
    f.reaction { {"RxNorm" => ["12345"]}}
    f.productForm { {"RxNorm" => ["12345"]}}
    f.deliveryMethod { {"RxNorm" => ["12345"]}}
    f.patientInstructions "Take with Water"
    f.fulfillment_history { [FactoryGirl.build(:fulfillment_history)]}
    f.order_information { [FactoryGirl.build(:orderInformation)]}
  end

  factory :order_information do |f|
  end

  factory :procedure do |f|
    f.codes           { { "SNOMED-CT" => ["171055003"] } }
    f.start_time      1257901150
    f.end_time        1258901150
    f.site {{ "SNOMED-CT" => ["12341234"]}}
  end

  factory :record do |f|
    f.encounters { |e| [FactoryGirl.build(:encounter)]}
  end

  factory :vital_sign do |f|
    f.codes           { { "SNOMED-CT" => ["225171007"] } }
    f.time            1266664414
    f.description     "BMI"
  end

  # # Metadata factory elements
  # factory "metadata/linked_info" do |l|
  #   l.href          "http://t1.x.y.com"
  #   l.extension     "abc"
  # end
  # 
  factory "pedigree", class: Metadata::Pedigree do |p|
    p.author
    p.organization  "Health Care Inc"
  end
  
  factory "author", class: Metadata::Author do |a|
    a.name "John Smith"
  end
  # 
  # factory "metadata/record_date" do |r|
  #   r.operation           "MODIFIED"
  #   r.operation_time      { Time.at(Time.now.to_i - rand(10000000)) }
  #   r.pedigree  do
  #     FactoryGirl.build("metadata/pedigree")
  #   end
  # end
  # 
  factory "metadata", class: Metadata::Base do |m|
    # m.pedigree
    m.confidentiality "<hmd:a>text</hmd:a><hmd:c>embedded element</hmd:c>"
  end
  
end

