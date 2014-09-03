# DateTimeDiff

The `DateTimeDiff` function returns the amount of time between two date/times (identified by attributes in two
QDM elements). The DateTimeDiff function is only valid for use in measure observations.

`DateTimeDiff` replaces the `DateDiff` and `TimeDiff` functions that were available in past versions of the QDM. 
Please note that these functions were previously allowed in measure population definitions, but DateTimeDiff
is not. Rather than DateTimeDiff, measure developers should use temporal relationships with quantity comparisons
in measure population definitions.

# QDM Human Readable Representation of DateTimeDiff

The `DateTimeDiff` function is represented by the phrase "Datetime difference of:" followed by references
to the two things to get the difference from:

    Median of: Datetime difference of:
        "Occurrence A of Encounter, Performed: Emergency Department Visit (facility location arrival datetime)"
        "Occurrence A of Encounter, Performed: Emergency Department Visit (facility location departure datetime)"

# HQMF R2.1 Representations

HQMF R2 does not have a native way to represent `DateTimeDiff`.  The `DateDiff` and `TimeDiff` functions were
both removed from the R2 version of HQMF.  Because `DateTimeDiff` takes two arguments, it is also not a good
candidate for the QDM subset extension.

As such, `DateTimeDiff` should be represented using the `expression` element in HQMF.  Based on the
QDM-based HQMF Implementation Guide, expressions should use JavaScript syntax, so `DateTimeDiff` will be
represented by a Javascript template using a `dateTimeDiff` function.

## DateTimeDiff Example

The following HQMF represents this QDM statement as a measure observation:

    Median of: Datetime difference of:
        "Occurrence A of Encounter, Performed: Emergency Department Visit (facility location arrival datetime)"
        "Occurrence A of Encounter, Performed: Emergency Department Visit (facility location departure datetime)"

The following HQMF template was crafted using the example in the HQMF R2 specification, section 4.27 as a guide.
There is some variation from that example, however, to remain consistent with how we represent occurrences and
attributes in HQMF R2.

Note that the `expression` used does require the HQMF generator to know the proper path from a data criteria
reference to the effectiveTime low or high representing the specified attribute.  It is not enough to simply
refer to only the data criteria. 

    <!-- in dataCriteriaSection -->
    
    <!-- Reference Object: Occurrence A of Encounter, Performed: Emergency Department Visit -->
    <entry typeCode="DRIV">
        <localVariableName value="refObjOccAofEncounterPerformedED"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="refObjOccAofEncounterPerformedED"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.292">
                <displayName value="Emergency Department Visit SNOMEDCT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
        </encounterCriteria>
    </entry>
    
    <!-- Occurence A of Encounter, Performed: Emergency Department Visit (facility location arrival datetime)-->
    <entry typeCode="DRIV">
        <localVariableName value="occAofEncounterPerformedEDArrival"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="occAofEncounterPerformedEDArrival"/>
            <participation typeCode="LOC">
                <role classCode="SDLOC">
                    <templateId>
                        <item root="2.16.840.1.113883.10.20.28.3.92" />
                    </templateId>
                    <id>
                        <item root="439a6db0-f359-4dad-976a-892ab3ab7d20"/>
                    </id>
                    <effectiveTime xsi:type="IVL_PQ">
                        <low flavorId="ANY.NONNULL"/>
                    </effectiveTime>
                </role>
            </participation>
            <outboundRelationship typeCode="OCCR">
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="refObjOccAofEncounterPerformedED"/>
                </criteriaReference>
            </outboundRelationship>
        </encounterCriteria>
    </entry>
    
    <!-- Occurence A of Encounter, Performed: Emergency Department Visit (facility location departure datetime)-->
    <entry typeCode="DRIV">
        <localVariableName value="occAofEncounterPerformedEDDeparture"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="occAofEncounterPerformedEDDeparture"/>
            <participation typeCode="LOC">
                <role classCode="SDLOC">
                    <templateId>
                        <item root="2.16.840.1.113883.10.20.28.3.92" />
                    </templateId>
                    <id>
                        <item root="439a6db0-f359-4dad-976a-892ab3ab7d20"/>
                    </id>
                    <effectiveTime xsi:type="IVL_PQ">
                        <high flavorId="ANY.NONNULL"/>
                    </effectiveTime>
                </role>
            </participation>
            <outboundRelationship typeCode="OCCR">
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="refObjOccAofEncounterPerformedED"/>
                </criteriaReference>
            </outboundRelationship>
        </encounterCriteria>
    </entry>
    
    <!-- Skip to MeasureObservation section -->
    <component>
        <measurObservationSection>
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.2.4" />
            </templateId>
            <code code="57027-5" codeSystem="2.16.840.1.113883.6.1">
                <displayName value="Measure Observation" />
            </code>
            <title value="Measure Observation Section" />
            <text>
                <!-- Human-readable goes here -->
            </text>
            <definition>
                <measureObservationDefinition classCode="OBS" moodCode="DEF">
                    <code code="AGGREGATE" codeSystem="2.16.840.1.113883.5.4"/>
                    <value xsi:type="PQ">
                        <expression value="occAofEncounterPerformedEDDeparture.Participation.Role.effectiveTime.high - occAofEncounterPerformedEDArrival.Participation.Role.effectiveTime.low"/>
                    </value>
                    <methodCode>
                        <item code="MEDIAN" codeSystem="2.16.840.1.113883.5.84" />
                    </methodCode>
                    <component>
                        <criteriaReference>
                            <id root="c75181d0-73eb-11de-8a39-0800200c9a66" extension="measurePopulation"/>
                        </criteriaReference>
                    </component> 
                </measureObservationDefinition>
            </definition>
        </measurObservationSection>
    </component>