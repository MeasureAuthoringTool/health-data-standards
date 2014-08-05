# Subset Codes in HQMF

The HQMF R2.1 Spec constrains the value of `excerpt/subsetCode` to be one of the following codes.

|   Code  |                            Spec Description                            |                                                                                                                           RIM Definition                                                                                                                           |
| :------ | :--------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `MAX`   | Selects the observation with the largest value                         | The occurrence whose value attribute is greater than all other occurrences _at the time the instance is created_.                                                                                                                                                  |
| `MIN`   | Selects the observation with the smallest value                        | The occurrence whose value attribute is less than all other occurrences _at the time the instance is created_.                                                                                                                                                     |
| `LAST`  | Selects the act that is expected to occur the _farthest in the future_ | Restricted to the latest known occurrence that is _scheduled to occur_. The Act with the highest known effective time.                                                                                                                                             |
| `FIRST` | Selects the first known occurrence of the act                          | Restricted to the earliest known occurrence that occurred or was scheduled to occur _in the past_. The Act with the lowest effective time. (_'now' is the time the instance is authored_.)                                                                         |
| `SUM`   | Represents a summary of all acts                                       | Represents a 'summary' of all acts that have occurred or were scheduled to occur and which are scheduled to occur in the future. The effectiveTime represents the outer boundary of all occurrences, repeatNumber represents the total number of repetitions, etc. |
| `CNT`   | Represents a count of all acts                                         | _Not present in the ActRelationshipSubset value set_                                                                                                                                                                                                               |

The referenced value set (ActRelationshipSubset - 2.16.840.1.113883.5.1099) also includes FUTURE, FUTSUM, NEXT, PAST, PREVSUM and RECENT.

# Subset Operators in QDM

The QDM defines functions and subset operators that can be used when defining a population:

|    Operator   |                                                                   Definition                                                                   |
| :------------ | :--------------------------------------------------------------------------------------------------------------------------------------------- |
| `First`       | The first occurrence of the associated QDM element or phrase. This is the first item in a list.                                                |
| `Second`      | The second occurrence of the associated QDM element or phrase. This is the second item in a list.                                              |
| `Third`       | The third occurrence of the associated QDM element or phrase. This is the third item in a list.                                                |
| `Fourth`      | The fourth occurrence of the associated QDM element or phrase. This is the fourth item in a list.                                              |
| `Fifth`       | The fifth occurrence of the associated QDM element or phrase. This is the fifth item in a list.                                                |
| `Most Recent` | The most recent occurrence of the associated QDM element or phrase. This is the last item in a list.                                           |
| `Count`       | The number of individual instances for a particular QDM element or set of QDM elements.                                                        |
| `Sum`         | Operates on a datatype-specific attribute for a QDM element, returning the sum of that attribute’s values across all of the events in the set. |
| `Min`         | Given a QDM element and attribute, the Min function extracts the minimum value from the matching set of events.                                |
| `Max`         | Given a QDM element and attribute, the Max function extracts the maximum value from the matching set of events.                                |
| `Median`      | For an ordered set of numbers (lowest to highest), the median is the middle value in the set.                                                  |
| `Average`     | For a set of numbers, the average (or mean) is the sum of the numbers divided by the count of the numbers.                                     |

## Issues

1. The HQMF specification subset code descriptions don't match the RIM definitions
2. The ActRelationshipSubset value set does not include the `CNT` code (but it is referenced in the HQMF specification)
3. QDM needs `subsetCode` to allow `AVERAGE` and `MEDIAN` to support expressions such as:
    `AVERAGE > 7% of "Laboratory Test, Result: HbA1c" during "Measurement Period"`
4. `FIRST` and `LAST` codes are defined in terms of "now" (which is defined as the time the HQMF was authored).  This does not match QDM semantic. For CQM purposes (always looking at past events) `RECENT` may be a better match than `LAST`, but still has the same problem regarding "now".

As a result of these issues, we must define a QDM extension that defines QDM-specific subset codes.

# HQMF R2.1 Representations

## The QDM SubsetCode Extension Datatype

HQMF R2.1 uses the `POQM_MT000001UV03.ExcerptFrom` XML datatype to excerpt subsets from a data criteria.  Normally, a
subset code would be specified in the child `subsetCode` element.  Since the `subsetCode` is `CNE` (Coded w/ No 
Extensions), we must extend `ExcerptFrom` with a new QDM-specific subset code element.

