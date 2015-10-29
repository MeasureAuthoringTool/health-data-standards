class FamilyHistory < Entry
  field :relationshipToPatient, as: :relationship_to_patient, type: Hash
  field :onsetAge, as: :onset_age, type: Hash
end