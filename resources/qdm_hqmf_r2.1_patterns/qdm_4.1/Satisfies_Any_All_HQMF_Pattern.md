# Satisfies Any / Satisfies All ([QDM-4](http://jira.oncprojectracking.org/browse/QDM-4))

The `Satisfies Any` operator provides a mechanism for specifying that qualifying events must meet _at least one_ 
condition from a set of conditions. The `Satisfies All` operator provides a mechanism for specifying that qualifying
events must meet _all_ conditions from a set of conditions. This allows measure developers to filter a set of events
to only those that are of interest.

Individual conditions that qualify an event for selection should be listed on subsequent lines below the 
`Satisfies Any` or `Satisfies All` operator. Each of these conditions will be evaluated against the QDM element on the
left-hand side of the operator.  Events can satisfy _any_ condition to be in the result set for `Satisfies Any`, but 
must satisfy `all` conditions to be in the result set for  `Satisfies All`.

`Satisfies Any` and `Satisfies All` support the following types of conditions:

* timing relationships (e.g., "starts before start of...")
* timing relationships w/ operators (e.g., "< 5 day(s) starts before start of…")
* datatype-specific attribute conditions (e.g., "(length of stay < 90 day(s))")

`Satisfies Any` and `Satisfies All` do not support nested `NOT` operators.

## General Approach
* Represent each line under `Satisfies Any` / `Satisfies All` with a separate entry in the data criteria.
* A `GrouperCriteria` represents the full phrase by referencing the data criteria items in `outboundRelationship`s 
* `Satisfies Any` uses `OR` conjunction codes; `Satisfies All` uses `AND` conjunction codes

## Satisfies All Example

This example shows a satisfies all using timing relationships and a comparison on an attribute value.

NOTE: This example is _NOT_ intended to be medically accurate.  It is only intended to show how the _Satisfies All_
concept can be modeled in QDM and HQMF R2.1.  To ensure accuracy of representation, we've re-used several criteria 
examples directly from the QDM-based HQMF Implementation Guide.

### Human Readable

    AND: "Encounter, Performed: Inpatient Encounter" satisfies all
        during "Measurement Period"
        starts after start of "Diagnosis, Active: Venous Thromoembolism"
        (length of stay <= 120 day(s))

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
    
    <!-- Encounter, Performed: Inpatient Encounter DURING "Measurement Period" -->
    <entry typeCode="DRIV">
        <localVariableName value="inpatientEncounterDuringMeasurePeriod"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterDuringMeasurePeriod"/>
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
    
    <!-- Encounter, Performed: Inpatient Encounter SAS "Diagnosis, Active: Venous Thromoembolism" -->
    <entry typeCode="DRIV">
        <localVariableName value="inpatientEncounterSASVT"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterSASVT"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="SAS">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisVT"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </encounterCriteria>
    </entry>
    
    <!-- Encounter, Performed: Inpatient Encounter <= 120 Days -->
    <entry typeCode="DRIV">
        <localVariableName value="inpatientEncounterLT120"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterLT120"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <lengthOfStayQuantity >
                <uncertainRange highClosed="true">
                    <high xsi:type="PQ" value="120" unit="d"/>
                </uncertainRange>
            </lengthOfStayQuantity>
        </encounterCriteria>
    </entry>
    
    <!-- Diagnosis, Active: Venous Thromoembolism -->
    <entry typeCode="DRIV">
        <localVariableName value="diagnosisVT"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.1"/>
            </templateId>
            <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisVT"/>
            <code code="282291009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                <displayName value="Diagnosis"/>
            </code>
            <title value="Diagnosis, Active"/>
            <statusCode code="completed"/>
            <value xsi:type="CD" valueSet="2.16.840.1.113883.3.117.1.7.1.279">
                <displayName value="Venous Thromboembolism Grouping Value Set"/>
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
    
    <!-- Grouper to Represent Satisfies All -->
    <entry typeCode="DRIV">
        <localVariableName value="satisfiesAllExample"/>
        <grouperCriteria classCode="GROUPER" moodCode="EVN">
            <id root="0" extension="satisfiesAllExample"/>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="AND"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterDuringMeasurePeriod"/>
                </criteriaReference>
            </outboundRelationship>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="AND"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterSASVT"/>
                </criteriaReference>
            </outboundRelationship>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="AND"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterLT120"/>
                </criteriaReference>
            </outboundRelationship>
        </grouperCriteria>
    </entry>

## Satisfies Any Example

