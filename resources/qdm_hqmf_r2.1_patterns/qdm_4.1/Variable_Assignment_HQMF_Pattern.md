# Variable Assignment ([QDM-8](http://jira.oncprojectracking.org/browse/QDM-8))

Sometimes measure developers need to use a defined set of data elements in multiple pieces of logic throughout the 
measure.  Rather than copy the entire set of data elements in every place they are needed, measure developers can
define the set once and assign it to a variable.  Wherever the set of data elements is needed in the measure, it can
be referenced by the variable name.

Measure developers must follow these rules when assigning variables:

* variable names must start with a `$`, followed by a letter 
* variable names can only consist of letters, numbers, and the underscore character (`_`)
* variables can only be assigned to logic that results in a set of data elements
* variables cannot be assigned to any logic that uses specific occurrences
* once a variable is assigned, the same variable cannot be re-assigned in the same measure

## General Approach
* Variables are assigned to a _set_ of data elements whose membership does not change
* Variables are represented as an HQMF R2.1 data criteria representing what the variable was assigned to
  * In most cases this will probably be a `GrouperCriteria`
* In the HQMF R2.1, variable names are prefixed with `qdm_var_` and used as the `localVariableName` of the data 
  criteria, as well as the `ext` of its `id`
    * This allows for easy recognition of QDM variables in the HQMF R2.1 representation

## Example

NOTE: This example is _NOT_ intended to be medically accurate.  It is only intended to show how the _variable assignment_
concept can be modeled in QDM and HQMF R2.1.

### Human Readable

    $TargetMedications = Union of:
        "Medication, Order: BH Antidepressant medication"
        "Medication, Order: BH Mood stabilizer medication"
    
    $TargetEncounters = Union of:
        "Encounter, Performed: BH Outpatient encounter"
        "Encounter, Performed: BH Outpatient psychotherapy"
    
    AND: $TargetMedications during $TargetEncounters

### HQMF R2.1 Representation

    <!-- Medication, Order: BH Antidepressant medication -->
    <entry typeCode="DRIV">
        <localVariableName value="BHAntidepressantMedication"/>
        <substanceAdministrationCriteria classCode="SBADM" moodCode="RQO">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.51" />
            </templateId>
            <id root="27beb8e3-7c86-48cf-b430-235b72786dea" ext="BHAntidepressantMedication" />
            <title value="Medication, Order" />
            <statusCode code="active" />
            <participation typeCode="CSM">
            <role classCode="MANU">
                <playingMaterial classCode="MMAT" determinerCode="KIND">
                    <code valueSet="2.16.840.1.113883.3.1257.1.972">
                        <displayName value="BH Antidepressant medication Grouping Value Set" />
                    </code>
                  </playingMaterial>
              </role>
          </participation>
        </substanceAdministrationCriteria>
    </entry>
    
    <!-- Medication, Order: BH Mood stabilizer medication -->
    <entry typeCode="DRIV">
        <localVariableName value="BHMoodStabilizerMedication"/>
        <substanceAdministrationCriteria classCode="SBADM" moodCode="RQO">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.51" />
            </templateId>
            <id root="27beb8e3-7c86-48cf-b430-235b72786dea" ext="BHMoodStabilizerMedication" />
            <title value="Medication, Order" />
            <statusCode code="active" />
            <participation typeCode="CSM">
            <role classCode="MANU">
                <playingMaterial classCode="MMAT" determinerCode="KIND">
                    <code valueSet="2.16.840.1.113883.3.1257.1.950">
                        <displayName value="BH Mood stabilizer medication Grouping Value Set" />
                    </code>
                  </playingMaterial>
              </role>
          </participation>
        </substanceAdministrationCriteria>
    </entry>
    
    <!-- Grouper to Represent TargetMedications variable -->
    <entry typeCode="DRIV">
        <localVariableName value="qdm_var_TargetMedications"/>
        <grouperCriteria classCode="GROUPER" moodCode="EVN">
            <id root="0" extension="qdm_var_TargetMedications"/>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="SBADM" moodCode="RQO">
                    <id root="27beb8e3-7c86-48cf-b430-235b72786dea" ext="BHAntidepressantMedication" />
                </criteriaReference>
            </outboundRelationship>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="SBADM" moodCode="RQO">
                    <id root="27beb8e3-7c86-48cf-b430-235b72786dea" ext="BHMoodStabilizerMedication" />
                </criteriaReference>
            </outboundRelationship>
        </grouperCriteria>
    </entry>
    
    <!-- Encounter, Performed: BH Outpatient encounter -->
    <entry typeCode="DRIV">
        <localVariableName value="BHOutpatientEncounter"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" ext="BHOutpatientEncounter"/>
            <code valueSet="2.16.840.1.113883.3.464.1.49">
                <displayName value="BH Outpatient encounter Grouping Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
        </encounterCriteria>
    </entry>
    
    <!-- Encounter, Performed: BH Outpatient psychotherapy -->
    <entry typeCode="DRIV">
        <localVariableName value="BHOutpatientPsychotherapy"/>
        <encounterCriteria classCode="ENC" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.5"/>
            </templateId>
            <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" ext="BHOutpatientPsychotherapy"/>
            <code valueSet="2.16.840.1.113883.3.1257.1.973">
                <displayName value="BH Outpatient psychotherapy Grouping Value Set"/>
            </code>
            <title value="Encounter, Performed"/>
            <statusCode code="completed"/>
        </encounterCriteria>
    </entry>
    
    <!-- Grouper to Represent TargetEncounters variable -->
    <entry typeCode="DRIV">
        <localVariableName value="qdm_var_TargetEncounters"/>
        <grouperCriteria classCode="GROUPER" moodCode="EVN">
            <id root="0" extension="qdm_var_TargetEncounters"/>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" ext="BHOutpatientEncounter"/>
                </criteriaReference>
            </outboundRelationship>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="OR"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" ext="BHOutpatientPsychotherapy"/>
                </criteriaReference>
            </outboundRelationship>
        </grouperCriteria>
    </entry>
    
    <!-- Target Medications during TargetEncounters -->
    <entry typeCode="DRIV">
        <localVariableName value="TargetMedicationsDuringTargetEncounters"/>
        <grouperCriteria classCode="GROUPER" moodCode="EVN">
            <id root="0" extension="TargetMedicationsDuringTargetEncounters"/>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="AND"/>
                <criteriaReference classCode="GROUPER" moodCode="EVN">
                    <id root="0" ext="qdm_var_TargetMedications"/>
                </criteriaReference>
            </outboundRelationship>
            <temporallyRelatedInformation typeCode="DURING">
                <qdm:temporalInformation precisionUnit="min"/>
                <criteriaReference classCode="GROUPER" moodCode="EVN">
                    <id root="0" extension="qdm_var_TargetEncounters"/>
                </criteriaReference>
            </temporallyRelatedInformation>
        </grouperCriteria>
    </entry>
