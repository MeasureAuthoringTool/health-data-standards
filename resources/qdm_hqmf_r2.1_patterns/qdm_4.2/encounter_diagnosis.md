Encounter Diagnosis ([QDM-106](http://jira.oncprojectracking.org/browse/QDM-106)\)
==================================================================================

The QDM User Group has proposed that encounter diagnoses (including principal diagnoses) be represented by `diagnosis` and `principal diagnosis` attributes on the `Encounter, Performed` data type.

The following attributes will be added to the `Encounter, Performed` data type:

-	`diagnosis`: a coded diagnosis/problem addressed during the encounter
-	`principal diagnosis`: the coded diagnosis/problem established after study to be chiefly responsible for occasioning the admission of the patient to the hospital for care

General Approach
----------------

The approach follows the basic pattern that is already established in the QRDA Cat 1 DSTU R3 specification, but embeds all references (to remain consistent with other HQMF templates using outbound relationships). The `Encounter, Performed` template will be updated to include `outboundRelationships` to `actCriteria` representing the encounter principal diagnosis and and encounter diagnosis. These `actCriteria` will, in turn, embed the relevant `Diagnosis`.

Additional Encounter, Performed Constraints
-------------------------------------------

Note that in C-CDA R2 and QRDA Cat I R3, the `entryRelationship` from the encounter to encounter diagnosis does *not* have a `typeCode` specified. In HQMF R2.1, `outboundRelationship` *must* have a `typeCode`. I've opted to use the general `REFR` type code, but am open to other suggestions. Among those also considered: `COMP`, `DIAG` (not chosen because I think it relates to the *initial* identification of the condition), `RSON` (for principal only), and `TREAT`.

encounterCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.5:2015-09-30)

| XPath                                  | Card. | Verb  | Data Type | Value                                                              | QDM Attribute       |
|:---------------------------------------|:------|:------|:----------|:-------------------------------------------------------------------|:--------------------|
| outboundRelationship                   | 0..1  | MAY   |           |                                                                    |                     |
| &nbsp; @typeCode                       | 1..1  | SHALL |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = REFR           |                     |
| &nbsp; actCriteria                     | 1..1  | SHALL |           |                                                                    |                     |
| &nbsp;&nbsp; @classCode                | 1..1  | SHALL |           | ACT                                                                |                     |
| &nbsp;&nbsp; @moodCode                 | 1..1  | SHALL |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                           |                     |
| &nbsp;&nbsp; id                        | 1..1  | SHALL |           |                                                                    |                     |
| &nbsp;&nbsp; code                      | 1..1  | SHALL |           |                                                                    |                     |
| &nbsp;&nbsp;&nbsp; @code               | 1..1  | SHALL |           | 52534-5                                                            |                     |
| &nbsp;&nbsp;&nbsp; @codeSystem         | 1..1  | SHALL |           | 2.16.840.1.113883.6.1 (LOINC)                                      |                     |
| &nbsp;&nbsp; title                     | 1..1  | SHALL |           |                                                                    |                     |
| &nbsp;&nbsp; outboundRelationship      | 1..1  | MAY   |           |                                                                    |                     |
| &nbsp;&nbsp;&nbsp; @typeCode           | 1..1  | SHALL |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = SUBJ           |                     |
| &nbsp;&nbsp;&nbsp; observationCriteria | 1..1  | SHALL |           | Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.110) | principal diagnosis |
| outboundRelationship                   | 0..1  | MAY   |           |                                                                    |                     |
| &nbsp; @typeCode                       | 1..1  | SHALL |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = REFR           |                     |
| &nbsp; actCriteria                     | 1..1  | SHALL |           |                                                                    |                     |
| &nbsp;&nbsp; @classCode                | 1..1  | SHALL |           | ACT                                                                |                     |
| &nbsp;&nbsp; @moodCode                 | 1..1  | SHALL |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                           |                     |
| &nbsp;&nbsp; id                        | 1..1  | SHALL |           |                                                                    |                     |
| &nbsp;&nbsp; code                      | 1..1  | SHALL |           |                                                                    |                     |
| &nbsp;&nbsp;&nbsp; @code               | 1..1  | SHALL |           | 29308-4                                                            |                     |
| &nbsp;&nbsp;&nbsp; @codeSystem         | 1..1  | SHALL |           | 2.16.840.1.113883.6.1 (LOINC)                                      |                     |
| &nbsp;&nbsp;title                      | 1..1  | SHALL |           |                                                                    |                     |
| &nbsp;&nbsp;outboundRelationship       | 1..1  | MAY   |           |                                                                    |                     |
| &nbsp;&nbsp;&nbsp; @typeCode           | 1..1  | SHALL |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = SUBJ           |                     |
| &nbsp;&nbsp;&nbsp; observationCriteria | 1..1  | SHALL |           | Diagnosis (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.110) | diagnosis           |

Encounter, Performed w/ Principal Diagnosis Example
---------------------------------------------------

```xml
<encounterCriteria classCode="ENC" moodCode="EVN">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.5" extension="2015-09-30"/>
    </templateId>
    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc"/>
    <code valueSet="{$QDMElementValueSetOID}"/>
    <title value="Encounter, Performed"/>
    <statusCode code="completed"/>
    <outboundRelationship typeCode="REFR">
        <actCriteria classCode="ACT" moodCode="EVN">
            <id root="9f751ae5-edb2-4fb3-b49c-d0f0fdef3999"/>
            <code code="52534-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                <displayName value="Principal Diagnosis"/>
            </code>
            <title value="Encounter Principal Diagnosis"/>
            <outboundRelationship typeCode="SUBJ">
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
                  <value xsi:type="CD" valueSet="{$PrincipalDxValueSet}"/>
              </observationCriteria>
            </outboundRelationship>
        </actCriteria>
    </outboundRelationship>
</encounterCriteria>
```
