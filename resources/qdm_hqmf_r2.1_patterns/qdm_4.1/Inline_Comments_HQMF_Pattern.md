# Inline Comments ([QDM-10](http://jira.oncprojectracking.org/browse/QDM-10))

Sometimes a measure developer may want to provide additional clarity to a difficult or complex section of logic.
The QDM allows measure developers to do this by using inline comments.  Any line starting with a `#` in the human 
readable format will be treated as a comment and will not alter the intent or execution of the logic.  Developers
can provide multiple lines of comments by starting each line with the `#` character.

Note that inline comments should be used sparingly, as their main purpose is to provide clarification for difficult
sections of logic.  Inline comments should _not_ be used to provide guidance that would alter or influence the
implementation of the logic.

## General Approach
* Comments are indicated by a line in which the first non-whitespace character is `#`
* There is an optional space between the `#` and the start of the comment text
    * additional whitespace after that should be considered part of the comment text (to allow for 
      intentional indenting, formatting, etc)
* Comments are embedded in HQMF R2.1 criteria objects
* Comments are stored in the criteria's `text/xml` element
* Comments are represented by a custom element of HL7 type: `StrucDoc.List`

## Multi-Line Example

NOTE: This example is _NOT_ intended to be medically accurate.  It is only intended to show how _inline comments_
can be modeled in QDM and HQMF R2.1.  To ensure accuracy of representation, we've re-used several criteria examples
directly from the QDM-based HQMF Implementation Guide.

### Human Readable

Comments should directly precede the criteria they reference in the human-readable.

    # We're interested in encounters that occurred:
    #     - during the measurement period
    #     - after a diagnosis of Venous Thromoembolism
    #     - and are 120 days or less
    AND: "Encounter, Performed: Inpatient Encounter" satisfies all
        during "Measurement Period"
        starts after start of "Diagnosis, Active: Venous Thromoembolism"
        (length of stay <= 120 day(s))

### HQMF R2.1 Representation

Note the special `qdmUserComments` element embedded in the `xml` element.  Each comment line is represented as an
`item` in the _ordered_ `StrucDoc.List`.
   
    <!-- Grouper with embedded QDM comments -->
    <entry typeCode="DRIV">
        <localVariableName value="inlineCommentsExample"/>
        <grouperCriteria classCode="GROUPER" moodCode="EVN">
            <id root="0" extension="inlineCommentsExample"/>
            <text>
                <xml>
                    <qdmUserComments xsi:type="StrucDoc.List" listType="ordered">
                        <item>We're interested in encounters that occurred:</item>
                        <item>    - during the measurement period</item>
                        <item>    - after a diagnosis of Venous Thromoembolism</item>
                        <item>    - and are 120 days or less</item>
                    </qdmUserComments>
                </xml>
            </text>
            <outboundRelationship typeCode="COMP">
                <conjunctionCode code="AND"/>
                <criteriaReference classCode="ENC" moodCode="EVN">
                    <id root="d7fbe089-ff04-4f58-b604-cb6d5ebce4cc" extension="inpatientEncounterDuringMP"/>
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
