Symptom ([QDM-115](http://jira.oncprojectracking.org/browse/QDM-115)\)
======================================================================

The QDM User Group has proposed that the `Symptom, Active`, `Symptom, Inactive`, `Symptom, Resolved`, and `Symptom, Assessed` data types should be consolidated to a single `Symptom` data type with the following definition.

The `Symptom` data type contains the following attributes:

-	`onset datetime`: the estimated or actual date/time that the diagnosis/problem began
-	`abatement datetime`: the estimated or actual date/time that the diagnosis/problem resolved or went into remission
-	`severity`: the subjective assessment of the severity of the diagnosis/problem

The following attributes were in previous `Symptom, XXX` data types but are *not* in the new `Symptom` data type: `ordinality`, `negation rationale`, `patient preference`, and `provider preference`.

General Approach
----------------

The new `Symptom` data type is most similar to the old `Symptom, Active` data type, so aspects of the existing HQMF pattern still apply.

Symptom Contexts
----------------

| Contained By                     | Contains             |
|:---------------------------------|:---------------------|
| Data Criteria Section (optional) | Severity Observation |

Symptom Constraints Overview
----------------------------

observationCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.116)

| XPath                      | Card. | Verb   | Data Type | Value                                                                                   | QDM Attribute                       |
|:---------------------------|:------|:-------|:----------|:----------------------------------------------------------------------------------------|:------------------------------------|
| @classCode                 | 1..1  | SHALL  |           | OBS                                                                                     |                                     |
| @moodCode                  | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                                                |                                     |
| templateId                 | 1..1  | SHALL  |           |                                                                                         |                                     |
| &nbsp; item                | 1..1  | SHALL  |           |                                                                                         |                                     |
| &nbsp;&nbsp; @root         | 1..1  | SHALL  |           | 2.16.840.1.113883.10.20.28.3.116                                                        |                                     |
| id                         | 1..1  | SHALL  |           |                                                                                         |                                     |
| code                       | 1..1  | SHALL  |           |                                                                                         |                                     |
| &nbsp; @code               | 1..1  | SHALL  |           | 418799008                                                                               |                                     |
| &nbsp; @codeSystem         | 1..1  | SHALL  |           | 2.16.840.1.113883.6.96 (SNOMED CT)                                                      |                                     |
| title                      | 1..1  | SHALL  |           |                                                                                         |                                     |
| statusCode                 | 1..1  | SHALL  |           |                                                                                         |                                     |
| &nbsp; @code               | 1..1  | SHALL  |           | 2.16.840.1.113883.5.14 (ActStatus) = completed                                          |                                     |
| effectiveTime              | 0..1  | MAY    | IVL_TS    |                                                                                         |                                     |
| &nbsp; low                 | 0..1  | MAY    |           |                                                                                         | onset datetime *(default start)*    |
| &nbsp; high                | 0..1  | MAY    |           |                                                                                         | abatement datetime *(default stop)* |
| value                      | 1..1  | SHALL  | CD        |                                                                                         |                                     |
| &nbsp; @valueSet           | 0..1  | SHOULD |           |                                                                                         | {$QDMElementValueSetOID}            |
| outboundRelationship       | 0..1  | MAY    |           |                                                                                         |                                     |
| &nbsp; @typeCode           | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = REFR                                |                                     |
| &nbsp; observationCriteria | 1..1  | SHALL  |           | Severity Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.93:2014-11-24) | severity                            |

Symptom Example
---------------

```xml
<observationCriteria classCode="OBS" moodCode="EVN">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.116"/>
    </templateId>
    <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b"/>
    <code code="418799008" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
        <displayName value="Symptom"/>
    </code>
    <title value="Symptom"/>
    <statusCode code="completed"/>
    <value xsi:type="CD" valueSet="{$QDMElementValueSetOID}"/>
</observationCriteria>
```

Deprecated Templates
--------------------

This change deprecates the following templates:

| Template Name     | Template ID                                          |
|:------------------|:-----------------------------------------------------|
| Symptom, Active   | urn:hl7ii:2.16.840.1.113883.10.20.28.3.79:2014-11-24 |
| Symptom, Assessed | urn:hl7ii:2.16.840.1.113883.10.20.28.3.80:2014-11-24 |
| Symptom, Inactive | urn:hl7ii:2.16.840.1.113883.10.20.28.3.81:2014-11-24 |
| Symptom, Resolved | urn:hl7ii:2.16.840.1.113883.10.20.28.3.82:2014-11-24 |

Along with the `Diagnosis` changes, these changes also deprecate the following templates:

| Template Name    | Template ID                                |
|:-----------------|:-------------------------------------------|
| Status, Active   | 2.16.840.1.113883.10.20.28.3.95:2014-11-24 |
| Status, Inactive | 2.16.840.1.113883.10.20.28.3.96:2014-11-24 |
| Status, Resolved | 2.16.840.1.113883.10.20.28.3.97:2014-11-24 |
