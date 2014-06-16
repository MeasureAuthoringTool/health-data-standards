# Representing Specific Occurrences in HQMF R2.1

The QDM notion of 'specific occurrences' allows measure authors to indicate that a set of criteria must all hold true
for a specific occurence of a given event.  For more detailed information on specific occurrences, see the
[QDM 4.0 specification](http://www.healthit.gov/quality-data-model) and the CQM Logic and Implementation Guidance:
[Implementing Computation of Specific Occurrences](http://projectcypress.org/documents/2014_eCQM_Specific_Occurrence_v14.pdf).

The HQMF R2 specification notes that, in many cases, specific occurrences can be represented using `GrouperCriteria`.
While this may be an ideal solution in many cases, implementation might be difficult given that it will not always be a
1-to-1 mapping from the QDM construct using occurrences to an HQMF construct using `GrouperCriteria`.  In addition,
these mappings can get complicated when you consider the use of specific occurrences in `OR` statements and how those
should be interpreted and executed.  Lastly, mapping the HQMF back to the proper QDM expressions might also prove to be
difficult.

QDM 4.0 introduced the `Satisfies All` operator.  One of the major advantages of `Satisfies All` is that it reduces the
need for measure authors to use occurrences.  Since `Satisfies All` is represented using a `GrouperCriteria`, it
actually fulfills the intention of the HQMF specification's guidance regarding using `GrouperCriteria` to represent
occurrences.

For the reasons stated above, we suggest that specific occurrences be represented in a way that provides a more
explicit 1-to-1 mapping between the QDM expressions and the HQMF representations.  This approach is more consistent
with the existing approach (in HQMF R1) and thus should be easier to transition measures from HQMF R1 to HQMF R2.

## General Approach
* Use one data criteria as the "target" that all specific occurrences of it point to
    * The "target" is never directly referenced from measure logic-- it is only referenced from specific occurrences
* Specific occurrences are represented as separate data criteria of the same type as the "target"
    * _With_ an `id` and any other restrictions applied to the specific occurrence
    * _Without_ `templateId`, `code`, `title`, or `statusCode` (these are inherited from the "target")
* Specific occurrences point to the "target" with an `outboundRelationship` of typeCode `OCCR`
    * NOTE: `OCCR` is currently under review for applicability.  It is subject to change.

## Example Using OutboundRelationship and OCCR

### Human Readable

    AND: "Occurrence A of Encounter, Performed: Ambulatory/ED Visit" during "Measurement Period"
    AND: "Medication, Order: Antibiotic Medications" <= 3 day(s) starts after start of "Occurrence A of Encounter, Performed: Ambulatory/ED Visit"
    AND:
        OR: "Occurrence A of Encounter, Performed: Ambulatory/ED Visit" during "Diagnosis, Active: Acute Pharyngitis"
        OR: "Diagnosis, Active: Acute Pharyngitis" starts during "Occurrence A of Encounter, Performed: Ambulatory/ED Visit"

### HQMF R2.1 Representation

The representation below shows only the definitions of the data criteria.  It does not show the preconditions since those
are represented as expected (referring to the individual occurrence data criteria entries).

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
    
    <!-- Reference Object: Occurrence A of Encounter, Performed: Ambulatory/ED Visit -->
    <entry typeCode="DRIV">
        <localVariableName value="refObjOccAofEncounterPerformedED"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="refObjOccAofEncounterPerformedED"/>
            <code valueSet="2.16.840.1.113883.3.464.1003.101.12.1061">
                <displayName value="Ambulatory/ED Visit Grouping Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
        </encounterCriteria>
    </entry>
    
    <!-- Occurence A of Encounter, Performed: Ambulatory/ED Visit -->
    <entry typeCode="DRIV">
        <localVariableName value="occAofEncounterPerformedED"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="occAofEncounterPerformedED"/>
            <outboundRelationship typeCode="OCCR">
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="refObjOccAofEncounterPerformedED"/>
                </criteriaReference>
            </outboundRelationship>
        </encounterCriteria>
    </entry>
    
    <!-- Occurence A of Encounter, Performed: Ambulatory/ED Visit during "MeasurementPeriod" -->
    <entry typeCode="DRIV">
        <localVariableName value="occAofEncounterPerformedEDDuringMeasurementPeriod"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="occAofEncounterPerformedEDDuringMeasurementPeriod"/>
            <temporallyRelatedInformation typeCode="DURING">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="2.16.840.1.113883.3.100.100.123" extension="MeasurePeriod"/>
                </criteriaReference>
            </temporallyRelatedInformation>
            <outboundRelationship typeCode="OCCR">
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="refObjOccAofEncounterPerformedED"/>
                </criteriaReference>
            </outboundRelationship>
        </encounterCriteria>
    </entry>
    
    <!-- "Medication, Order: Antibiotic Medications" <= 3 day(s) starts after start of "Occurrence A of Encounter, Performed: Ambulatory/ED Visit" -->
    <entry typeCode="DRIV">
        <localVariableName value="antibioticsAfterOccAofED"/>
        <substanceAdministrationCriteria classCode="SBADM" moodCode="RQO">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.51" />
            </templateId>
            <id root="27beb8e3-7c86-48cf-b430-235b72786dea" extension="antibioticsAfterOccAofED" />
            <title value="Medication, Order" />
            <statusCode code="active" />
            <participation typeCode="CSM">
                <role classCode="MANU">
                    <playingMaterial classCode="MMAT" determinerCode="KIND">
                        <code valueSet="2.16.840.1.113883.3.464.1003.196.12.1001">
                            <displayName value="Antibiotic Medications for Pharyngitis Grouping Value Set" />
                        </code>
                    </playingMaterial>
                </role>
            </participation>
            <temporallyRelatedInformation typeCode="SAS">
                <qdm:temporalInformation precisionUnit="d">
                    <qdm:delta lowClosed="true" highClosed="true">
                        <low value="0" unit="d"/>
                        <high value="3" unit="d"/>
                    </qdm:delta>
                </qdm:temporalInformation>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="occAofEncounterPerformedED"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </substanceAdministrationCriteria>
    </entry>
    
    <!-- Occurence A of Encounter, Performed: Ambulatory/ED Visit during Diagnosis, Active: Acute Pharyngitis -->
    <entry typeCode="DRIV">
        <localVariableName value="occAofEncounterPerformedEDDuringMeasurementPeriod"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="occAofEncounterPerformedEDDuringMeasurementPeriod"/>
            <temporallyRelatedInformation typeCode="DURING">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisAcutePharyngitis"/>
                </criteriaReference>
            </temporallyRelatedInformation>
            <outboundRelationship typeCode="OCCR">
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="refObjOccAofEncounterPerformedED"/>
                </criteriaReference>
            </outboundRelationship>
        </encounterCriteria>
    </entry>
    
    <!-- Diagnosis, Active: Acute Pharyngitis -->
    <entry typeCode="DRIV">
        <localVariableName value="diagnosisAcutePharyngitis"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.1"/>
            </templateId>
            <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisAcutePharyngitis"/>
            <code code="282291009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                <displayName value="Diagnosis"/>
            </code>
            <title value="Diagnosis, Active"/>
            <statusCode code="completed"/>
            <value xsi:type="CD" valueSet="2.16.840.1.113883.3.464.1003.102.12.1011">
                <displayName value="Acute Pharyngitis Grouping Value Set"/>
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
    
    <!-- Diagnosis, Active: Acute Pharyngitis during Occurrence A of Encounter, Performed: Ambulatory/ED Visit -->
    <entry typeCode="DRIV">
        <localVariableName value="diagnosisAcutePharyngitisDuringOccAofED"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.1"/>
            </templateId>
            <id root="9e4e810d-3c3e-461e-86f8-6fe7a0b1ca2b" extension="diagnosisAcutePharyngitisDuringOccAofED"/>
            <code code="282291009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                <displayName value="Diagnosis"/>
            </code>
            <title value="Diagnosis, Active"/>
            <statusCode code="completed"/>
            <value xsi:type="CD" valueSet="2.16.840.1.113883.3.464.1003.102.12.1011">
                <displayName value="Acute Pharyngitis Grouping Value Set"/>
            </value>
            <temporallyRelatedInformation typeCode="DURING">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="occAofEncounterPerformedED"/>
                </criteriaReference>
            </temporallyRelatedInformation>
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