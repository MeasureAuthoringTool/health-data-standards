Diagnosis ([QDM-103](http://jira.oncprojectracking.org/browse/QDM-103)\)
========================================================================

The QDM User Group has proposed that the `Diagnosis, Active`, `Diagnosis, Inactive`, and `Diagnosis, Resolved` data types should be consolidated to a single `Diagnosis` data type with the following definition:

> A *diagnosis* represents a practitioner’s identification of a patient’s disease, illness, injury, or condition. A practitioner determines the *diagnosis* by means of examination, diagnostic test results, patient history, and/or family history. *Diagnoses* are usually considered unfavorable, but may also represent neutral or favorable conditions that affect a patient’s plan of care (e.g., pregnancy).
>
> The QDM does not prescribe the source of *diagnosis* data in the EHR. *Diagnoses* may be found in a patient’s problem list, encounter diagnosis list, claims data, or other sources within the EHR. The preferred terminology for diagnoses is SNOMED-CT, but diagnoses may also be encoded using ICD-9/10.
>
> The *Diagnosis* datatype should not be used for *differential diagnoses* or *rule-out diagnoses* (neither of which are currently supported by the QDM).

The `Diagnosis` data type contains the following attributes:

-	`onset datetime`: the estimated or actual date/time that the diagnosis/problem began
-	`abatement datetime`: the estimated or actual date/time that the diagnosis/problem resolved or went into remission
-	`anatomical location site`: the anatomical location where the diagnosis/problem manifests itself
-	`severity`: the subjective assessment of the severity of the diagnosis/problem

The following attributes were in previous `Diagnosis, XXX` data types but are *not* in the new `Diagnosis` data type: `laterality`, `ordinality`, `negation rationale`, `patient preference`, and `provider preference`.

General Approach
----------------

The new `Diagnosis` data type is most similar to the old `Diagnosis, Active` data type, so aspects of the existing HQMF pattern still apply.

Diagnosis Contexts
------------------

| Contained By                     | Contains             |
|:---------------------------------|:---------------------|
| Data Criteria Section (optional) | Severity Observation |

Diagnosis Constraints Overview
------------------------------

observationCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.110)

| XPath                      | Card. | Verb   | Data Type | Value                                                                                   | QDM Attribute                       |
|:---------------------------|:------|:-------|:----------|:----------------------------------------------------------------------------------------|:------------------------------------|
| @classCode                 | 1..1  | SHALL  |           | OBS                                                                                     |                                     |
| @moodCode                  | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                                                |                                     |
| templateId                 | 1..1  | SHALL  |           |                                                                                         |                                     |
| &nbsp; item                | 1..1  | SHALL  |           |                                                                                         |                                     |
| &nbsp;&nbsp; @root         | 1..1  | SHALL  |           | 2.16.840.1.113883.10.20.28.3.110                                                        |                                     |
| id                         | 1..1  | SHALL  |           |                                                                                         |                                     |
| code                       | 1..1  | SHALL  |           |                                                                                         |                                     |
| &nbsp; @code               | 1..1  | SHALL  |           | 282291009                                                                               |                                     |
| &nbsp; @codeSystem         | 1..1  | SHALL  |           | 2.16.840.1.113883.6.96 (SNOMED CT)                                                      |                                     |
| title                      | 1..1  | SHALL  |           |                                                                                         |                                     |
| statusCode                 | 1..1  | SHALL  |           |                                                                                         |                                     |
| &nbsp; @code               | 1..1  | SHALL  |           | 2.16.840.1.113883.5.14 (ActStatus) = completed                                          |                                     |
| effectiveTime              | 0..1  | MAY    | IVL_TS    |                                                                                         |                                     |
| &nbsp; low                 | 0..1  | MAY    |           |                                                                                         | onset datetime *(default start)*    |
| &nbsp; high                | 0..1  | MAY    |           |                                                                                         | abatement datetime *(default stop)* |
| value                      | 1..1  | SHALL  | CD        |                                                                                         |                                     |
| &nbsp; @valueSet           | 0..1  | SHOULD |           |                                                                                         | {$QDMElementValueSetOID}            |
| targetSiteCode             | 0..1  | MAY    |           |                                                                                         |                                     |
| &nbsp; item                | 0..1  | SHOULD |           |                                                                                         |                                     |
| &nbsp;&nbsp; @valueSet     | 0..1  | SHOULD |           |                                                                                         | anatomical location site            |
| outboundRelationship       | 0..1  | MAY    |           |                                                                                         |                                     |
| &nbsp; @typeCode           | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = REFR                                |                                     |
| &nbsp; observationCriteria | 1..1  | SHALL  |           | Severity Observation (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.93:2014-11-24) | severity                            |

Diagnosis Example
-----------------

```xml
<observationCriteria classCode="OBS" moodCode="EVN">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.110"/>
    </templateId>
    <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b"/>
    <code code="282291009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
        <displayName value="Diagnosis"/>
    </code>
    <title value="Diagnosis"/>
    <statusCode code="completed"/>
    <value xsi:type="CD" valueSet="{$QDMElementValueSetOID}"/>
</observationCriteria>
```

Deprecated Templates
--------------------

This change deprecates the following templates:

| Template Name       | Template ID                                |
|:--------------------|:-------------------------------------------|
| Diagnosis, Active   | 2.16.840.1.113883.10.20.28.3.1:2014-11-24  |
| Diagnosis, Inactive | 2.16.840.1.113883.10.20.28.3.18:2014-11-24 |
| Diagnosis, Resolved | 2.16.840.1.113883.10.20.28.3.19:2014-11-24 |
| Laterality          | 2.16.840.1.113883.10.20.28.3.98:2014-11-24 |

Along with the `Symptom` changes, these changes also deprecate the following templates:

| Template Name    | Template ID                                |
|:-----------------|:-------------------------------------------|
| Status, Active   | 2.16.840.1.113883.10.20.28.3.95:2014-11-24 |
| Status, Inactive | 2.16.840.1.113883.10.20.28.3.96:2014-11-24 |
| Status, Resolved | 2.16.840.1.113883.10.20.28.3.97:2014-11-24 |
