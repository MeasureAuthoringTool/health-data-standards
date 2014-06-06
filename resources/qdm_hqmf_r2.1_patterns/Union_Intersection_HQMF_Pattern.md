# Union / Intersection ([QDM-9](http://jira.oncprojectracking.org/browse/QDM-9))

The `Union of` and `Intersection of` operators allow measure developers to define a set of events based on multiple
other sets of events.  When `Union of` is applied to multiple sets of events, the resulting set contains every event
from every set it operates on.  For example, the union of QDM element A and QDM element B is the set containing every 
event that is in A, or B, or A and B.  When `Intersection of` is applied to multiple sets of events, the resulting
set contains only the events that are in every single one of the sets it operates on.  For example, the intersection
of QDM element A and QDM element B is the set containing events that are in both A and B.

Components that should be _unioned_ or _intersected_ should be represented on subsequent lines below the `Union of`
or `Intersection of` operator. `Union of` and `Intersection of` support any data criteria that results in a set of events, including:

* QDM data elements (e.g., "Encounter, Performed: Office Visit")
* QDM occurrences (e.g., "Occurrence A of Encounter, Performed: Office Visit")
* QDM data elements w/ attributes (e.g., "Medication, Active: Warfarin (refills >= 1)")
* QDM expressions w/ timing relationships (e.g., "Encounter, Performed: Office Visit" during "Measurement Period")
* QDM variables (e.g., $targetEncounters)

NOTE: When perfoming an intersection, all components of the intersection should be of the same QDM datatype.  If different
datatypes are used, the result will always be an empty set.  For this reason, use cases for `Intersection of` are rare--
in most cases, `satisfies all` is a more appropriate operator.

## General Approach
* Represent each line under `Union of` / `Intersection of` with a separate entry in the data criteria
* A `GrouperCriteria` represents the full phrase by referencing the data criteria items in `outboundRelationship`s 
* `Union` uses `OR` conjunction codes; `Intersection` uses `AND` conjunction codes
* See HQMF R2 spec for more details on union and intersection

## Intersection Example

This example shows an intersection of office visits during the measurement period and office visits before a diagnosis
of Diabetes.  The resulting set contains all office visit encounters during the measurement period _and_ before a 
diagnosis of Diabetes.  If a diagnosis of diabetes occurred during the measurement period, the office visit in which
the diagnosis occurred and any office visits after would _not_ be in the resulting set. 

NOTE: This example is _NOT_ intended to be medically accurate.  It is only intended to show how the _Intersection of_
concept can be modeled in QDM and HQMF R2.1.

