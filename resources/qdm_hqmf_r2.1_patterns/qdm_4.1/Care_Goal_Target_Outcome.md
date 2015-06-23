# Care Goal (target outcome) ([QDM-50](http://jira.oncprojectracking.org/browse/QDM-50))

*_NOTE: This pattern should be considered DRAFT, as it is still awaiting confirmation for correctness._*

The Care Goal datatype now allows for a "target outcome" attribute to indicate that a measurable target outcome was
recorded.  This attribute can be used to filter goals by the existence of the target outcome or to filter by certain
values (represented by value sets or scalars).

## General Approach
* Similar to other attributes (e.g. "result"), use an `outboundRelationship`.
* The `outboundRelationship` should use `GOAL` typecode, relating to an `observationCriteria`

## Example Filtering for Existence of "target outcome" attribute

### Human Readable

    AND: "Care Goal: BMI Ratio (target outcome)"

### HQMF R2.1 Representation

    <observationCriteria classCode="OBS" moodCode="GOL">
        <templateId>
            <item root="2.16.840.1.113883.10.20.28.3.7" />
        </templateId>
        <id root="f0a729a3-6fe8-4e79-acee-b4dd16b3e755" />
        <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4" />
        <title value="Care Goal" />
        <statusCode code="active" />
        <value valueSet="2.16.840.1.113883.3.600.1.1490">
            <displayName value="BMI Ratio"/>
        </value>
        <outboundRelationship typeCode="GOAL">
            <observationCriteria classCode="OBS" moodCode="GOL">
                <templateId>
                    <item root="?"/>
                </templateId>
                <id root="6626ee8e-e72b-4382-97a0-9a00ac27763a"/>
                <code code="394617004" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="Result"/>
                </code>
                <title value="Result"/>
                <value xsi:type="ANY" flavorId="ANY.NONNULL" />
            </observationCriteria>
        </outboundRelationship>
    </observationCriteria>

## Example Filtering Against a Value Set

### Human Readable

    AND: "Care Goal: BMI Ratio (target outcome: 'Normal BMI Value Set')"

### HQMF R2.1 Representation

    <observationCriteria classCode="OBS" moodCode="GOL">
        <templateId>
            <item root="2.16.840.1.113883.10.20.28.3.7" />
        </templateId>
        <id root="f0a729a3-6fe8-4e79-acee-b4dd16b3e755" />
        <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4" />
        <title value="Care Goal" />
        <statusCode code="active" />
        <value valueSet="2.16.840.1.113883.3.600.1.1490">
            <displayName value="BMI Ratio"/>
        </value>
        <outboundRelationship typeCode="GOAL">
            <observationCriteria classCode="OBS" moodCode="GOL">
                <templateId>
                    <item root="?"/>
                </templateId>
                <id root="6626ee8e-e72b-4382-97a0-9a00ac27763a"/>
                <code code="394617004" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="Result"/>
                </code>
                <title value="Result"/>
                <value type="CD" valueSet="123.4567.89">
                    <!-- NOTE: Demonstration purposes only.  This value set does not exist. -->
                    <displayName value="Normal BMI Value Set"/>
                </value>
            </observationCriteria>
        </outboundRelationship>
    </observationCriteria>

## Example Filtering Against an Actual Value

### Human Readable

    AND: "Care Goal: BMI Ratio (target outcome < 25 kg/m2)"

### HQMF R2.1 Representation

    <observationCriteria classCode="OBS" moodCode="GOL">
        <templateId>
            <item root="2.16.840.1.113883.10.20.28.3.7" />
        </templateId>
        <id root="f0a729a3-6fe8-4e79-acee-b4dd16b3e755" />
        <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4" />
        <title value="Care Goal" />
        <statusCode code="active" />
        <value valueSet="2.16.840.1.113883.3.600.1.1490">
            <displayName value="BMI Ratio"/>
        </value>
        <outboundRelationship typeCode="GOAL">
            <observationCriteria classCode="OBS" moodCode="GOL">
                <templateId>
                    <item root="?"/>
                </templateId>
                <id root="6626ee8e-e72b-4382-97a0-9a00ac27763a"/>
                <code code="394617004" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT">
                    <displayName value="Result"/>
                </code>
                <title value="Result"/>
                <value xsi:type="IVL_PQ">
                    <high  value="25" unit="kg/m2"/>
                </value>
            </observationCriteria>
        </outboundRelationship>
    </observationCriteria>

