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
  f.facility { FactoryGirl.build(:organization_visit) }
end

Factory.define :organization_visit do |f|
  f.start_time      1267322232
  f.end_time        1267323532
  f.organization  {FactoryGirl.build(:organization)}
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

Factory.define :fulfillment_history do |f|
end

Factory.define :immunization do |f|
  f.codes           { { "RxNorm" => ["854931"] } }
  f.time            1264529050
  f.description     "Pneumonia Vaccine"
end

Factory.define :lab_result do |f|
end

Factory.define :medication do |f|
  f.codes           { { "RxNorm" => ["105075"] } }
  f.time            1271810257
  f.description     "Tobacco Cessation Agent"
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

Factory.define :treating_provider do |f|
end

Factory.define :vital_sign do |f|
  f.codes           { { "SNOMED-CT" => ["225171007"] } }
  f.time            1266664414
  f.description     "BMI"
end
