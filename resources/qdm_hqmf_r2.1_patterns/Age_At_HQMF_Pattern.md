# Age At ([QDM-12](http://jira.oncprojectracking.org/browse/QDM-12))

Many measures specify requirements on the patient’s age in order to be in the Initial Patient Population or the
denominator.  This construct is used often enough that QDM provides a special `Age At` function to determine a 
patient’s age at the start of an event.

According to the QDM time interval calculation guidance, when measuring age in _years_, the granularity of the
calculation will be _days_ (i.e., time of day is not significant). See Appendix B in the QDM 4.0 specification for more
details.

Note that the `Age At` operator is only valid within measure populations.  It cannot be used in measure observations.

## General Approach
* Use the `Patient Characteristic Birth Date` template with additional `temporallyRelatedInformation` to restrict the age

## Single Comparison Example

NOTE: This example is _NOT_ intended to be medically accurate.  It is only intended to show how the _Age At_
concept can be modeled in QDM and HQMF R2.1.  To ensure accuracy of representation, we've re-used criteria 
examples directly from the QDM-based HQMF Implementation Guide.

### Human Readable

    AND: Age >= 18 year(s) at "Measurement Period"

### HQMF R2.1 Representation
   
    <!-- MeasurePeriod defined in header -->
    <controlVariable>
        <measurePeriod>
            <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
            <code code="MSRTP" codeSystem="2.16.840.1.113883.5.4">
                <displayName value="Measurement period"/>
            </code>
            <!-- measure period defined as: Starting at Jan 1, 2012, for a period of 1 year, repeated every year" -->
            <value xsi:type="PIVL_TS">
                <phase lowClosed="true" highClosed="true">
                    <low value="201201010000"/>
                    <width xsi:type="PQ" value="1" unit="a"/>
                </phase>
                <period value="1" unit="a" />
            </value>
        </measurePeriod>
    </controlVariable>
    
    <!-- in dataCriteriaSection -->
    
    <!-- Age &gt;= 18 at start of measurement period -->
    <entry typeCode="DRIV">
        <localVariableName value="ageGreaterThanOrEqualTo18Y"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.54"/>
            </templateId>
            <id root="b591e825-d308-4f9e-9798-098bbd880975" ext="ageGreaterThanOrEqualTo18Y"/>
            <code code="21112-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                <displayName value="Birth Date"/>
            </code>
            <title value="Patient Characteristic Birth Date"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="SBS">
                <qdm:temporalInformation precisionUnit="d">
                    <qdm:delta lowClosed="true">
                        <low value="18" unit="a"/>
                        <high nullFlavor="PINF"/>
                    </qdm:delta>
                </qdm:temporalInformation>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
                </criteriaReference>  
            </temporallyRelatedInformation>
        </observationCriteria>
    </entry>

## Age Range Example

The `Age At` construct often needs to express a range.  In this case, it should be expressed using two statements.
If restricting the age at the beginning of an event other than the measure period, occurrences will need to be used
to ensure that both sides of the range are applied to each single occurrence.

NOTE: This example is _NOT_ intended to be medically accurate.  It is only intended to show how the _Age At_
concept can be modeled in QDM and HQMF R2.1.  To ensure accuracy of representation, we've re-used criteria 
examples directly from the QDM-based HQMF Implementation Guide.

### Human Readable

    AND: Age >= 2 year(s) at "Measurement Period"
    AND: Age < 18 year(s) at "Measurement Period"

### HQMF R2.1 Representation

    <!-- MeasurePeriod defined in header -->
    <controlVariable>
        <measurePeriod>
            <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
            <code code="MSRTP" codeSystem="2.16.840.1.113883.5.4">
                <displayName value="Measurement period"/>
            </code>
            <!-- measure period defined as: Starting at Jan 1, 2012, for a period of 1 year, repeated every year" -->
            <value xsi:type="PIVL_TS">
                <phase lowClosed="true" highClosed="true">
                    <low value="201201010000"/>
                    <width xsi:type="PQ" value="1" unit="a"/>
                </phase>
                <period value="1" unit="a" />
            </value>
        </measurePeriod>
    </controlVariable>
    
    <!-- Precondition defined in Initial Patient Population -->
    <precondition>
        <allTrue>
            <precondition typeCode="PRCN">
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="e9a068dc-310a-48e4-95b0-eed852a8950b" extension="ageGreaterThanOrEqualTo2Y"/>
                </criteriaReference>
            </precondition>
            <precondition typeCode="PRCN">
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="e9a068dc-310a-48e4-95b0-eed852a8950b" extension="ageLessThan18Y"/>
                </criteriaReference>
            </precondition>
            <!-- More preconditions here -->
        </allTrue>
    </precondition>
    
    <!-- Rest is in dataCriteriaSection -->
    
    <!-- Age &gt;= 2 at start of measurement period -->
    <entry typeCode="DRIV">
        <localVariableName value="ageGreaterThanOrEqualTo2Y"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.54"/>
            </templateId>
            <id root="b591e825-d308-4f9e-9798-098bbd880975" ext="ageGreaterThanOrEqualTo2Y"/>
            <code code="21112-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                <displayName value="Birth Date"/>
            </code>
            <title value="Patient Characteristic Birth Date"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="SBS">
                <qdm:temporalInformation precisionUnit="d">
                    <qdm:delta lowClosed="true">
                        <low value="2" unit="a"/>
                        <high nullFlavor="PINF"/>
                    </qdm:delta>
                </qdm:temporalInformation>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
                </criteriaReference>  
            </temporallyRelatedInformation>
        </observationCriteria>
    </entry>
    
    <!-- Age &lt; 18 at start of measurement period -->
    <entry typeCode="DRIV">
        <localVariableName value="ageLessThan18Y"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.54"/>
            </templateId>
            <id root="b591e825-d308-4f9e-9798-098bbd880975" ext="ageLessThan18Y"/>
            <code code="21112-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                <displayName value="Birth Date"/>
            </code>
            <title value="Patient Characteristic Birth Date"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="SBS">
                <qdm:temporalInformation precisionUnit="d">
                    <qdm:delta lowClosed="true">
                        <low value="0" unit="a"/>
                        <high value="18" unit="a"/>
                    </qdm:delta>
                </qdm:temporalInformation>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
                </criteriaReference>  
            </temporallyRelatedInformation>
        </observationCriteria>
    </entry>


