Patient / Provider Preference ([QDM-108](http://jira.oncprojectracking.org/browse/QDM-108)\)
============================================================================================

The QDM User Group has proposed that the `patient preference` and `provider preference` attributes should be removed from all QDM data types.

General Approach
----------------

The `outboundRelationship` to the `Patient Preference` template and `outboundRelationship` to the `Provider Preference` template should be removed from every template. In addition the `Patient Preference` and `Provider Preference` templates should be removed from the IG.

Details
-------

The `outboundRelationship` to the `Patient Preference` template and `outboundRelationship` to the `Provider Preference` template should be removed from the following templates:

-	Care Goal
-	Communication: From Patient to Provider
-	Communication: From Provider to Patient
-	Communication: From Provider to Provider
-	Device, Adverse Event
-	Device, Allergy
-	Device, Applied
-	Device, Intolerance
-	Device, Order
-	Device, Recommended
-	Diagnosis <sup>\*</sup>
-	Diagnostic Study, Adverse Event
-	Diagnostic Study, Intolerance
-	Diagnostic Study, Order
-	Diagnostic Study, Performed
-	Diagnostic Study, Recommended
-	Encounter, Active
-	Encounter, Order
-	Encounter, Performed
-	Encounter Recommended
-	Functional Status, Order
-	Functional Status, Performed
-	Functional Status, Recommended
-	Imunization, Administered <sup>\*</sup>
-	Imunization, Allergy <sup>\*</sup>
-	Imunization, Intolerance <sup>\*</sup>
-	Imunization, Order <sup>\*</sup>
-	Intervention, Adverse Event
-	Intervention, Intolerance
-	Intervention, Order
-	Intervention, Performed
-	Intervention, Recommended
-	Laboratory Test, Adverse Event
-	Laboratory Test, Intolerance
-	Laboratory Test, Order
-	Laboratory Test, Performed
-	Laboratory Test, Recommended
-	Medication, Active
-	Medication, Adverse Effects
-	Medication, Administered
-	Medication, Allergy
-	Medication, Discharge
-	Medication, Dispensed
-	Medication, Intolerance
-	Medication, Order
-	Patient Care Experience
-	Physical Exam, Order
-	Physical Exam, Performed
-	Physical Exam, Recommended
-	Procedure, Adverse Event
-	Procedure, Intolerance
-	Procedure, Order
-	Procedure, Performed
-	Procedure, Recommended
-	Provider Care Experience
-	Risk Category/Assessment
-	Substance, Administered
-	Substance, Adverse Event
-	Substance, Allergy
-	Substance, Intolerance
-	Substance, Order
-	Substance, Recommended
-	Symptom <sup>\*</sup>
-	Transfer From
-	Transfer To

<sup>\*</sup> *New template definitions already had these elements removed*

For those templates that are affected, the template id's `extension` should be updated to *2015-09-30*.

Deprecated Templates
--------------------

This change deprecates the following templates:

| Template Name       | Template ID                                |
|:--------------------|:-------------------------------------------|
| Patient Preference  | 2.16.840.1.113883.10.20.28.3.86:2014-11-24 |
| Provider Preference | 2.16.840.1.113883.10.20.28.3.87:2014-11-24 |
