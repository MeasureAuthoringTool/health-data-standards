Immunizations ([QDM-87](http://jira.oncprojectracking.org/browse/QDM-87)\)
==========================================================================

The QDM User Group has proposed that Immunizations be represented using their own data types (as opposed to using the Medication data types). This introduces new templates for the following data types: `Immunization, Administered`, `Immunization, Order`, `Immunization, Allergy`, and `Immunization, Intolerance`. These will be in a new QDM `Immunization` category.

> Immunization represents vaccines administered to patients in healthcare settings, but does not include non-vaccine agents.

General Approach
----------------

The new Immunization data types are based on the existing Medication data types, so most aspects of the existing HQMF patterns will be the same.

Immunization, Administered Overview
-----------------------------------

`Immunization, Administered` will have the following QDM definition (based on the `Medication, Administered` definition):

> Data elements that meet criteria using this datatype should document that the vaccine indicated by the QDM category and its corresponding value set was actually administered to the patient.

The `Immunization, Administered` data type contains the following attributes:

-	`dose`
-	`route`
-	`reason`
-	`start datetime`
-	`stop datetime`
-	`negation rationale`

Note that this template is a simple subset of the `Medication, Administered` template. There are no distinguishing characteristics of an `Immunization, Administered` entry except for the `templateId` and that the `participation/role/playingManufacturedMaterial/code/@valueset` expansion will contain CVX codes.

Immunization, Administered Contexts
-----------------------------------

| Contained By                     | Contains |
|:---------------------------------|:---------|
| Data Criteria Section (optional) | Reason   |

Immunization, Administered Constraints Overview
-----------------------------------------------

substanceAdministrationCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.112)

| XPath                                    | Card. | Verb   | Data Type | Value                                                                     | QDM Attribute            |
|:-----------------------------------------|:------|:-------|:----------|:--------------------------------------------------------------------------|:-------------------------|
| @classCode                               | 1..1  | SHALL  |           | SBADM                                                                     |                          |
| @moodCode                                | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                                  |                          |
| @actionNegationInd                       | 0..1  | MAY    |           |                                                                           | negation rationale       |
| templateId                               | 1..1  | SHALL  |           |                                                                           |                          |
| &nbsp; item                              | 1..1  | SHALL  |           |                                                                           |                          |
| &nbsp;&nbsp; @root                       | 1..1  | SHALL  |           | 2.16.840.1.113883.10.20.28.3.112                                          |                          |
| id                                       | 1..1  | SHALL  |           |                                                                           |                          |
| code                                     | 1..1  | SHALL  |           |                                                                           |                          |
| &nbsp; @code                             | 1..1  | SHALL  |           | 416118004                                                                 |                          |
| &nbsp; @codeSystem                       | 1..1  | SHALL  |           | 2.16.840.1.113883.6.96 (SNOMED CT)                                        |                          |
| title                                    | 1..1  | SHALL  |           |                                                                           |                          |
| statusCode                               | 1..1  | SHALL  |           |                                                                           |                          |
| &nbsp; @code                             | 1..1  | SHALL  |           | 2.16.840.1.113883.5.14 (ActStatus) = completed                            |                          |
| effectiveTime                            | 0..1  | MAY    | IVL_TS    |                                                                           |                          |
| &nbsp; low                               | 0..1  | MAY    |           |                                                                           | start datetime           |
| &nbsp; high                              | 0..1  | MAY    |           |                                                                           | stop datetime            |
| routeCode                                | 0..1  | MAY    |           |                                                                           |                          |
| &nbsp; @valueSet                         | 0..1  | SHOULD |           |                                                                           | route                    |
| doseQuantity                             | 0..1  | MAY    |           |                                                                           | dose                     |
| participation                            | 1..1  | SHALL  |           |                                                                           |                          |
| &nbsp; @typeCode                         | 1..1  | SHALL  |           | 2.16.840.1.113883.5.90 (HL7ParticipationType) = CSM                       |                          |
| &nbsp; role                              | 1..1  | SHALL  |           |                                                                           |                          |
| &nbsp;&nbsp; @classCode                  | 1..1  | SHALL  |           | 2.16.840.1.113883.5.110 (RoleClass) = MANU                                |                          |
| &nbsp;&nbsp; playingManufacturedMaterial | 1..1  | SHALL  |           |                                                                           |                          |
| &nbsp;&nbsp;&nbsp; @classCode            | 1..1  | SHALL  |           | 2.16.840.1.113883.5.41 (EntityClass) = MMAT                               |                          |
| &nbsp;&nbsp;&nbsp; @determinerCode       | 1..1  | SHALL  |           | 2.16.840.1.113883.5.30 (HL7EntityDeterminer) = KIND                       |                          |
| &nbsp;&nbsp;&nbsp; code                  | 1..1  | SHALL  |           |                                                                           |                          |
| &nbsp;&nbsp;&nbsp;&nbsp; @valueSet       | 0..1  | SHOULD |           |                                                                           | {$QDMElementValueSetOID} |
| outboundRelationship                     | 0..1  | MAY    |           |                                                                           |                          |
| &nbsp; @typeCode                         | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = RSON                  |                          |
| &nbsp; observationCriteria               | 1..1  | SHALL  |           | Reason (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.88:2014-11-24) | reason                   |

Immunization, Administered Example
----------------------------------

```xml
<substanceAdministrationCriteria classCode="SBADM" moodCode="EVN">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.112"/>
    </templateId>
    <id root="de28ff02-d2cf-436e-898a-58eb49e15b47"/>
    <code code="416118004" codeSystem="2.16.840.1.113883.6.96">
        <displayName value="Administration"/>
    </code>
    <title value="Immunization, Administered"/>
    <statusCode code="completed"/>
    <participation typeCode="CSM">
        <role classCode="MANU">
            <playingManufacturedMaterial classCode="MMAT" determinerCode="KIND">
                <code valueSet="{$QDMElementValueSetOID}"/>
            </playingManufacturedMaterial>
        </role>
    </participation>
</substanceAdministrationCriteria>
```

Immunization, Order Overview
----------------------------

`Immunization, Order` will have the following QDM definition (based on the `Medication, Order` definition):

> Data elements that meet criteria using this datatype should document a request for the immunization indicated by the QDM category and its corresponding value set.
>
> NOTE: The start and stop datetime of Immunization, Order reflects the "author time" of the record in QRDA. This corresponds to when the order was signed.

The `Immunization, Order` data type contains the following attributes:

-	`dose`
-	`route`
-	`reason`
-	`active datetime`
-	`signed datetime`
-	`start datetime`
-	`stop datetime`
-	`negation rationale`

Note that this template is a simple subset of the `Medication, Order` template. There are no distinguishing characteristics of an `Immunization, Order` entry except for the `templateId` and that the `participation/role/playingManufacturedMaterial/code/@valueset` expansion will contain CVX codes.

Immunization, Order Contexts
----------------------------

| Contained By                     | Contains |
|:---------------------------------|:---------|
| Data Criteria Section (optional) | Reason   |

Immunization, Order Constraints Overview
----------------------------------------

substanceAdministrationCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.113)