The following XML schema defines the QDM `subsetCode` extensional element (note that this schema should be combined
into the same schema with the `temporalInformation` extension):

    <?xml version="1.0" encoding="UTF-8"?>
    <xs:schema xmlns="urn:hhs-qdm:hqmf-r2-extensions:v1" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:hl7="urn:hl7-org:v3"
                targetNamespace="urn:hhs-qdm:hqmf-r2-extensions:v1"
                elementFormDefault="qualified">
        <xs:import namespace="urn:hl7-org:v3" schemaLocation="POQM_MT000001UV03.xsd"/>
        <xs:element name="subsetCode" type="hl7:CS"/>
    </xs:schema>

The `POQM_MT000001UV03.ExcerptFrom` type in the HQMF schema should be extended to allow 0..1 of the QDM
`subsetCode` extension:

    <xs:schema xmlns="urn:hl7-org:v3" xmlns:xs="http://www.w3.org/2001/XMLSchema"
           xmlns:ex="urn:hl7-org/v3-example"
           xmlns:qdm="urn:hhs-qdm:hqmf-r2-extensions:v1"
           targetNamespace="urn:hl7-org:v3"
           elementFormDefault="qualified">
        <xs:import namespace="urn:hhs-qdm:hqmf-r2-extensions:v1" schemaLocation="hhs-qdm-hqmfr2-ext-v1.xsd"/>
        <!-- snip -->
        <xs:complexType name="POQM_MT000001UV03.ExcerptFrom">
            <xs:sequence>
                <xs:group ref="InfrastructureRootElements"/>
                 <xs:element name="sequenceNumber" type="INT" minOccurs="0" maxOccurs="1"/>
                 <xs:element name="localVariableName" type="ST" minOccurs="0" maxOccurs="1"/>
                 <xs:element name="subsetCode" type="CS" minOccurs="0" maxOccurs="1"/>
                 <xs:element ref="qdm:subsetCode" minOccurs="0" maxOccurs="1"/>
                 <xs:choice>
                     <!-- excluded for brevity of this documentation -->
                 </xs:choice>
            </xs:sequence>
            <xs:attributeGroup ref="InfrastructureRootAttributes"/>
            <xs:attribute name="nullFlavor" type="NullFlavor" use="optional"/>
            <xs:attribute name="typeCode" type="ActRelationshipType" use="optional" fixed="XCRPT"/>
            <xs:attribute name="inversionInd" type="xs:boolean" use="optional" fixed="true"/>
        </xs:complexType>
        <!-- snip -->
    </xs:schema>

## QDM Subset Codes

QDM does not require a subset code for every operator listed above.  Some of these operators can be expressed _without_
a subset code, and some operators can _reuse_ the same subset code.  The following table lists the set of valid codes
that are needed and can be used in the `qdm:subsetCode`'s `code` attribute:

|      Code     |                        Description                        |
| :------------ | :-------------------------------------------------------- |
| `QDM_LAST`    | The last instance (chronologically) in the set of events  |
| `QDM_MIN`     | The instance whose value is less than all other instances |
| `QDM_MAX`     | The instance whose value is more than all other instances |
| `QDM_MEDIAN`  | An instance representing the median value                 |
| `QDM_AVERAGE` | An instance representing the average value                |
| `QDM_SUM`     | An instance representing the summed value                 |

See the QDM specification's description of the functions / subset operators for additional details.

While `QDM_LAST`, `QDM_MIN`, and `QDM_MAX` return actual instances from the set of events, `QDM_MEDIAN`, `QDM_AVERAGE`,
and `QDM_SUM` return a _summary_ event (not an actual event in the set).  Each scalar in the _summary_ event will 
represent the proper aggregate value based on the subset code (for example, the result of a `QDM_MEDIAN` subset code
will be a _summary_ event for which all attributes with scalar values contain the _median_ value of that attribute).

Note that there is not necessarily a 1-to-1 mapping from the functions / subset operators to QDM subset codes.  This
is because some concepts don't require subset codes and some map to different implementations of the same code.

## Examples

### Operators That Operate on QDM Datatypes

The following examples show various functions / operators applied to `"Encounter, Performed: Inpatient" during "Measurement Period"`.
Rather than repeat the whole data criteria for every example, each example will only show the `excerpt`, since that is the only
thing that changes.

Assume that each example's `excerpt` is embedded in this data criteria:

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
            <!-- 
                EXCERPT GOES HERE
            -->
        </encounterCriteria>
    </entry> 

### FIRST, SECOND, THIRD, FOURTH, FIFTH

