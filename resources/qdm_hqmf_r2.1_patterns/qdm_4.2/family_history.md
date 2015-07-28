Family History ([QDM-107](http://jira.oncprojectracking.org/browse/QDM-107)\)
=============================================================================

The QDM User Group has proposed that the `Diagnosis, Family History` data type be replaced by a new `Family History` data type (in its own `Family History` QDM category).

The `Family History` data type contains the following attributes:

-	`relationship`: the relationship of the family member to the patient
-	`onset age`: the estimated or actual age in years of the family member when the diagnosis/problem began
-	`recorded datetime`: the date/time the family history entry was recorded

The following attributes were in `Diagnosis, Family History` but are *not* in the new `Family History` data type: `ordinality`, `negation rationale`, `patient preference`, `provider preference`, `severity`, and `status`.

General Approach
----------------

The representation in C-CDA R2 and QRDA Cat I R3 are notably different in that they use an `organizer` to group problems according to the family member. HQMF R2 does not appear to support `organizer`, so I've attempted to model this based on the existing `Diagnosis, Family History` template. This new template refers to the family member's `relationship` via a `participation` and `onset age` via an `outboundRelationship`.

Regarding `relationship`, these should use the [HL7 FAMMEMB concepts](http://hl7-fhir.github.io/v3/RoleCode/index.html#FAMMEMB) in order to align well with other HL7 standards.

Also note that the `participation` for author time requires `role` with `@classcode` and `id`. This follows the template for author time in `Medication, Order`, but honestly, I'm not sure why it is needed.

Family History Contexts
-----------------------

| Contained By                     | Contains |
|:---------------------------------|:---------|
| Data Criteria Section (optional) |          |

Family History Constraints Overview
-----------------------------------

observationCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.111)

| XPath                          | Card. | Verb   | Data Type | Value                                                         | QDM Attribute                      |
|:-------------------------------|:------|:-------|:----------|:--------------------------------------------------------------|:-----------------------------------|
| @classCode                     | 1..1  | SHALL  |           | OBS                                                           |                                    |
| @moodCode                      | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                      |                                    |
| templateId                     | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp; item                    | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp;&nbsp; @root             | 1..1  | SHALL  |           | 2.16.840.1.113883.10.20.28.3.111                              |                                    |
| id                             | 1..1  | SHALL  |           |                                                               |                                    |
| code                           | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp; @code                   | 1..1  | SHALL  |           | 75314-5                                                       |                                    |
| &nbsp; @codeSystem             | 1..1  | SHALL  |           | 2.16.840.1.113883.6.1 (LOINC)                                 |                                    |
| title                          | 1..1  | SHALL  |           |                                                               |                                    |
| statusCode                     | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp; @code                   | 1..1  | SHALL  |           | 2.16.840.1.113883.5.14 (ActStatus) = completed                |                                    |
| value                          | 1..1  | SHALL  | CD        |                                                               |                                    |
| &nbsp; @valueSet               | 0..1  | SHOULD |           |                                                               | {$QDMElementValueSetOID}           |
| participation                  | 0..1  | MAY    |           |                                                               |                                    |
| &nbsp; @typeCode               | 1..1  | SHALL  |           | 2.16.840.1.113883.5.90 (HL7ParticipationType) = AUT           |                                    |
| &nbsp; time                    | 0..1  | SHOULD |           |                                                               |                                    |
| &nbsp;&nbsp; low               | 0..1  | MAY    |           |                                                               | *(default start)*                  |
| &nbsp;&nbsp; high              | 0..1  | MAY    |           |                                                               | recorded datetime *(default stop)* |
| &nbsp; role                    | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp;&nbsp; @classCode        | 1..1  | SHALL  |           | ROL                                                           |                                    |
| &nbsp;&nbsp; id                | 1..1  | SHALL  |           |                                                               |                                    |
| participation                  | 0..1  | MAY    |           |                                                               |                                    |
| &nbsp; @typeCode               | 1..1  | SHALL  |           | 2.16.840.1.113883.5.90 (HL7ParticipationType) = SBJ           |                                    |
| &nbsp; role                    | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp;&nbsp; @classCode        | 1..1  | SHALL  |           | PRS                                                           |                                    |
| &nbsp;&nbsp; code              | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp;&nbsp;&nbsp; @valueSet   | 0..1  | SHOULD |           |                                                               | relationship                       |
| outboundRelationship           | 0..1  | MAY    |           |                                                               |                                    |
| &nbsp; @typeCode               | 1..1  | SHALL  |           | urn:oid:2.16.840.1.113883.5.1002 (ActRelationshipType) = SUBJ |                                    |
| &nbsp; observationCriteria     | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp;&nbsp; @classCode        | 1..1  | SHALL  |           | OBS                                                           |                                    |
| &nbsp;&nbsp; @moodCode         | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                      |                                    |
| &nbsp;&nbsp; id                | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp;&nbsp; code              | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp;&nbsp;&nbsp; @code       | 1..1  | SHALL  |           | 445518008                                                     |                                    |
| &nbsp;&nbsp;&nbsp; @codeSystem | 1..1  | SHALL  |           | 2.16.840.1.113883.6.96 (SNOMED CT)                            |                                    |
| &nbsp;&nbsp; title             | 1..1  | SHALL  |           |                                                               |                                    |
| &nbsp;&nbsp; value             | 1..1  | SHALL  |           |                                                               | onset age                          |

Family History Example
----------------------

```xml
<observationCriteria classCode="OBS" moodCode="EVN">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.111"/>
    </templateId>
    <id root="bd4673f9-0da9-4491-98ba-a00c4191d518"/>
    <code code="10157-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
        <displayName value="Family History"/>
    </code>
    <title value="Family History"/>
    <statusCode code="completed"/>
    <value xsi:type="CD" valueSet="{$QDMElementValueSetOID}"/>
    <participation typeCode="SBJ">
        <role classCode="PRS">
            <code valueSet="{$RelationshipValueSetOID}"/>
        </role>
    </participation>
    <outboundRelationship typeCode="SUBJ">
      <observationCriteria classCode="OBS" moodCode="EVN">
          <id root="bd4673f9-0da9-4491-98ba-a00c4191d519"/>
          <code code="445518008" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
              <displayName value="Age at onset of clinical finding"/>
          </code>
          <title value="Age"/>
          <value xsi:type="IVL_PQ" highClosed="false">
              <low nullFlavor="NINF"/>
              <high value="50" unit="a"/>
          </value>
      </observationCriteria>
    </outboundRelationship>
</observationCriteria>
```

Deprecated Templates
--------------------

This change deprecates the following templates:

| Template Name             | Template ID                                |
|:--------------------------|:-------------------------------------------|
| Diagnosis, Family History | 2.16.840.1.113883.10.20.28.3.17:2014-11-24 |
