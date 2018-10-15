class Assessment < Entry
  # method deprecated for "Assessment, Recommended" and "Assessment, Order" in QDM 5.4. Remains for "Assessment, Performed".
  field :method,              type: Hash
  field :components,          type: Hash
end
