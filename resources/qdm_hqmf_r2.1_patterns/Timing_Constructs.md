# QDM Timing Concepts

The [QDM 4.0 specification](http://www.healthit.gov/quality-data-model) defines the set of valid timing operators
along with guidance regarding how timing comparisons should be calculated (see Appendices A and B).  HQMF R2.1 and
the HL7 representations of timing concepts (such as `pauseQuantity` and `uncertainRange`) do not align well with
QDM's timing concepts.  As a result of this misalignment, QDM must extend the HQMF schema to better support the
timing concepts within the QDM specification.

# QDM Human Readable Representation of Timing Concepts

QDM allows timing concepts to be applied without any further comparisons.  The following example captures all
medication orders for Warfarin occurring _after_ the start of an office visit encounter (regardless of _how long_ 
after):

    "Medication, Order: Warfarin" starts after start of "Encounter, Performed: Office Visit"

QDM also allows timing concepts to be further refined with a comparison.  A comparison uses an equality operator,
a numeric value, a time unit, and a timing operator.  The following example captures all medication orders
for Warfarin _less than three hours_ after the start of an office visit encounter:

    "Medication, Order: Warfarin" < 3 hour(s) starts after start of "Encounter, Performed: Office Visit"

This should be evaluated as a series of two questions:

1. Does "Medication, Order: Warfarin" start after the start of "Encounter, Performed: Office Visit"?
2. If so, is the difference between the start times less than three hours?

Valid equality operators are: `>` , `>=`, `=`, `<=`, `<`.  Valid units are `year(s)`, `month(s)`, `week(s)`,
`day(s)`, `hour(s)`, and `minute(s)`.  The numeric value in the comparison must be a whole number (i.e., a
non-negative integer).

If a QDM element in a timing relation specifies an attribute that represents a date/time, then that attribute 
should be used in the time comparison.  The following example captures hip fracture surgical procedures for which
the incision occurred less than three hours after an inpatient encounter started:

    "Procedure, Performed: Hip Fracture Surgery (incision datetime)" < 3 hour(s) starts after start of "Encounter, Performed: Inpatient"

Date/time attributes can be specified for the QDM elements on either or both sides of the timing relationship statement.

# Time Granularity for QDM Date/Time Comparisons

The QDM 4.0 specification defines different units of precision depending on the unit of comparison (see Appendix B).
The following table provides a brief summary of the guidance:

| Unit of Comparison | Unit of Precision |                    Note                    |
| ------------------ | ----------------- | ------------------------------------------ |
| _none_             | `min` _(minute)_  | truncate seconds to 00 before comparing    |
| `min` _(minute)_   | `min` _(minute)_  | truncate seconds to 00 before comparing    |
| `h` _(hour)_       | `min` _(minute)_  | truncate seconds to 00 before comparing    |
| `d` _(day)_        | `d` _(day)_       | truncate time to 00:00:00 before comparing |
| `wk` _(week)_      | `d` _(day)_       | truncate time to 00:00:00 before comparing |
| `mo` _(month)_     | `d` _(day)_       | truncate time to 00:00:00 before comparing |
| `a` _(year)_       | `d` _(day)_       | truncate time to 00:00:00 before comparing |

While there has been discussion of allowing measure developers to override the precision in their measure logic, this
is currently not supported.  As such, the preceding table can be used to create a mapping from comparison units to
precision units.

# HQMF R2.1 Representations

## The QDM TemporalInformation Extension Datatype

HQMF R2.1 uses the `POQM_MT000001UV03.SourceOf4` XML datatype to represent timing relationships (usually as an element
named `temporallyRelatedInformation`).  In order to properly and clearly express QDM timing concepts in HQMF R2.1, QDM
must extend the `POQM_MT000001UV03.SourceOf4` datatype.  This extension should support:

* explicitly indicating the precision of the timing operation (codifying the guidance in the spec)
* defining an acceptable delta (e.g. "A _< 3 day(s)_ starts before start of B")
* specifying attributes in timing comparisons (e.g., "Procedure, Performed: ABC (incision datetime)" starts before start of...)

The following XML schema defines the QDM `temporalRelation` extensional element:

    <?xml version="1.0" encoding="UTF-8"?>
    <xs:schema xmlns="urn:hhs-qdm:hqmf-r2-extensions:v1" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:hl7="urn:hl7-org:v3"
                targetNamespace="urn:hhs-qdm:hqmf-r2-extensions:v1"
                elementFormDefault="qualified">
        <xs:import namespace="urn:hl7-org:v3" schemaLocation="POQM_MT000001UV03.xsd"/>
        <xs:element name="temporalInformation" type="TemporalInformation"/>
        <xs:complexType name="TemporalInformation">
            <xs:sequence>
                <xs:element name="sourceAttribute" type="TemporalInformationAttribute" minOccurs="0"/>
                <xs:element name="targetAttribute" type="TemporalInformationAttribute" minOccurs="0"/>
                <xs:element name="delta" type="hl7:IVL_PQ" minOccurs="0"/>
            </xs:sequence>
            <xs:attribute name="precisionUnit" type="hl7:Code" use="required"/>
        </xs:complexType>
        <xs:complexType name="TemporalInformationAttribute">
            <xs:sequence>
                <xs:element name="id" type="hl7:II"/>
            </xs:sequence>
            <xs:attribute name="name" type="xs:string" use="required"/>
            <xs:attribute name="bound" type="TemporalInformationAttributeBound" use="required"/>
        </xs:complexType>
        <xs:simpleType name="TemporalInformationAttributeBound">
            <xs:restriction base="xs:string">
                <xs:enumeration value="effectiveTime.low"/>
                <xs:enumeration value="effectiveTime.high"/>
            </xs:restriction>
        </xs:simpleType>
    </xs:schema>

The `POQM_MT000001UV03.SourceOf4` type in the HQMF schema should be extended to allow 0..1 of the QDM
`temporalInformation` extension:

    <xs:schema xmlns="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema"
           xmlns:ex="urn:hl7-org/v3-example"
           xmlns:qdm="urn:hhs-qdm:hqmf-r2-extensions:v1"
           targetNamespace="urn:hl7-org:v3"
           elementFormDefault="qualified">
        <xs:import namespace="urn:hhs-qdm:hqmf-r2-extensions:v1" schemaLocation="hhs-qdm-hqmfr2-ext-v1.xsd"/>
        <!-- snip -->
        <xs:complexType name="POQM_MT000001UV03.SourceOf4">
            <xs:sequence>
                <xs:group ref="InfrastructureRootElements"/>
                <xs:element name="sequenceNumber" type="INT" minOccurs="0" maxOccurs="1"/>
                <xs:element name="pauseQuantity" type="PQ" minOccurs="0" maxOccurs="1"/>
                <xs:element name="localVariableName" type="ST" minOccurs="0" maxOccurs="1"/>
                <xs:element name="subsetCode" type="CS" minOccurs="0" maxOccurs="1"/>
                <xs:element ref="qdm:temporalInformation" minOccurs="0" maxOccurs="1"/>
                <xs:choice>
                    <xs:choice>
                        <!-- excluded for brevity of this documentation -->
                    </xs:choice>
                    <xs:element name="criteriaReference" type="POQM_MT000001UV03.CriteriaReference"
                                nillable="true"
                                minOccurs="1"
                                maxOccurs="1"/>
                </xs:choice>
            </xs:sequence>
            <xs:attributeGroup ref="InfrastructureRootAttributes"/>
            <xs:attribute name="nullFlavor" type="NullFlavor" use="optional"/>
            <xs:attribute name="typeCode" type="Code" use="required"/>
        </xs:complexType>
        <!-- snip -->
    </xs:schema>

## Implementation

Please note the following:

* Time units use the [Unified Code for Units of Measure](http://unitsofmeasure.org/ucum.html#para-31).
* The `qdm:temporalInformation` element should be used in every QDM timing expression; even those that do not
  use a delta.  This way the timing precision is _always_ specified in the HQMF.
* The `id` in `TemporalInformationAttribute` references the `id` of the data element representing the attribute.
  In some cases, MAT may need to generate `id`s where it otherwise wouldn't (e.g., participation roles).
* The `bound` in `TemporalInformationAttribute` indicates whether the attribute maps to the attribute data 
  criteria's effectiveTime low or high.  Consult the QDM-based HQMF Implementation Guide for correct mappings
  per attribute.
* When an attribute is used (and mapped to a low or high) it overrides the low/high specified by the relationship.
    * For example, `... starts before start of "Encounter, Performed: ABC (discharge datetime)"` is still valid 
      even though `departure datetime`maps to `effectiveTime.high`.

### Delta

When a temporal relationship specifies that one event is before or after another event, the `delta` specifies the 
acceptable amount of time between the points of comparison.  Other temporal relationships (such as `SCW` or `DURING`)
do _not_ allow a `delta` to be specified.  The following temporal relationships do _not_ allow `delta`:

* `SCW` - starts concurrent with
* `SCWE` - starts concurrent with end
* `SDU` - starts during
* `ECW` - ends concurrent with
* `ECWS` - ends concurrent with start
* `EDU` - ends during
* `CONCURRENT` - concurrent with
* `DURING` - during
* `OVERLAP` - overlaps

The `delta` element is an instance of the HL7 `IVL_PQ` type.  This allows a high and low to be specified, as well as
whether or not the high / low is closed.  The following table shows the general translation from a QDM delta phrase
to the `delta` element representation:

|  Phrase | Low | LowClosed | High | HighClosed |                                                                    Example (using 3 hour(s))                                                                     |
| ------- | --- | --------- | ---- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| &lt; x  | 0   | true      | x    | false      | &lt;qdm:delta lowClosed="true"><br/>&nbsp;&nbsp;&lt;low value="0" unit="h"/><br/>&nbsp;&nbsp;&lt;high value="3" unit="h"/><br/>&lt;/qdm:delta>                   |
| &lt;= x | 0   | true      | x    | true       | &lt;qdm:delta lowClosed="true" highClosed="true"><br/>&nbsp;&nbsp;&lt;low value="0" unit="h"/><br/>&nbsp;&nbsp;&lt;high value="3" unit="h"/><br/>&lt;/qdm:delta>    |
| = x     | x   | true      | x    | true       | &lt;qdm:delta lowClosed="true" highClosed="true"><br/>&nbsp;&nbsp;&lt;low value="3" unit="h"/><br/>&nbsp;&nbsp;&lt;high value="3" unit="h"/><br/>&lt;/qdm:delta> |
| >= x    | x   | true      | PINF | false      | &lt;qdm:delta lowClosed="true"><br/>&nbsp;&nbsp;&lt;low value="3" unit="h"/><br/>&nbsp;&nbsp;&lt;high nullFlavor="PINF"/><br/>&lt;/qdm:delta>                    |
| > x     | x   | false     | PINF | false      | &lt;qdm:delta><br/>&nbsp;&nbsp;&lt;low value="3" unit="h"/><br/>&nbsp;&nbsp;&lt;high nullFlavor="PINF"/><br/>&lt;/qdm:delta>                                     |

### Additional Temporal Codes

In addition, we are requesting that the following codes be added to the set of valid temporal codes in HQMF:

|    Code   |                  Meaning                  |
| --------- | ----------------------------------------- |
| SBSORSCW  | starts before or concurrent with start of |
| SASORSCW  | starts after or concurrent with start of  |
| SBEORSCWE | starts before or concurrent with end of   |
| SAEORSCWE | starts after or concurrent with end of    |
| EBEORECW  | ends before or concurrent with end of     |
| EAEORECW  | ends after or concurrent with end of      |
| EBSORECWS | ends before or concurrent with start of   |
| EASORECWS | ends after or concurrent with start of    |

## Examples

"Encounter, Performed: Inpatient" during "Measurement Period"

    <entry typeCode="DRIV">
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="DURING">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </encounterCriteria>
    </entry>

"Encounter, Performed: Inpatient" < 3 hour(s) starts before start of "Measurement Period"

    <entry typeCode="DRIV">
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="SBS">
                <qdm:temporalInformation precisionUnit="min">
                    <qdm:delta lowClosed="true">
                        <low value="0" unit="h"/>
                        <high value="3" unit="h"/>
                    </qdm:delta>
                </qdm:temporalInformation>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </encounterCriteria>
    </entry>

"Encounter, Performed: Inpatient" <= 3 hour(s) starts before start of "Procedure, Performed: Hip Fracture Surgery (incision datetime)"

    <!-- Procedure, Performed: Hip Fracture Surgery -->    
    <entry typeCode="DRIV">
        <procedureCriteria classCode="PROC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.67" />
            </templateId>
            <id root="6cc25a38-8781-4d79-a580-6a83d1b33575" />
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.258">
                <displayName value="Hip Fracture Surgery Grouping Value Set" />
            </code>
            <title value="procedure, Performed" />
            <statusCode code="completed" />
            <!-- Incision Datetime -->
            <outboundRelationship typeCode="REFR">
                <procedureCriteria classCode="PROC" moodCode="EVN">
                    <templateId>
                        <item root="2.16.840.1.113883.10.20.28.3.89"/>
                    </templateId>
                    <id root="d903f578-526d-49bc-98ed-bba5fe196a76"/>
                    <code code="34896006" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                        <displayName value="incision"/>
                    </code>
                    <statusCode code="completed"/>
                </procedureCriteria>
            </outboundRelationship>
        </procedureCriteria>
    </entry>
    
    <entry typeCode="DRIV">
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="SBS">
                <qdm:temporalInformation precisionUnit="min">
                    <qdm:targetAttribute name="incision datetime" bound="effectiveTime.low">
                        <qdm:id root="d903f578-526d-49bc-98ed-bba5fe196a76"/>
                    </qdm:targetAttribute>
                    <qdm:delta lowClosed="true" highClosed="true">
                        <low value="0" unit="h"/>
                        <high value="3" unit="h"/>
                    </qdm:delta>
                </qdm:temporalInformation>
                <criteriaReference classCode="PROC" moodCode="EVN">
                    <id root="6cc25a38-8781-4d79-a580-6a83d1b33575"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </encounterCriteria>
    </entry>

"Encounter, Performed: Inpatient (facility location arrival datetime)" <= 3 hour(s) starts before start of "Procedure, Performed: Hip Fracture Surgery (incision datetime)"

    <!-- Procedure, Performed: Hip Fracture Surgery -->    
    <entry typeCode="DRIV">
        <procedureCriteria classCode="PROC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.67" />
            </templateId>
            <id root="6cc25a38-8781-4d79-a580-6a83d1b33575" />
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.258">
                <displayName value="Hip Fracture Surgery Grouping Value Set" />
            </code>
            <title value="procedure, Performed" />
            <statusCode code="completed" />
            <!-- Incision Datetime -->
            <outboundRelationship typeCode="REFR">
                <procedureCriteria classCode="PROC" moodCode="EVN">
                    <templateId>
                        <item root="2.16.840.1.113883.10.20.28.3.89"/>
                    </templateId>
                    <id root="d903f578-526d-49bc-98ed-bba5fe196a76"/>
                    <code code="34896006" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                        <displayName value="incision"/>
                    </code>
                    <statusCode code="completed"/>
                </procedureCriteria>
            </outboundRelationship>
        </procedureCriteria>
    </entry>
    
    <entry typeCode="DRIV">
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <participation typeCode="LOC">
                <role classCode="SDLOC">
                    <templateId>
                        <item root="2.16.840.1.113883.10.20.28.3.92" />
                    </templateId>
                    <id>
                        <item root="439a6db0-f359-4dad-976a-892ab3ab7d20"/>
                    </id>
                </role>
            </participation>
            <temporallyRelatedInformation typeCode="SBS">
                <qdm:temporalInformation precisionUnit="min">
                    <qdm:sourceAttribute name="facility location arrival datetime"
                                         bound="effectiveTime.low">
                        <qdm:id root="439a6db0-f359-4dad-976a-892ab3ab7d20"/>
                    </qdm:sourceAttribute>
                    <qdm:targetAttribute name="incision datetime"
                                         bound="effectiveTime.low">
                        <qdm:id root="d903f578-526d-49bc-98ed-bba5fe196a76"/>
                    </qdm:targetAttribute>
                    <qdm:delta lowClosed="true" highClosed="true">
                        <low value="0" unit="h"/>
                        <high value="3" unit="h"/>
                    </qdm:delta>
                </qdm:temporalInformation>
                <criteriaReference classCode="PROC" moodCode="EVN">
                    <id root="6cc25a38-8781-4d79-a580-6a83d1b33575"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </encounterCriteria>
    </entry>