### Human Readable

    AND: Count >= 1 of: 
        Intersection of:
            "Encounter, Performed: Office Visit" during "Measurement Period"
            "Encounter, Performed: Office Visit" ends before start of "Diagnosis, Active: Diabetes"

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
    
    <!-- "Encounter, Performed: Office Visit" during "Measurement Period" -->
    <entry typeCode="DRIV">
        <localVariableName value="officeVisitDuringMP"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="officeVisitDuringMP"/>
            <code valueSet="2.16.840.1.113883.3.464.1003.101.12.1001">
                <displayName value="Office Visit Grouping Value Set"/>
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
    
    <!-- "Encounter, Performed: Office Visit" ends before start of "Diagnosis, Active: Diabetes" -->
    <entry typeCode="DRIV">
        <localVariableName value="officeVisitEBSDiabetes"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="officeVisitEBSDiabetes"/>
            <code valueSet="2.16.840.1.113883.3.464.1003.101.12.1001">
                <displayName value="Office Visit Grouping Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="EBS">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisDiabetes"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </encounterCriteria>
    </entry>
    
    <!-- Diagnosis, Active: Diabetes -->
    <entry typeCode="DRIV">
        <localVariableName value="diagnosisDiabetes"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.1"/>
            </templateId>
            <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisDiabetes"/>
            <code code="282291009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                <displayName value="Diagnosis"/>
            </code>
            <title value="Diagnosis, Active"/>
            <statusCode code="completed"/>
            <value xsi:type="CD" valueSet="2.16.840.1.113883.3.464.1003.103.12.1001">
                <displayName value="Diabetes Grouping Value Set"/>
            </value>
            <outboundRelationship typeCode="REFR">
                <observationCriteria classCode="OBS" moodCode="EVN">
                    <templateId>
                        <item root="2.16.840.1.113883.10.20.28.3.94"/>
                        <item root="2.16.840.1.113883.10.20.28.3.95"/>
                    </templateId>
                    <id root="4d1fa850-df0f-4733-8a4e-bef024c049f0"/>
                    <code code="33999-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                        <displayName value="Status"/>
                    </code>
                    <title value="Status Active"/>
                    <value xsi:type="CD" code="55561003" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                        <displayName value="Active"/>
                    </value>
                </observationCriteria>
            </outboundRelationship>
        </observationCriteria>
    </entry>
    
    <!-- Grouper to Represent Intersection Of -->
    <entry typeCode="DRIV">
        <localVariableName value="intersectionExample"/>
        <grouperCriteria classCode="GROUPER" moodCode="EVN">
            <id root="0" extension="intersectionExample"/>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="AND"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="officeVisitDuringMP"/>
                </criteriaReference>
            </outboundRelationship>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="AND"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="officeVisitEBSDiabetes"/>
                </criteriaReference>
            </outboundRelationship>
            <excerpt typeCode="XCRPT">
                <subsetCode code="SUM"/>
                <grouperCriteria classCode="GROUPER" moodCode="EVN">
                    <id root="0" extension="intersectionExample"/>
                    <repeatNumber lowClosed="true">
                        <low value="1"/>
                    </repeatNumber>
                <grouperCriteria/>
            </excerpt>
        </grouperCriteria>
    </entry>

## Union Example

This example shows a union of office visits and face-to-face interactions.  For example, if a patient had two office
visits and two face-to-face encounters, then the result of the union would be the set of all four encounters.  The
logic below would then select the _first_ of all office visit or face-to-face interaction encounters.

NOTE: This example is _NOT_ intended to be medically accurate.  It is only intended to show how the _Union of_
concept can be modeled in QDM and HQMF R2.1.

### Human Readable

    AND: FIRST: 
        Union of:
            "Encounter, Performed: Office Visit"
            "Encounter, Performed: Face-to-Face Interaction"

### HQMF R2.1 Representation
   
    <!-- Encounter, Performed: Office Visit -->
    <entry typeCode="DRIV">
        <localVariableName value="officeVisit"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="officeVisit"/>
            <code valueSet="2.16.840.1.113883.3.464.1003.101.12.1001">
                <displayName value="Office Visit Grouping Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
        </encounterCriteria>
    </entry>
    
    <!-- Encounter, Performed: Face-to-Face Interaction -->
    <entry typeCode="DRIV">
        <localVariableName value="faceToFace"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="faceToFace"/>
            <code valueSet="2.16.840.1.113883.3.464.1003.101.12.1048">
                <displayName value="Face-to-Face Interaction Grouping Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
        </encounterCriteria>
    </entry>
    
    <!-- Grouper to Represent Union Of -->
    <entry typeCode="DRIV">
        <localVariableName value="unionExample"/>
        <grouperCriteria classCode="GROUPER" moodCode="EVN">
            <id root="0" extension="unionExample"/>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="officeVisit"/>
                </criteriaReference>
            </outboundRelationship>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="faceToFace"/>
                </criteriaReference>
            </outboundRelationship>
            <excerpt typeCode="XCRPT">
                <subsetCode code="FIRST"/>
                <grouperCriteria classCode="GROUPER" moodCode="EVN">
                    <id root="0" extension="unionExample"/>
                <grouperCriteria/>
            </excerpt>
        </grouperCriteria>
    </entry>