# Date Attribute Filtering

[QDM-72](https://jira.oncprojectracking.org/browse/QDM-72) introduced support for filtering events
by comparing datetime attributes to static dates.

# QDM Human Readable Representation

The human readable representation works much like any other attribute filter.  It allows a
date to be represented along with the proper comparision operator (`<`, `<=`, `=`, `>=`, `>`).
The following example would indicate patients born from 1965 through 1992:

    AND: "Patient Characteristic Birthdate: (start datetime >= 01/01/1965)"
    AND: "Patient Characteristic Birthdate: (start datetime <= 12/31/1992)"

# HQMF R2.1 Representation

In HQMF R2.1 and the QDM-based HQMF IG, datetime attributes are represented as a `TS` datatype
(in most cases, either the `low` or `high` of an `IVL_TS` _effectiveTime_).  The `TS` datatype is
defined to have either a `value` or an `uncertainRange`.

For attribute date filtering, `value` is used for equality (`=`) comparisons, but `uncertainRange`
is used for all inequality comparisons (`<`, `<=`, `>=`, `>`)

## Date Attribute Filtering Examples

### Equality Example

The following HQMF represents the observation that a patient was born on January 1, 1965:

    "Patient Characteristic Birthdate: (start datetime = 01/01/1965)"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="b591e825-d308-4f9e-9798-098bbd880975"/>
        <code code="21112-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
            <displayName value="Birth Date"/>
        </code>
        <title value="Patient Characteristic Birth Date"/>
        <statusCode code="completed"/>
        <effectiveTime xsi:type="IVL_TS">
            <low value="19650101"/>
        </effectiveTime>
    </observationCriteria>

### Inequality Example

The following HQMF represents these QDM statements indicating that a patient was born between
January 1, 1965 and December 31, 1992 (inclusive):

    AND: "Patient Characteristic Birthdate: (start datetime >= 01/01/1965)"
    AND: "Patient Characteristic Birthdate: (start datetime <= 12/31/1992)"

    <observationCriteria classCode="OBS" moodCode="EVN">
        <id root="b591e825-d308-4f9e-9798-098bbd880975"/>
        <code code="21112-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
            <displayName value="Birth Date"/>
        </code>
        <title value="Patient Characteristic Birth Date"/>
        <statusCode code="completed"/>
        <effectiveTime xsi:type="IVL_TS">
            <low>
              <uncertainRange>
                <low xsi:type="TS" value="19650101"/>
                <high xsi:type="TS" value="19921231"/>
              </uncertainRange>
            </low>
        </effectiveTime>
    </observationCriteria>

The above, however, is an optimization (since it combined the two `AND`s into a single criteria).
The actual representation would likely represent it as two criteria `AND`ed together:

    <!-- Precondition defined in Initial Patient Population -->
    <precondition>
        <allTrue>
            <precondition typeCode="PRCN">
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="e9a068dc-310a-48e4-95b0-eed852a8950b" extension="bornInOrAfter1965"/>
                </criteriaReference>
            </precondition>
            <precondition typeCode="PRCN">
                <criteriaReference classCode="OBS" moodCode="EVN">
                    <id root="e9a068dc-310a-48e4-95b0-eed852a8950b" extension="bornInOrBefore1992"/>
                </criteriaReference>
            </precondition>
            <!-- More preconditions here -->
        </allTrue>
    </precondition>
    
    <!-- Rest is in dataCriteriaSection -->
    
    <!-- Patient Characteristic Birthdate: (start datetime &gt;= 01/01/1965) -->
    <entry typeCode="DRIV">
        <localVariableName value="bornInOrAfter1965"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.54"/>
            </templateId>
            <id root="b591e825-d308-4f9e-9798-098bbd880975" ext="bornInOrAfter1965"/>
            <code code="21112-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                <displayName value="Birth Date"/>
            </code>
            <title value="Patient Characteristic Birth Date"/>
            <statusCode code="completed"/>
            <effectiveTime xsi:type="IVL_TS">
                <low>
                  <uncertainRange>
                    <low xsi:type="TS" value="19650101"/>
                    <high xsi:type="TS" nullFlavor="PINF"/>
                  </uncertainRange>
                </low>
            </effectiveTime>
        </observationCriteria>
    </entry>
    
    <!-- Patient Characteristic Birthdate: (start datetime <= 12/31/1992) -->
    <entry typeCode="DRIV">
        <localVariableName value="bornInOrBefore1992"/>
        <observationCriteria classCode="OBS" moodCode="EVN">
            <templateId>
                <item root="2.16.840.1.113883.10.20.28.3.54"/>
            </templateId>
            <id root="b591e825-d308-4f9e-9798-098bbd880975" ext="bornInOrBefore1992"/>
            <code code="21112-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
                <displayName value="Birth Date"/>
            </code>
            <title value="Patient Characteristic Birth Date"/>
            <statusCode code="completed"/>
            <effectiveTime xsi:type="IVL_TS">
                <low>
                  <uncertainRange>
                    <low xsi:type="TS" nullFlavor="NINF"/>
                    <high xsi:type="TS" value="19921231"/>
                  </uncertainRange>
                </low>
            </effectiveTime>
        </observationCriteria>
    </entry>

Since the above example used `<=` and `>=`, and since `lowClosed` and `highClosed` default to
`true`, we didn't have to specify `lowClosed` or `highClosed` in the `uncertainRange`s. If,
however, `<` or `>` were used, then the corresponding `highClosed` or `lowClosed` in the
`uncertainRange` would have to be set to `false`.

