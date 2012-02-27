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
  f.time            1267322332
  f.description     "Outpatient encounter"
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
end

Factory.define :treating_provider do |f|
end

Factory.define :vital_sign do |f|
  f.codes           { { "SNOMED-CT" => ["225171007"] } }
  f.time            1266664414
  f.description     "BMI"
end
