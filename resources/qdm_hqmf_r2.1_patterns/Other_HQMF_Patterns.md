# Other HQMF Patterns

This document establishes other patterns and/or mappings for QDM concepts and attributes not documented in the
[QDM-based HQMF Implementation Guide R1](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=346)
or changed since R1 (and not documented elsewhere).

_NOTE: I've not included templateIds in any of these HQMF examples.  This is because we don't yet know what the_
_new template ids will be.  Note that these examples are also not guaranteed to be clinically accurate (or relevant)._

## Patient Characteristic Birthdate

`Patient Characteristic Birthdate` previously allowed users to associate an arbitrary valueset to it.  As a result, there
were inconsistent codes and valuesets used to represent birth.  Now users cannot enter a valueset, so _code_ is fixed to the
LOINC code `21112-8` (Birth Date), and _value_ is not allowed.

    "Patient Characteristic Birthdate"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="b591e825-d308-4f9e-9798-098bbd880975"/>
        <code code="21112-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
            <displayName value="Birth Date"/>
        </code>
        <title value="Patient Characteristic Birth Date"/>
        <statusCode code="completed"/>
    </observationCriteria>

## Patient Characteristic Expired

`Patient Characteristic Expired` previously allowed users to associate an arbitrary valueset to it.  As a result, there
were inconsistent codes and valuesets used to represent death.  Now users cannot enter a valueset and the _value_ is
fixed to the SNOMED-CT code `419099009` (Dead).

    "Patient Characteristic Expired"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="6b9cb746-991a-45b1-a0ea-e511e0a38a41"/>
        <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4">
            <displayName value="Assertion"/>
        </code>
        <title value="Patient Characteristic Expired"/>
        <statusCode code="completed"/>
        <value xsi:type="CD" code="419099009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
            <displayName value="Dead"/>
        </value>
    </observationCriteria>

## Patient Characteristic Expired (cause)

`Patient Characteristic Expired (reason)` has been renamed to `Patient Characteristic Expired (cause)`.  Given that the
intent of the meaning of _cause_ is different than the intent of the meaning of _reason_, the `Reason` template should
not be used.

The new `cause` attribute will be represented by an `OutboundRelationship` to an `ObservationCriteria` using the 
SNOMED-CT code `42752001` (due to).  The template for _Cause_ may be re-used in the future (for other types of causes,
not just cause of death).

    "Patient Characteristic Expired (cause: 'Myocardial Infarction')"
  
    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="6b9cb746-991a-45b1-a0ea-e511e0a38a41"/>
        <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4">
            <displayName value="Assertion"/>
        </code>
        <title value="Patient Characteristic Expired"/>
        <statusCode code="completed"/>
        <value xsi:type="CD" code="419099009" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
            <displayName value="Dead"/>
        </value>
        <outboundRelationship typeCode="CAUS">
            <observationCriteria classCode="OBS" moodCode="EVN">
                <id root="05c07740-1f8d-417e-a9f2-fc769b1d342d"/>
                <code code="42752001" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="Due to"/>
                </code>
                <title value="Cause"/>
                <value xsi:type="CD" valueSet="2.16.840.1.113883.3.526.3.403">
                    <displayName value="Myocardial Infarction Grouping Value Set"/>
                </value>
            </observationCriteria>
        </outboundRelationship>
    </observationCriteria>

## Medication, Order (active datetime)

`Medication, Order (active datetime)` is represented using the `SubstanceAdministrationCriteria`'s `effectiveTime/low`.

    "Medication, Order: BH Antidepressant medication (active datetime)"

    <substanceAdministrationCriteria classCode="SBADM" moodCode="RQO">
        <id root="27beb8e3-7c86-48cf-b430-235b72786dea" ext="BHAntidepressantMedication" />
        <title value="Medication, Order" />
        <statusCode code="active" />
        <effectiveTime xsi:type="IVL_PQ">
            <!-- active datetime is present -->
            <low flavorId="ANY.NONNULL"/>
        </effectiveTime>
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

## Medication, Order (signed datetime)

