Laboratory Test, Performed Reference Range ([QDM-114](http://jira.oncprojectracking.org/browse/QDM-114)\)
=========================================================================================================

**NOTE: This pattern should be considered DRAFT, as it is still awaiting confirmation for correctness.**

The QDM User Group has proposed that the `Laboratory Test, Performed` data type be extended to support the representation of a reference range.

The following attributes will be added to the `Laboratory Test, Performed` data type:

-	`reference range high`: the low bound (inclusive) of values that are considered “normal”
-	`reference range high`: the low bound (inclusive) of values that are considered “normal”

General Approach
----------------

The `Laboratory Test, Performed` template will be updated to include an outboundRelationship to a new `Reference Range` observation template.

Additional Laboratory Test, Performed Constraints
-------------------------------------------------

observationCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.42:TBD)

| XPath                      | Card. | Verb  | Data Type | Value                                                    | QDM Attribute                             |
|:---------------------------|:------|:------|:----------|:---------------------------------------------------------|:------------------------------------------|
| outboundRelationship       | 0..1  | MAY   |           |                                                          |                                           |
| &nbsp; @typeCode           | 1..1  | SHALL |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = REFV |                                           |
| &nbsp; observationCriteria | 1..1  | SHALL |           | Reference Range (identifier: urn:hl7ii:TBD:TBD)          | reference range low, reference range high |

Reference Range Contexts
------------------------

| Contained By                          | Contains |
|:--------------------------------------|:---------|
| Laboratory Test, Performed (optional) |          |

Reference Range Constraints Overview
------------------------------------

observationCriteria (identifier: urn:hl7ii:TBD:TBD)

| XPath                   | Card. | Verb   | Data Type | Value                                    | QDM Attribute        |
|:------------------------|:------|:-------|:----------|:-----------------------------------------|:---------------------|
| @classCode              | 1..1  | SHALL  |           | OBS                                      |                      |
| @moodCode               | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN |                      |
| templateId              | 1..1  | SHALL  |           |                                          |                      |
| &nbsp; item             | 1..1  | SHALL  |           |                                          |                      |
| &nbsp;&nbsp; @root      | 1..1  | SHALL  |           | TBD                                      |                      |
| &nbsp;&nbsp; @extension | 1..1  | SHALL  |           | TBD                                      |                      |
| id                      | 1..1  | SHALL  |           |                                          |                      |
| code                    | 1..1  | SHALL  |           |                                          |                      |
| &nbsp; @code            | 1..1  | SHALL  |           | 19147-8                                  |                      |
| &nbsp; @codeSystem      | 1..1  | SHALL  |           | 2.16.840.1.113883.6.1 (LOINC)            |                      |
| title                   | 1..1  | SHALL  |           |                                          |                      |
| value                   | 1..1  | IVL_PQ |           |                                          |                      |
| &nbsp; low              | 0..1  | MAY    |           |                                          | reference range low  |
| &nbsp; high             | 0..1  | MAY    |           |                                          | reference range high |

Laboratory Test, Performed w/ Reference Range Example
-----------------------------------------------------

The following checks that a `reference range high` exists. If you need to apply a comparison against a `reference range high` value (e.g., `reference range high < 10%`), then you would use an `uncertainRange` as a child of the `high` element.

```xml
<observationCriteria classCode="OBS" moodCode="EVN">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.42" extension="TBD"/>
    </templateId>
    <id root="05f0a7c8-371e-4e77-aad4-22ff9fdf7fa3"/>
    <code valueSet="{$QDMElementValueSetOID}"/>
    <title value="Laboratory Test, Performed"/>
    <statusCode code="completed"/>
    <outboundRelationship typeCode="REFV">
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="TBD" extension="TBD"/>
            </templateId>
            <id root="9f751ae5-edb2-4fb3-b49c-d0f0fdef3999"/>
            <code code="19147-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                <displayName value="Reference lab test reference range"/>
            </code>
            <title value="Reference Range"/>
            <value xsi:type="IVL_PQ">
              <high flavorId="ANY.NONNULL" />
            </value>
        </observationCriteria>
    </outboundRelationship>
</observationCriteria>
```