This example shows a satisfies any using two timing relationships (one with a comparison) and a comparison on an attribute value.

NOTE: This example is _NOT_ intended to be medically accurate.  It is only intended to show how the _Satisfies All_
concept can be modeled in QDM and HQMF R2.1.  To ensure accuracy of representation, we've re-used several criteria 
examples directly from the QDM-based HQMF Implementation Guide.

### Human Readable

    AND: "Encounter, Performed: Inpatient Encounter" satisfies any
        > 30 day(s) starts after start of "Diagnosis, Active: Venous Thromoembolism"
        during "Medication, Active: Leucovorin"
        (length of stay <= 120 day(s))

### HQMF R2.1

HQMF R2.1 representation is exactly the same as `Satisfies All`, except it uses the `OR` conjunction code instead of `AND`.
   
    <!-- Encounter, Performed: Inpatient Encounter > 30 day(s) SAS "Diagnosis, Active: Venous Thromoembolism" -->
    <entry typeCode="DRIV">
        <localVariableName value="inpatientEncounterSASVT"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterSASVT"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="SAS">
                <qdm:temporalInformation precisionUnit="d">
                    <qdm:delta>
                        <low value="30" unit="d"/>
                        <high nullFlavor="PINF"/>
                    </qdm:delta>
                </qdm:temporalInformation>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisVT"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </encounterCriteria>
    </entry>
    
    <!-- Encounter, Performed: Inpatient Encounter DURING "Medication, Active: Leucovorin" -->
    <entry typeCode="DRIV">
        <localVariableName value="inpatientEncounterDuringLeucovorin"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterDuringLeucovorin"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <temporallyRelatedInformation typeCode="DURING">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="SBADM" moodCode="EVN">
                    <id root="6c21f22e-3ae3-435d-a240-7718cc418b7d" extension="medicationLeucovorin" />
                </criteriaReference>
            </temporallyRelatedInformation>
        </encounterCriteria>
    </entry>
    
    <!-- Encounter, Performed: Inpatient Encounter <= 120 Days -->
    <entry typeCode="DRIV">
        <localVariableName value="inpatientEncounterLT120"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterLT120"/>
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.23">
                <displayName value="Inpatient Encounter SNOMED-CT Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
            <lengthOfStayQuantity >
                <uncertainRange highClosed="true">
                    <high xsi:type="PQ" value="120" unit="d"/>
                </uncertainRange>
            </lengthOfStayQuantity>
        </encounterCriteria>
    </entry>
    
    <!-- Diagnosis, Active: Venous Thromoembolism -->
    <entry typeCode="DRIV">
        <localVariableName value="diagnosisVT"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.1"/>
            </templateId>
            <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisVT"/>
            <code code="282291009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                <displayName value="Diagnosis"/>
            </code>
            <title value="Diagnosis, Active"/>
            <statusCode code="completed"/>
            <value xsi:type="CD" valueSet="2.16.840.1.113883.3.117.1.7.1.279">
                <displayName value="Venous Thromboembolism Grouping Value Set"/>
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
    
    <!-- Medication, Active: Leucovorin -->
    <entry typeCode="DRIV">
        <localVariableName value="medicationLeucovorin"/>
        <substanceAdministrationCriteria classCode="SBADM" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.44" />
            </templateId>
            <id root="6c21f22e-3ae3-435d-a240-7718cc418b7d" extension="medicationLeucovorin" />
            <title value="Medication, Active" />
            <statusCode code="active" />
            <participation typeCode="CSM">
                <role classCode="MANU">
                    <playingMaterial classCode="MMAT" determinerCode="KIND">
                        <code valueSet="2.16.840.1.113883.3.464.1003.196.12.1205">
                            <displayName value="Leucovorin Grouping Value Set" />
                        </code>
                    </playingMaterial>
                </role>
            </participation>
        </substanceAdministrationCriteria>
    </entry>
    
    <!-- Grouper to Represent Satisfies Any -->
    <entry typeCode="DRIV">
        <localVariableName value="satisfiesAnyExample"/>
        <grouperCriteria classCode="GROUPER" moodCode="EVN">
            <id root="0" extension="satisfiesAnyExample"/>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterSASVT"/>
                </criteriaReference>
            </outboundRelationship>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterDuringLeucovorin"/>
                </criteriaReference>
            </outboundRelationship>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterLT120"/>
                </criteriaReference>
            </outboundRelationship>
        </grouperCriteria>
    </entry>