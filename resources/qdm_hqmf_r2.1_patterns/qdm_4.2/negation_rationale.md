Negation Rationale ([QDM-109](http://jira.oncprojectracking.org/browse/QDM-109)\)
=================================================================================

The QDM User Group has proposed that the `negation rationale` attribute should only be applied to QDM data types that indicate *action*.

General Approach
----------------

The `negation rationale` attribute represents the assertion that an action did not occur *as well as* the reason why it did not occur. As such, it is represented by the `@actionNegationInd` attribute on the criteria *and* an `outboundRelationship` to the `Reason` template. Any template that should not support `negation rationale`, should remove `@actionNegationInd` from the template. In addition, if `Reason` is not needed by other aspects of the template (such as the QDM `reason` attribute), then it should be removed as well.

Constraint Modifications Per Template
-------------------------------------

The following table identifies the templates that should no longer support `negation rationale`.

Note that `Encounter, Active` should retain the `outboundRelationship` to `Reason` since it is needed for the QDM `reason` attribute.

For those templates that are affected, the template id's `extension` should be updated to *2015-09-30*.

| Template                                | Remove @actionNegationInd | Remove Reason         |
|:----------------------------------------|:--------------------------|:----------------------|
| Care Goal                               | X                         | X                     |
| Device, Adverse Event                   | X                         | X                     |
| Device, Allergy                         | X                         | X                     |
| Device, Intolerance                     | X                         | X                     |
| Diagnosis <sup>\*</sup>                 | X                         | X                     |
| Encounter, Active                       | X                         |                       |
| Immunization, Allergy <sup>\*</sup>     | X                         | X                     |
| Immunization, Intolerance <sup>\*</sup> | X                         | X                     |
| Intervention, Adverse Event             | X                         | X *(already missing)* |
| Intervention, Intolerance               | X                         | X *(already missing)* |
| Laboratory Test, Adverse Event          | X                         | X                     |
| Laboratory Test, Intolerance            | X                         | X                     |
| Medication, Active                      | X                         | X *(already missing)* |
| Medication, Adverse Effects             | X                         | X *(already missing)* |
| Medication, Allergy                     | X                         | X *(already missing)* |
| Medication, Intolerance                 | X                         | X *(already missing)* |
| Patient Care Experience                 | X                         | X                     |
| Procedure, Adverse Event                | X                         | X *(already missing)* |
| Procedure, Intolerance                  | X                         | X *(already missing)* |
| Provider Care Experience                | X                         | X                     |
| Provider Characteristic                 | X                         | X *(already missing)* |
| Substance, Adverse Event                | X                         | X                     |
| Substance, Allergy                      | X                         | X                     |
| Substance, Intolerance                  | X                         | X                     |
| Symptom <sup>\*</sup>                   | X                         | X                     |

<sup>\*</sup> *New template definitions already had these elements removed*
