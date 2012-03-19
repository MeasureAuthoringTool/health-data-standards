Factory.define :allergy do |f|
  f.codes           { { "RxNorm" => "70618" } }
  f.time            1271810257
  f.description     "Penicillin"
end

Factory.define :comment do |f|
end

Factory.define :condition do |f|
  f.codes           { { "SNOMED-CT" => ["16356006"] } }
  f.cause_of_death  false
  f.name            "Smoker"
  f.start_time      1269776601
  f.end_time        1270776601
  f.description     "Tobacco user"
end

Factory.define :encounter do |f|
  f.codes           { { "CPT" => ["99201"] } }
  f.start_time      1267322332
  f.end_time        1267323432
  f.description     "Outpatient encounter"
  f.admit_type      {{"SNOMED-CT" => ["12345678"]}}
  f.discharge_disposition {{"SNOMED-CT" => ["23456789"]}}
  f.free_text       "Sample Encounter"
  f.facility { FactoryGirl.build(:organization) }
end

Factory.define :medication_product do |f|
  f.product_name "Acetaminophen"
  f.brand_name "Tylenol"
  f.coded_product_name  {{"RxNorm" => ["12345"]}}
  f.coded_brand_name {{"RxNorm" => ["12346"]}}
end

Factory.define :orderInformation do |f|
  f.order_number "5"
  f.fills 4
  f.quantity_ordered {{"value" => "500", "unit" => "mg"}}
  f.order_date_time 1267332332
  f.order_expiration_date_time 1267432332
end

Factory.define :fulfillment_history do |f|
  f.prescription_number "B324"
  f.dispense_date 1267332349
  f.quantity_dispensed {{"value" => 200, "unit" => "pills"}}
  f.fill_number 1
  f.fill_status "aborted"
  f.dispensing_pharmacy_location { FactoryGirl.build(:address)}
end

Factory.define :organization do |f|
  f.name "Doctor Worm & Associates"
end

Factory.define :address do |f|
  f.sequence(:street) { |n| ["#{n} Sesame Street", "Apt #{n}"]  }
  f.city "Bedford"
  f.state "MA"
  f.zip "01730"
end

Factory.define :telecom do |f|
  f.sequence(:value) { |n| 18005555555 + n }
  f.type { %w(fax phone mobile).sample }
  f.preferred { [true, false].sample }
end

Factory.define :immunization do |f|
  f.codes           { { "RxNorm" => ["854931"] } }
  f.time            1264529050
  f.description     "Pneumonia Vaccine"
end

Factory.define :lab_result do |f|
end

Factory.define :medication do |f|
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
  f.medication_product { FactoryGirl.build(:medication_product)}
  f.order_information { [FactoryGirl.build(:orderInformation)]}
end

Factory.define :order_information do |f|
end

Factory.define :procedure do |f|
  f.codes           { { "SNOMED-CT" => ["171055003"] } }
  f.start_time      1257901150
  f.end_time        1258901150
  f.description     "Tobacco Cessation Counseling"
end

Factory.define :record do |f|
  f.encounters { |e| [FactoryGirl.build(:encounter)]}
end

Factory.define :vital_sign do |f|
  f.codes           { { "SNOMED-CT" => ["225171007"] } }
  f.time            1266664414
  f.description     "BMI"
end