| XPath                                    | Card. | Verb   | Data Type | Value                                                                     | QDM Attribute                                   |
|:-----------------------------------------|:------|:-------|:----------|:--------------------------------------------------------------------------|:------------------------------------------------|
| @classCode                               | 1..1  | SHALL  |           | SBADM                                                                     |                                                 |
| @moodCode                                | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = RQO                                  |                                                 |
| @actionNegationInd                       | 0..1  | MAY    |           |                                                                           | negation rationale                              |
| templateId                               | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp; item                              | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp;&nbsp; @root                       | 1..1  | SHALL  |           | 2.16.840.1.113883.10.20.28.3.113                                          |                                                 |
| id                                       | 1..1  | SHALL  |           |                                                                           |                                                 |
| code                                     | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp; @code                             | 1..1  | SHALL  |           | 416118004                                                                 |                                                 |
| &nbsp; @codeSystem                       | 1..1  | SHALL  |           | 2.16.840.1.113883.6.96 (SNOMED CT)                                        |                                                 |
| title                                    | 1..1  | SHALL  |           |                                                                           |                                                 |
| statusCode                               | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp; @code                             | 1..1  | SHALL  |           | 2.16.840.1.113883.5.14 (ActStatus) = active                               |                                                 |
| effectiveTime                            | 0..1  | MAY    | IVL_TS    |                                                                           |                                                 |
| &nbsp; low                               | 0..1  | MAY    |           |                                                                           | active datetime                                 |
| routeCode                                | 0..1  | MAY    |           |                                                                           |                                                 |
| &nbsp; @valueSet                         | 0..1  | SHOULD |           |                                                                           | route                                           |
| doseQuantity                             | 0..1  | MAY    |           |                                                                           | dose                                            |
| participation                            | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp; @typeCode                         | 1..1  | SHALL  |           | 2.16.840.1.113883.5.90 (HL7ParticipationType) = CSM                       |                                                 |
| &nbsp; role                              | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp;&nbsp; @classCode                  | 1..1  | SHALL  |           | 2.16.840.1.113883.5.110 (RoleClass) = MANU                                |                                                 |
| &nbsp;&nbsp; playingManufacturedMaterial | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp;&nbsp;&nbsp; @classCode            | 1..1  | SHALL  |           | 2.16.840.1.113883.5.41 (EntityClass) = MMAT                               |                                                 |
| &nbsp;&nbsp;&nbsp; @determinerCode       | 1..1  | SHALL  |           | 2.16.840.1.113883.5.30 (HL7EntityDeterminer) = KIND                       |                                                 |
| &nbsp;&nbsp;&nbsp; code                  | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp;&nbsp;&nbsp;&nbsp; @valueSet       | 0..1  | SHOULD |           |                                                                           | {$QDMElementValueSetOID}                        |
| participation                            | 0..1  | MAY    |           |                                                                           |                                                 |
| &nbsp; @typeCode                         | 1..1  | SHALL  |           | 2.16.840.1.113883.5.90 (HL7ParticipationType) = AUT                       |                                                 |
| &nbsp; time                              | 0..1  | SHOULD |           |                                                                           |                                                 |
| &nbsp;&nbsp; low                         | 0..1  | MAY    |           |                                                                           | start datetime *(default start)*                |
| &nbsp;&nbsp; high                        | 0..1  | MAY    |           |                                                                           | signed datetime, stop datetime *(default stop)* |
| &nbsp; role                              | 1..1  | SHALL  |           |                                                                           |                                                 |
| &nbsp;&nbsp; @classCode                  | 1..1  | SHALL  |           | ROL                                                                       |                                                 |
| &nbsp;&nbsp; id                          | 1..1  | SHALL  |           |                                                                           |                                                 |
| outboundRelationship                     | 0..1  | MAY    |           |                                                                           |                                                 |
| &nbsp; @typeCode                         | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = RSON                  |                                                 |
| &nbsp; observationCriteria               | 1..1  | SHALL  |           | Reason (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28 3.88:2014-11-24) | reason                                          |

