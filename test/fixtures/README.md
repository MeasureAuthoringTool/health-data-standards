# bonnie-fixtures

**NOTE**: Records need to be changed slightly to be parsed correctly within HDS. 
For result values that include codes, you need to add "\_type": "CodedResultValue"

for example:

```
"values": [
  {
    "_id": "5b55e279b0ede6798bfabe30",
    "codes": {
      "SNOMED-CT": [
        "419099009"
      ]
    },
    "description": "Dead"
  }
]
```

turns to 

```
"values": [
  {
    "_id": "5b55e279b0ede6798bfabe30",
    "codes": {
      "SNOMED-CT": [
        "419099009"
      ]
    },
    "description": "Dead",
    "_type": "CodedResultValue"
  }
]
```

**NOTE**: All commands written below should be done in the Bonnie repository on
the master branch. The fixtures should then be moved from their generated locations
into the Health Data Standards repository.

The cql_measures fixtures should be moved to measures/cql_fixtures/. The records
fixtures should be moved to records/cql_fixtures/. The health_data_standards_svs_value_sets/cql_fixtures.
should be moved to health_data_standards_svs_value_sets/cql_fixtures.


## Core Set

CMS134 - Proportion measure with a single population set.
Covers Diagnosis, Encounter Performed, Intervention Ordered, Intervention 
Performed, Laboratory Test Performed, Medication Active, Procedure Performed.

bundle exec rake bonnie:fixtures:generate_backend_cql_fixtures[cms,core_measures/CMS134v6,bonnie-fixtures@mitre.org,CMS134v6]

## Special Measures

CMS108
Covers Assessment Performed, Device Applied, Device Ordered, Medication
Administered, Medication Ordered.

NOTE: value set file is so large that git doesn't accept it. It needs to be divided into multiple files.

bundle exec rake bonnie:fixtures:generate_backend_cql_fixtures[cms,special_measures/CMS108v7,bonnie-fixtures@mitre.org,CMS108v7]


CMS144v7
Covers Allergy Intolerance, Diagnostic Study Performed, Physical Exam Performed.

bundle exec rake bonnie:fixtures:generate_backend_cql_fixtures[cms,special_measures/CMS144v7,bonnie-fixtures@mitre.org,CMS144v7]