`Medication, Order (signed datetime)` is represented using the `SubstanceAdministrationCriteria`'s 
`participation[@typeCode="AUT"]/time/high`.

    "Medication, Order: BH Antidepressant medication (active datetime)"

    <substanceAdministrationCriteria classCode="SBADM" moodCode="RQO">
        <id root="27beb8e3-7c86-48cf-b430-235b72786dea" ext="BHAntidepressantMedication" />
        <title value="Medication, Order" />
        <statusCode code="active" />
        <participation typeCode="AUT">
            <time xsi:type="IVL_PQ">
                <!-- signed datetime is present -->
                <high flavorId="ANY.NONNULL"/>
            </time>
        </participation>
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

## Physical Exam / Diagnosis / Procedure / Device Applied (anatomical location site)

The `anatomical location site` attribute replaces the previous `anatomical structure` attribute.  It can be applied to
the following QDM datatypes:

* `Physical Exam, Order/Performed/Recommended` (represented by `ObservationCriteria`)
* `Diagnosis, Active/Inactive/Resolved` (represented by `ObservationCriteria`)
* `Procedure, Order/Performed/Recommended` (represented by `ProcedureCriteria`)
* `Device, Applied` (represented by `ProcedureCriteria`)

In all cases, `anatomical location site` maps to HQMF's `targetSiteCode`.

    "Physical Exam, Performed: Sensory Exam of Foot (anatomical location site: 'Left Foot')"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="74a0af1f-15ed-4536-854f-79a066953e44"/>
        <code code="5880005" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
            <displayName value="physical examination"/>
        </code>
        <title value="Physical Exam, Performed"/>
        <statusCode code="completed"/>
        <effectiveTime xsi:type="IVL_TS"/>
        <value xsi:type="CD" valueSet="2.16.840.1.113883.3.464.1003.103.12.1014">
            <displayName value="Sensory Exam of Foot"/>
        </value>
        <targetSiteCode>
            <item valueSet="1.2.3.4.5.6.7.8.9">
                <displayName value="Left Foot"/>
            </item>
        </targetSiteCode>
    </observationCriteria>

## Procedure / Device Applied (anatomical approach site)

The `anatomical approach site` attribute applies to the following QDM datatypes:

* `Procedure, Order/Performed/Recommended` (represented by `ProcedureCriteria`)
* `Device, Applied` (represented by `ProcedureCriteria`)

In both cases, `anatomical approach site` maps to HQMF's `approachSiteCode`.

    "Procedure, Performed: Laparoscopic Procedures (anatomical approach site: 'Navel')"

    <procedureCriteria classCode="PROC" moodCode="EVN">
        <id root="6cc25a38-8781-4d79-a580-6a83d1b33575" />
        <code valueSet="2.16.840.1.113762.1.4.1045.52">
            <displayName value="Laparoscopic Procedures" />
        </code>
        <title value="procedure, Performed" />
        <statusCode code="completed" />
        <approachSiteCode>
            <item valueSet="1.2.3.4.5.6.7.8.9">
                <displayName value="Navel"/>
            </item>
        </approachSiteCode>
    </procedureCriteria>

## Physical Exam (anatomical approach site)