Immunization, Order Example
---------------------------

```xml
<substanceAdministrationCriteria classCode="SBADM" moodCode="RQO">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.113"/>
    </templateId>
    <id root="27beb8e3-7c86-48cf-b430-235b72786dea"/>
    <title value="Immunization, Order"/>
    <statusCode code="active"/>
    <participation typeCode="CSM">
        <role classCode="MANU">
            <playingMaterial classCode="MMAT" determinerCode="KIND">
                <code valueSet="{$QDMElementValueSetOID}"/>
            </playingMaterial>
        </role>
    </participation>
</substanceAdministrationCriteria>
```

Immunization, Allergy Overview
------------------------------

`Immunization, Allergy` will have the following QDM definition (based on the `Medication, Allergy` definition):

> Data elements that meet criteria using this datatype should document an immunologically mediated reaction that exhibits specificity and recurrence on re-exposure to the offending vaccine indicated by the QDM category and its corresponding value set.

The `Immunization, Allergy` data type contains the following attributes:

-	`reaction`
-	`start datetime`
-	`stop datetime`

Note that this template is a simple subset of the `Medication, Allergy` template. There are no distinguishing characteristics of an `Immunization, Allergy` entry except for the `templateId` and that the `participation/role/playingManufacturedMaterial/code/@valueset` expansion will contain CVX codes.

Immunization, Allergy Contexts
------------------------------

| Contained By                     | Contains |
|:---------------------------------|:---------|
| Data Criteria Section (optional) | Reaction |

Immunization, Allergy Constraints Overview
------------------------------------------

observationCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.114)