The FIRST, SECOND, THIRD, FOURTH, and FIFTH subset operators are all represented using the `excerpt`'s `sequenceNumber`.
The `sequenceNumber` does _not_ use a 0-based index, so `FIRST` is represented as "1",  `SECOND` is represented as "2", 
and so on.  This representation aligns with the HQMF specification and does not require a subset operator.

    FIRST: "Encounter, Performed: Inpatient" during "Measurement Period"

    <excerpt>
        <sequenceNumber value="1"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
        </encounterCriteria>
    </excerpt>

### MOST RECENT

    MOST RECENT: "Encounter, Performed: Inpatient" during "Measurement Period"

    <excerpt>
        <qdm:subsetCode code="QDM_LAST"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
        </encounterCriteria>
    </excerpt>

### COUNT

    Count > 4 of: "Encounter, Performed: Inpatient" during "Measurement Period"

    <excerpt>
        <subsetCode code="SUM"/>
        <qdm:subsetCode code="QDM_SUM"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <repeatNumber>
                <low value="4"/>
                <high nullFlavor="PINF"/>
            </repeatNumber>
        </encounterCriteria>
    </excerpt>

NOTE: HL7 `subsetCode` is also used, with code `SUM` since the count is pulled from the summary.

### Operators That Operate on QDM Datatype Attributes

The remaining examples show various functions / operators applied to 
`"Encounter, Performed: Inpatient (length of stay)" during "Measurement Period"`.  Rather than repeat the whole data
criteria for every example, each example will only show the `excerpt`, since that is the only thing that changes.

Assume that each example's `excerpt` is embedded in this data criteria (note the non-null `lengthOfStayQuantity`):

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
            <lengthOfStayQuantity xsi:type="ANY" flavorId="ANY.NONNULL"/>
            <temporallyRelatedInformation typeCode="DURING">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
                </criteriaReference>
            </temporallyRelatedInformation>
            <!-- 
                EXCERPT GOES HERE
            -->
        </encounterCriteria>
    </entry> 

### MIN

    Min > 1 day(s) of: "Encounter, Performed: Inpatient (length of stay)" during "Measurement Period"

    <excerpt>
        <qdm:subsetCode code="QDM_MIN"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <lengthOfStayQuantity>
                <uncertainRange>
                    <low xsi:type="PQ" value="1" unit="d"/>
                    <high nullValue="PINF"/>
                </uncertainRange>
            </lengthOfStayQuantity>
        </encounterCriteria>
    </excerpt>

### MAX

    Max < 3 day(s) of: "Encounter, Performed: Inpatient (length of stay)" during "Measurement Period"

    <excerpt>
        <qdm:subsetCode code="QDM_MAX"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <lengthOfStayQuantity>
                <uncertainRange>
                    <low nullValue="NINF"/>
                    <high xsi:type="PQ" value="3" unit="d"/>
                </uncertainRange>
            </lengthOfStayQuantity>
        </encounterCriteria>
    </excerpt>

### SUM

    Sum >= 30 day(s) of: "Encounter, Performed: Inpatient (length of stay)" during "Measurement Period"

    <excerpt>
        <subsetCode code="SUM"/>
        <qdm:subsetCode code="QDM_SUM"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <lengthOfStayQuantity>
                <uncertainRange lowClosed="true">
                    <low xsi:type="PQ" value="30" unit="d"/>
                    <high nullValue="PINF"/>
                </uncertainRange>
            </lengthOfStayQuantity>
        </encounterCriteria>
    </excerpt>

NOTE: HL7 `subsetCode` is also used, with code `SUM` since `QDM_SUM` is a type of summary.

### MEDIAN

    Median > 5 day(s) of: "Encounter, Performed: Inpatient (length of stay)" during "Measurement Period"

    <excerpt>
        <qdm:subsetCode code="QDM_MEDIAN"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <lengthOfStayQuantity>
                <uncertainRange>
                    <low xsi:type="PQ" value="5" unit="d"/>
                    <high nullValue="PINF"/>
                </uncertainRange>
            </lengthOfStayQuantity>
        </encounterCriteria>
    </excerpt>

### AVERAGE

    Average > 5 day(s) of: "Encounter, Performed: Inpatient (length of stay)" during "Measurement Period"

    <excerpt>
        <qdm:subsetCode code="QDM_AVERAGE"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounter"/>
            <lengthOfStayQuantity>
                <uncertainRange>
                    <low xsi:type="PQ" value="5" unit="d"/>
                    <high nullValue="PINF"/>
                </uncertainRange>
            </lengthOfStayQuantity>
        </encounterCriteria>
    </excerpt>