Will be removed from `Physical Exam` dataypes (see [QDM-90](http://jira.oncprojectracking.org/browse/QDM-90)).

## Diagnostic Study / Functional Status / Laboratory Test / Risk Category Assessment (result)

QDM December 2013 removed the _... Result_ and _... Finding_ datatypes, in favor of moving the `result` and `status`
attributes to the corresponding _... Performed_ datatypes.

The following datatypes all map to `ObservationCriteria`:

* `Diagnostic Study, Performed`
* `Functional Status, Performed`
* `Laboratory Test, Performed`
* `Risk Category Assessment`

The above datatypes should map `result` to `Observation Criteria`'s `value` element.

    "Laboratory Test, Performed: LDL-c (result >= 100 mg/dL)"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="e7721501-9e5c-40b1-97f2-96e7c3e0aac1"/>
        <code valueSet="2.16.840.1.113883.3.117.1.7.1.215">
            <displayName value="LDL-c LOINC Value Set"/>
        </code>
        <title value="Laboratory Test, Performed"/>
        <statusCode code="completed"/>
        <value xsi:type="IVL_PQ" lowClosed="true">
            <low value="100" unit="mg/dL" />
        </value>
    </observationCriteria>

## Physical Exam, Performed (result)

The `Physical Exam, Performed` datatype is mapped to `ObservationCriteria`, but does not used the `value` element to
represent `result`.  This is because the QDM-Based HQMF IG fixes `code` to SNOMED-CT `5880005` (Physical Exam) and
uses the `value` element to carry the valueset provided by the measure developer.

As such, `Physical Exam, Performed` must use an outbound relationship (`REFR`) to the `Result` template:

    "Physical Exam, Performed: Weight (result)"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="74a0af1f-15ed-4536-854f-79a066953e44"/>
        <code code="5880005" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
            <displayName value="physical examination"/>
        </code>
        <title value="Physical Exam, Performed"/>
        <statusCode code="completed"/>
        <effectiveTime xsi:type="IVL_TS"/>
        <value xsi:type="CD" valueSet="2.16.840.1.113883.3.464.1003.121.12.1015">
            <displayName value="Weight"/>
        </value>
        <outboundRelationship typeCode="REFR">
            <observationCriteria classCode="OBS" moodCode="EVN">
                <id root="8df3591e-c19f-4470-a44e-9ca085783c7a"/>
                <code code="394617004" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="Result"/>
                </code>
                <title value="Result"/>
                <!-- result value is present -->
                <value xsi:type="ANY" flavorId="ANY.NONNULL"/>
            </observationCriteria>
        </outboundRelationship>
    </observationCriteria>

## Intervention / Procedure (result)

The `Intervention, Performed` datatype maps to `ActCriteria`, and the `Procedure, Performed` datatype maps to
`ProcedureCriteria`.  Neither has a `value` element, so they must use an outbound relationship (`REFR`) to the
`Result` template:

    "Procedure, Performed: Knee Replacement Surgery (result)"

    <procedureCriteria classCode="PROC" moodCode="EVN">
        <id root="6cc25a38-8781-4d79-a580-6a83d1b33575" />
        <code valueSet="2.16.840.1.113883.3.117.1.7.1.261">
            <displayName value="Knee Replacement Surgery Grouping Value Set" />
        </code>
        <title value="procedure, Performed" />
        <statusCode code="completed" />
        <outboundRelationship typeCode="REFR">
            <observationCriteria classCode="OBS" moodCode="EVN">
                <id root="8df3591e-c19f-4470-a44e-9ca085783c7a"/>
                <code code="394617004" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="Result"/>
                </code>
                <title value="Result"/>
                <!-- result value is present -->
                <value xsi:type="ANY" flavorId="ANY.NONNULL"/>
            </observationCriteria>
        </outboundRelationship>
    </procedureCriteria>

## Diagnostic Study / Intervention / Laboratory Test / Procedure (status)

QDM December 2013 removed the _... Result_ and _... Finding_ datatypes, in favor of moving the `result` and `status`
attributes to the corresponding _... Performed_ datatypes.  The following _... Performed_ datatypes now support
`status`:

* `Diagnostic Study, Performed` (represented by `ObservationCriteria`)
* `Intervention, Performed` (represented by `ActCriteria`)
* `Laboratory Test, Performed` (represented by `ObservationCriteria`)
* `Procedure, Performed` (represented by `ProcedureCriteria`)

In all cases, `status` is represented as an outbound relationship (`REFR`) to the `Status` template:

    "Laboratory Test, Performed: LDL-c (status)"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="e7721501-9e5c-40b1-97f2-96e7c3e0aac1"/>
        <code valueSet="2.16.840.1.113883.3.117.1.7.1.215">
            <displayName value="LDL-c LOINC Value Set"/>
        </code>
        <title value="Laboratory Test, Performed"/>
        <statusCode code="completed"/>
        <outboundRelationship typeCode="REFR">
            <observationCriteria classCode="OBS" moodCode="EVN">
                <id root="89474b1a-253e-4b72-a662-33a75d6eee0c"/>
                <code code="33999-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                    <displayName value="Status"/>
                </code>
                <title value="Status"/>
                <!-- status value is present -->
                <value xsi:type="ANY" flavorId="ANY.NONNULL"/>
            </observationCriteria>
        </outboundRelationship>
    </observationCriteria>

## Procedure (radiation duration)

The `Procedure, Ordered` and `Procedure, Performed` datatypes now support the `radiation duration` attribute.
The `radiation duration` attribute is represented as an `effectiveTime` inside the outbound relationship (`REFR`) to the
`Radiation Dosage and Duration` template:

    "Procedure, Performed: Radiation Therapy II (radiation duration)"

    <procedureCriteria classCode="PROC" moodCode="EVN">
        <id root="6cc25a38-8781-4d79-a580-6a83d1b33575" />
        <code valueSet="2.16.840.1.113883.3.526.2.1409">
            <displayName value="Radiation Therapy II" />
        </code>
        <title value="procedure, Performed" />
        <statusCode code="completed" />
        <outboundRelationship typeCode="REFR">
            <observationCriteria classCode="OBS" moodCode="EVN">
                <id root="306c596a-3611-409f-beb0-af29b0fcec9e"/>
                <code code="228815006" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="incident radiation dose"/>
                </code>
                <statusCode code="completed"/>
                <!-- Radiation duration is present -->
                <effectiveTime xsi:type="IVL_TS" flavorId="ANY.NONNULL"/>
            </observationCriteria>
        </outboundRelationship>
    </procedureCriteria>

_QUESTION: Is `effectiveTime` really the right mapping for `radiation duration`?  It doesn't seem you could ask_
_questions such as "was the `radiation duration` more than three hours?" It's unclear how `radiation duration`_
_could be used as it is currently mapped._

## Procedure, Performed (radiation dosage)

The `Procedure, Performed` datatype now supports the `radiation dosage` attribute. The `radiation dosage` attribute
is represented as the `value` inside an outbound relationship (`REFR`) to the `Radiation Dosage and Duration` template:

    "Procedure, Performed: Radiation Therapy II (radiation dosage)"

    <procedureCriteria classCode="PROC" moodCode="EVN">
        <id root="6cc25a38-8781-4d79-a580-6a83d1b33575" />
        <code valueSet="2.16.840.1.113883.3.526.2.1409">
            <displayName value="Radiation Therapy II" />
        </code>
        <title value="procedure, Performed" />
        <statusCode code="completed" />
        <outboundRelationship typeCode="REFR">
            <observationCriteria classCode="OBS" moodCode="EVN">
                <id root="306c596a-3611-409f-beb0-af29b0fcec9e"/>
                <code code="228815006" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="incident radiation dose"/>
                </code>
                <statusCode code="completed"/>
                <!-- Radiation dosage is present -->
                <value xsi:type="PQ" flavorId="ANY.NONNULL"/>
            </observationCriteria>
        </outboundRelationship>
    </procedureCriteria>

## Medication, Administered (cumulative medication duration)

The `Medication, Administered` datatype now supports the `cumulative medication duration` attribute.  This attribute
is represented the same way for this datatype as it is for `Medication, Active`, using an outbound relationship
(`REFR`) to the `Cumulative Medication Duration` template:

    "Medication, Administered: Warfarin (cumulative medication duration)"

    <substanceAdministrationCriteria classCode="SBADM" moodCode="EVN">
      <id root="de28ff02-d2cf-436e-898a-58eb49e15b47" />
      <code code="416118004" codeSystem="2.16.840.1.113883.6.96">
        <displayName value="Administration" />
      </code>
      <title value="Medication, Administered" />
      <statusCode code="completed" />
      <participation typeCode="CSM">
        <role classCode="MANU">
          <playingMaterial classCode="MMAT" determinerCode="KIND">
            <code valueSet="2.16.840.1.113883.3.117.1.7.1.232">
              <displayName value="Warfarin RxNorm Value Set" />
            </code>
          </playingMaterial>
        </role>
      </participation>
      <outboundRelationship typeCode="REFR">
            <observationCriteria classCode="OBS" moodCode="EVN">
                <id root="9e1822c6-1541-4ce2-af46-8b4980c8ac95"/>
                <code code="261773006" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="Duration of Therapy"/>
                </code>
                <title value="Cumulative Medication Duration"/>
                <!-- CMD value is present -->
                <value xsi:type="ANY" flavorId="ANY.NONNULL"/>
            </observationCriteria>
    </substanceAdministrationCriteria>

## Medication, Discharge (negation rationale)

For some reason, QDM December 2012 did not specify a `negation rationale` attribute for `Medication, Discharge`.  This
was corrected in QDM December 2013.  The `negation rationale` attribute is represented in the same way as on all other
datatypes (via the `actionNegationInd` attribute).

    "Medication, Discharge not done: Medical Reason" for "Warfarin"

    <substanceAdministrationCriteria classCode="SBADM" moodCode="RQO" actionNegationInd="true">
        <id root="7c7cb827-4ff6-4585-aba3-885a89c32083" />
        <code code="10183-2" codeSystem="2.16.840.1.113883.6.1">
            <displayName value="Discharge Medication" />
        </code>
        <title value="Medication, Discharge" />
        <statusCode code="active" />
        <participation typeCode="CSM">
            <role classCode="MANU">
                <playingMaterial classCode="MMAT" determinerCode="KIND">
                    <code valueSet="2.16.840.1.113883.3.117.1.7.1.232">
                        <displayName value="Warfarin RxNorm Value Set" />
                    </code>
                </playingMaterial>
            </role>
        </participation>
        <outboundRelationship typeCode="RSON">
            <observationCriteria classCode="OBS" moodCode="EVN">
                <id root="05c07740-1f8d-417e-a9f2-fc769b1d342d"/>
                <code code="410666004" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="Reason"/>
                </code>
                <title value="Reason"/>
                <value xsi:type="CD" valueSet="2.16.840.1.113883.3.526.2.313">
                    <displayName value="Medical Reason SNOMED-CT Value Set"/>
                </value>
            </observationCriteria>
        </outboundRelationship>
    </substanceAdministrationCriteria>

## Procedure, Intolerance (ordinality)

The `Procedure, Intolerance` datatype now supports the `ordinality` attribute.  This attribute is represented by the
`priorityCode` element on `ObservationCriteria`.

    "Procedure, Intolerance: Knee Replacement Surgery (ordinality: 'Principal')"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="f584ead4-808b-43c2-93e3-b8606e156233"/>
        <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4" codeSystemName="ActCode">
            <displayName value="Assertion"/>
        </code>
        <title value="Procedure, Intolerance"/>
        <statusCode code="completed"/>
        <priorityCode>
            <item valueSet="2.16.840.1.113883.3.117.1.7.1.14">
                <displayName value="Principal SNOMEDCT Value Set"/>
            </item>
        <priorityCode>
        <value xsi:type="CD" code="102460003" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
            <displayName value="Decreased tolerance"/>
        </value>
        <outboundRelationship typeCode="CAUS" inversionInd="true">
            <procedureCriteria moodCode="EVN">
                <id root="7d559e0a-4e01-4f52-b87b-a3342705e2f2"/>
                <code valueSet="2.16.840.1.113883.3.526.2.1076">
                    <displayName value="Knee Replacement Surgery SNOMED-CT Value Set"/>
                </code>
                <title value="Knee Replacement Operation"/>
                <statusCode code="completed"/>
            </procedureCriteria>
        </outboundRelationship>
    </observationCriteria>

## Procedure, Intolerance (method)

The `method` attribute will be removed from `Procedure, Intolerance` (see
[QDM-91](http://jira.oncprojectracking.org/browse/QDM-91)).