| XPath                              | Card. | Verb   | Data Type | Value                                                                       | QDM Attribute            |
|:-----------------------------------|:------|:-------|:----------|:----------------------------------------------------------------------------|:-------------------------|
| @classCode                         | 1..1  | SHALL  |           | OBS                                                                         |                          |
| @moodCode                          | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                                    |                          |
| templateId                         | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; item                        | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp;&nbsp; @root                 | 1..1  | SHALL  |           | 2.16.840.1.113883.10.20.28.3.114                                            |                          |
| id                                 | 1..1  | SHALL  |           |                                                                             |                          |
| code                               | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; @code                       | 1..1  | SHALL  |           | ASSERTION                                                                   |                          |
| &nbsp; @codeSystem                 | 0..1  | MAY    |           | 2.16.840.1.113883.5.4 (ActCode)                                             |                          |
| title                              | 1..1  | SHALL  |           |                                                                             |                          |
| statusCode                         | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; @code                       | 1..1  | SHALL  |           | 2.16.840.1.113883.5.14 (ActStatus) = completed                              |                          |
| effectiveTime                      | 0..1  | MAY    | IVL_TS    |                                                                             |                          |
| &nbsp; low                         | 0..1  | MAY    |           |                                                                             | start datetime           |
| &nbsp; high                        | 0..1  | MAY    |           |                                                                             | stop datetime            |
| value                              | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; @code                       | 1..1  | SHALL  |           | 416098002                                                                   |                          |
| &nbsp; @codeSystem                 | 0..1  | MAY    |           | 2.16.840.1.113883.6.96 (SNOMED CT)                                          |                          |
| participation                      | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; @typeCode                   | 1..1  | SHALL  |           | 2.16.840.1.113883.5.90 (HL7ParticipationType) = CSM                         |                          |
| &nbsp; role                        | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp;&nbsp; @classCode            | 1..1  | SHALL  |           | 2.16.840.1.113883.5.110 (RoleClass) = MANU                                  |                          |
| &nbsp;&nbsp; playingEntity         | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp;&nbsp;&nbsp; @classCode      | 1..1  | SHALL  |           | 2.16.840.1.113883.5.41 (EntityClass) = MMAT                                 |                          |
| &nbsp;&nbsp;&nbsp; @determinerCode | 1..1  | SHALL  |           | 2.16.840.1.113883.5.30 (HL7EntityDeterminer) = KIND                         |                          |
| &nbsp;&nbsp;&nbsp; code            | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp;&nbsp;&nbsp;&nbsp; @valueSet | 0..1  | SHOULD |           |                                                                             | {$QDMElementValueSetOID} |
| outboundRelationship               | 0..1  | MAY    |           |                                                                             |                          |
| &nbsp; @typeCode                   | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = MFST                    |                          |
| &nbsp; @inversionInd               | 1..1  | SHALL  |           | true                                                                        |                          |
| &nbsp; observationCriteria         | 1..1  | SHALL  |           | Reaction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.91:2014-11-24) | reaction                 |

Immunization, Allergy Example
-----------------------------

```xml
<observationCriteria classCode="OBS" moodCode="EVN">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.114"/>
    </templateId>
    <id root="DA60953A-89EB-4255-8CCF-058996928FBB"/>
    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
    <title value="Immunization, Allergy"/>
    <value xsi:type="CD" code="416098002" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED-CT">
        <displayName value="Drug Allergy"/>
    </value>
    <participation typeCode="CSM">
        <role classCode="MANU">
            <playingEntity classCode="MMAT" determinerCode="KIND">
                <code valueSet="{$QDMElementValueSetOID}"/>
            </playingEntity>
        </role>
    </participation>
</observationCriteria>
```

Immunization, Intolerance Overview
----------------------------------

`Immunization, Intolerance` will have the following QDM definition (based on the `Medication, Intolerance` definition):

> Data elements that meet criteria using this datatype should document a reaction in specific patients representing a low threshold to the normal pharmacological action of the vaccine indicated by the QDM category and its corresponding value set.

The `Immunization, Intolerance` data type contains the following attributes:

-	`reaction`
-	`start datetime`
-	`stop datetime`

Note that this template is a simple subset of the `Medication, Intolerance` template. There are no distinguishing characteristics of an `Immunization, Intolerance` entry except for the `templateId` and that the `participation/role/playingManufacturedMaterial/code/@valueset` expansion will contain CVX codes.

Immunization, Intolerance Contexts
----------------------------------

| Contained By                     | Contains |
|:---------------------------------|:---------|
| Data Criteria Section (optional) | Reaction |

Immunization, Intolerance Constraints Overview
----------------------------------------------

observationCriteria (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.115)

| XPath                              | Card. | Verb   | Data Type | Value                                                                       | QDM Attribute            |
|:-----------------------------------|:------|:-------|:----------|:----------------------------------------------------------------------------|:-------------------------|
| @classCode                         | 1..1  | SHALL  |           | OBS                                                                         |                          |
| @moodCode                          | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1001 (ActMood) = EVN                                    |                          |
| templateId                         | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; item                        | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp;&nbsp; @root                 | 1..1  | SHALL  |           | 2.16.840.1.113883.10.20.28.3.115                                            |                          |
| id                                 | 1..1  | SHALL  |           |                                                                             |                          |
| code                               | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; @code                       | 1..1  | SHALL  |           | ASSERTION                                                                   |                          |
| &nbsp; @codeSystem                 | 0..1  | MAY    |           | 2.16.840.1.113883.5.4 (ActCode)                                             |                          |
| title                              | 1..1  | SHALL  |           |                                                                             |                          |
| statusCode                         | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; @code                       | 1..1  | SHALL  |           | 2.16.840.1.113883.5.14 (ActStatus) = completed                              |                          |
| effectiveTime                      | 0..1  | MAY    | IVL_TS    |                                                                             |                          |
| &nbsp; low                         | 0..1  | MAY    |           |                                                                             | start datetime           |
| &nbsp; high                        | 0..1  | MAY    |           |                                                                             | stop datetime            |
| value                              | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; @code                       | 1..1  | SHALL  |           | 59037007                                                                    |                          |
| &nbsp; @codeSystem                 | 0..1  | MAY    |           | 2.16.840.1.113883.6.96 (SNOMED CT)                                          |                          |
| participation                      | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp; @typeCode                   | 1..1  | SHALL  |           | 2.16.840.1.113883.5.90 (HL7ParticipationType) = CSM                         |                          |
| &nbsp; role                        | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp;&nbsp; @classCode            | 1..1  | SHALL  |           | 2.16.840.1.113883.5.110 (RoleClass) = MANU                                  |                          |
| &nbsp;&nbsp; playingEntity         | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp;&nbsp;&nbsp; @classCode      | 1..1  | SHALL  |           | 2.16.840.1.113883.5.41 (EntityClass) = MMAT                                 |                          |
| &nbsp;&nbsp;&nbsp; @determinerCode | 1..1  | SHALL  |           | 2.16.840.1.113883.5.30 (HL7EntityDeterminer) = KIND                         |                          |
| &nbsp;&nbsp;&nbsp; code            | 1..1  | SHALL  |           |                                                                             |                          |
| &nbsp;&nbsp;&nbsp;&nbsp; @valueSet | 0..1  | SHOULD |           |                                                                             | {$QDMElementValueSetOID} |
| outboundRelationship               | 0..1  | MAY    |           |                                                                             |                          |
| &nbsp; @typeCode                   | 1..1  | SHALL  |           | 2.16.840.1.113883.5.1002 (HL7ActRelationshipType) = MFST                    |                          |
| &nbsp; @inversionInd               | 1..1  | SHALL  |           | true                                                                        |                          |
| &nbsp; observationCriteria         | 1..1  | SHALL  |           | Reaction (identifier: urn:hl7ii:2.16.840.1.113883.10.20.28.3.91:2014-11-24) | reaction                 |

Immunization, Intolerance Example
---------------------------------

```xml
<observationCriteria classCode="OBS" moodCode="EVN">
    <templateId>
        <item root="2.16.840.1.113883.10.20.28.3.115"/>
    </templateId>
    <id root="D48AB4EA-0589-4E8C-A747-9B7946D5A22E"/>
    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
    <title value="Immunization, Intolerance"/>
    <statusCode code="completed"/>
    <value xsi:type="CD" code="59037007" codeSystem="2.16.840.1.113883.6.96">
        <displayName value="Drug Intolerance"/>
    </value>
    <participation typeCode="CSM">
        <role classCode="MANU">
            <playingMaterial classCode="MMAT" determinerCode="KIND">
                <code valueSet="{$QDMElementValueSetOID}"/>
            </playingMaterial>
        </role>
    </participation>
</observationCriteria>
```
