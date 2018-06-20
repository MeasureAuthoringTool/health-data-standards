<?xml version="1.0" encoding="UTF-8"?>
<!--
HL7 QRDA 1 STU 5 schematron
Version 1.0 

    THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
        THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
        IN NO EVENT SHALL ESAC INC., OR ANY OF THEIR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
        SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
        GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
        THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
        ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 

Tue Feb 27 15:11:18 MST 2018
-->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:voc="http://www.lantanagroup.com/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
  <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
  <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
  <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
  <sch:phase id="errors">
    <sch:active pattern="Admission_Source-pattern-errors" />
    <sch:active pattern="Adverse_Event-pattern-errors" />
    <sch:active pattern="Adverse-Event-Cause-Observation-Assertion-pattern-errors" />
    <sch:active pattern="Age-observation-pattern-errors" />
    <sch:active pattern="Allergy-Intolerance-pattern-errors" />
    <sch:active pattern="Allergy_status_observation-pattern-errors" />
    <sch:active pattern="Assessment_performed-pattern-errors" />
    <sch:active pattern="Assessment_recommended-pattern-errors" />
    <sch:active pattern="Author-pattern-errors" />
    <sch:active pattern="Author-Participation-pattern-errors" />
    <sch:active pattern="Care-Goal-pattern-errors" />
    <sch:active pattern="Communication-From-Patient-To-Provider-pattern-errors" />
    <sch:active pattern="Communication-From-Provider-To-Patient-pattern-errors" />
    <sch:active pattern="Communication-From-Provider-To-Provider-pattern-errors" />
    <sch:active pattern="Component-pattern-errors" />
    <sch:active pattern="Deceased-Observation-pattern-errors" />
    <sch:active pattern="Device-Applied-pattern-errors" />
    <sch:active pattern="Device-Order-Act-pattern-errors" />
    <sch:active pattern="Device-Order-pattern-errors" />
    <sch:active pattern="Device-Recommended-Act-pattern-errors" />
    <sch:active pattern="Device-Recommended-pattern-errors" />
    <sch:active pattern="Diagnosis_concern_act-pattern-errors" />
    <sch:active pattern="Diagnosis-pattern-errors" />
    <sch:active pattern="Diagnostic-Study-Order-pattern-errors" />
    <sch:active pattern="Diagnostic-Study-Performed-pattern-errors" />
    <sch:active pattern="Diagnostic-Study-Recommended-pattern-errors" />
    <sch:active pattern="Discharge-Medication-pattern-errors" />
    <sch:active pattern="Drug-Monitoring-Act-pattern-errors" />
    <sch:active pattern="Drug-Vehicle-pattern-errors" />
    <sch:active pattern="eMeasure-Reference-QDM-pattern-errors" />
    <sch:active pattern="Encounter-Activity-pattern-errors" />
    <sch:active pattern="Encounter-Diagnosis-pattern-errors" />
    <sch:active pattern="Encounter-Order-Act-pattern-errors" />
    <sch:active pattern="Encounter-Order-pattern-errors" />
    <sch:active pattern="Encounter-Performed-Act-pattern-errors" />
    <sch:active pattern="Encounter-Performed-pattern-errors" />
    <sch:active pattern="Encounter-Recommended-Act-pattern-errors" />
    <sch:active pattern="Encounter-Recommended-pattern-errors" />
    <sch:active pattern="Entry-Reference-pattern-errors" />
    <sch:active pattern="External-Document-Reference-pattern-errors" />
    <sch:active pattern="Facility-Location-pattern-errors" />
    <sch:active pattern="Family_History_Death_Observation-pattern-errors" />
    <sch:active pattern="Family_History_Observation_QDM-pattern-errors" />
    <sch:active pattern="Family_History_Observation_V3-pattern-errors" />
    <sch:active pattern="Family_History_Organizer_QDM-pattern-errors" />
    <sch:active pattern="Family_History_Organizer_V3-pattern-errors" />
    <sch:active pattern="Goal_Observation-pattern-errors" />
    <sch:active pattern="Immunization_activity-pattern-errors" />
    <sch:active pattern="Immunization_administered-pattern-errors" />
    <sch:active pattern="Immunization_medication_information-pattern-errors" />
    <sch:active pattern="Immunization_order-pattern-errors" />
    <sch:active pattern="Immunization_refusal_reason-pattern-errors" />
    <sch:active pattern="Incision_datetime-pattern-errors" />
    <sch:active pattern="Indication-pattern-errors" />
    <sch:active pattern="Instruction-pattern-errors" />
    <sch:active pattern="Intervention_Order-pattern-errors" />
    <sch:active pattern="Intervention_Performed-pattern-errors" />
    <sch:active pattern="Intervention_Recommended-pattern-errors" />
    <sch:active pattern="Laboratory_Test_Order-pattern-errors" />
    <sch:active pattern="Laboratory_Test_Performed-pattern-errors" />
    <sch:active pattern="Laboratory_Test_Recommended-pattern-errors" />
    <sch:active pattern="Measure_Reference-pattern-errors" />
    <sch:active pattern="Measure-section-pattern-errors" />
    <sch:active pattern="Measure-section-qdm-pattern-errors" />
    <sch:active pattern="Medication_Active-pattern-errors" />
    <sch:active pattern="Medication_Activity-pattern-errors" />
    <sch:active pattern="Medication_Administered-pattern-errors" />
    <sch:active pattern="Medication_Dispense_V2-pattern-errors" />
    <sch:active pattern="Medication_Dispensed_Act-pattern-errors" />
    <sch:active pattern="Medication_Dispensed-pattern-errors" />
    <sch:active pattern="Medication_Free_Text_Sig-pattern-errors" />
    <sch:active pattern="Medication_Information-pattern-errors" />
    <sch:active pattern="Medication_Order-pattern-errors" />
    <sch:active pattern="Medication_Supply_Order-pattern-errors" />
    <sch:active pattern="Medication_Supply_Request-pattern-errors" />
    <sch:active pattern="Patient_care_experience-pattern-errors" />
    <sch:active pattern="Patient_Characteristic_Clinical_Trial_Participant-pattern-errors" />
    <sch:active pattern="Patient_Characteristic_Expired-pattern-errors" />
    <sch:active pattern="Patient_Characteristic_Observation_Assertion-pattern-errors" />
    <sch:active pattern="Patient_Characteristic_Payer-pattern-errors" />
    <sch:active pattern="Patient-data-section-pattern-errors" />
    <sch:active pattern="Patient_data_section_QDM-pattern-errors" />
    <sch:active pattern="Physical_Exam_Order-pattern-errors" />
    <sch:active pattern="Physical_Exam_Performed-pattern-errors" />
    <sch:active pattern="Physical_Exam_Recommended-pattern-errors" />
    <sch:active pattern="Planned_Act-pattern-errors" />
    <sch:active pattern="Planned_Coverage-pattern-errors" />
    <sch:active pattern="Planned_Encounter-pattern-errors" />
    <sch:active pattern="Planned_Immunization_Activity-pattern-errors" />
    <sch:active pattern="Planned-Medication-Activity-pattern-errors" />
    <sch:active pattern="Planned-Observation-pattern-errors" />
    <sch:active pattern="Planned-Procedure-pattern-errors" />
    <sch:active pattern="Planned-Supply-pattern-errors" />
    <sch:active pattern="Precondition-For-Substance-Administration-pattern-errors" />
    <sch:active pattern="Principal-Diagnosis-pattern-errors" />
    <sch:active pattern="Priority-Preference-pattern-errors" />
    <sch:active pattern="Problem-Concern-Act-pattern-errors" />
    <sch:active pattern="Problem-Observation-pattern-errors" />
    <sch:active pattern="Problem-Status-pattern-errors" />
    <sch:active pattern="Procedure-Activity-Act-pattern-errors" />
    <sch:active pattern="Procedure-Activity-Observation-pattern-errors" />
    <sch:active pattern="Procedure-Activity-Procedure-pattern-errors" />
    <sch:active pattern="Procedure-Order-pattern-errors" />
    <sch:active pattern="Procedure-Performed-pattern-errors" />
    <sch:active pattern="Procedure-Recommended-pattern-errors" />
    <sch:active pattern="Product-Instance-pattern-errors" />
    <sch:active pattern="Prognosis-Observation-pattern-errors" />
    <sch:active pattern="Program_Participation-pattern-errors" />
    <sch:active pattern="Provider-Care-Experience-pattern-errors" />
    <sch:active pattern="Provider-Characteristic-Observation-Assertion-pattern-errors" />
    <sch:active pattern="QDM_based_QRDA_V5-pattern-errors" />
    <sch:active pattern="QRDA_Category_I-pattern-errors" />
    <sch:active pattern="Reaction-Observation-pattern-errors" />
    <sch:active pattern="Reason-pattern-errors" />
    <sch:active pattern="Related-To-pattern-errors" />
    <sch:active pattern="Reporting-Parameters-Act-pattern-errors" />
    <sch:active pattern="Reporting-parameters-section-pattern-errors" />
    <sch:active pattern="Result-Observation-pattern-errors" />
    <sch:active pattern="Service-Delivery-Location-pattern-errors" />
    <sch:active pattern="Severity-Observation-pattern-errors" />
    <sch:active pattern="Status-pattern-errors" />
    <sch:active pattern="Substance-Administered-Act-pattern-errors" />
    <sch:active pattern="Substance-Device-Allergy-Intolerance-Observation-pattern-errors" />
    <sch:active pattern="Substance-Recommended-pattern-errors" />
    <sch:active pattern="Symptom-Concern-Act-pattern-errors" />
    <sch:active pattern="Symptom-pattern-errors" />
    <sch:active pattern="Target-Outcome-pattern-errors" />
    <sch:active pattern="US-Realm-Address-pattern-errors" />
    <sch:active pattern="US-Realm-Date-and-Time-pattern-errors" />
    <sch:active pattern="US_Realm-pattern-errors" />
    <sch:active pattern="US-Realm-Patient-Name-pattern-errors" />
    <sch:active pattern="US-Realm-Person-Name-pattern-errors" />
  </sch:phase>
  <sch:phase id="warnings">
    <sch:active pattern="Admission_Source-pattern-warnings" />
    <sch:active pattern="Adverse_Event-pattern-warnings" />
    <sch:active pattern="Author-Participation-pattern-warnings" />
    <sch:active pattern="Deceased-Observation-pattern-warnings" />
    <sch:active pattern="Device-Applied-pattern-warnings" />
    <sch:active pattern="eMeasure-Reference-QDM-pattern-warnings" />
    <sch:active pattern="Encounter-Activity-pattern-warnings" />
    <sch:active pattern="External-Document-Reference-pattern-warnings" />
    <sch:active pattern="Facility-Location-pattern-warnings" />
    <sch:active pattern="Family_History_Observation_V3-pattern-warnings" />
    <sch:active pattern="Family_History_Organizer_V3-pattern-warnings" />
    <sch:active pattern="Goal_Observation-pattern-warnings" />
    <sch:active pattern="Immunization_activity-pattern-warnings" />
    <sch:active pattern="Immunization_medication_information-pattern-warnings" />
    <sch:active pattern="Indication-pattern-warnings" />
    <sch:active pattern="Measure_Reference-pattern-warnings" />
    <sch:active pattern="Medication_Activity-pattern-warnings" />
    <sch:active pattern="Medication_Dispense_V2-pattern-warnings" />
    <sch:active pattern="Medication_Free_Text_Sig-pattern-warnings" />
    <sch:active pattern="Medication_Supply_Order-pattern-warnings" />
    <sch:active pattern="Patient_Characteristic_Payer-pattern-warnings" />
    <sch:active pattern="Planned_Act-pattern-warnings" />
    <sch:active pattern="Planned_Encounter-pattern-warnings" />
    <sch:active pattern="Planned_Immunization_Activity-pattern-warnings" />
    <sch:active pattern="Planned-Medication-Activity-pattern-warnings" />
    <sch:active pattern="Planned-Observation-pattern-warnings" />
    <sch:active pattern="Planned-Procedure-pattern-warnings" />
    <sch:active pattern="Planned-Supply-pattern-warnings" />
    <sch:active pattern="Priority-Preference-pattern-warnings" />
    <sch:active pattern="Problem-Concern-Act-pattern-warnings" />
    <sch:active pattern="Problem-Observation-pattern-warnings" />
    <sch:active pattern="Procedure-Activity-Act-pattern-warnings" />
    <sch:active pattern="Procedure-Activity-Observation-pattern-warnings" />
    <sch:active pattern="Procedure-Activity-Procedure-pattern-warnings" />
    <sch:active pattern="Procedure-Performed-pattern-warnings" />
    <sch:active pattern="Product-Instance-pattern-warnings" />
    <sch:active pattern="Provider-Characteristic-Observation-Assertion-pattern-warnings" />
    <sch:active pattern="QDM_based_QRDA_V5-pattern-warnings" />
    <sch:active pattern="Reaction-Observation-pattern-warnings" />
    <sch:active pattern="Result-Observation-pattern-warnings" />
    <sch:active pattern="Service-Delivery-Location-pattern-warnings" />
    <sch:active pattern="Substance-Device-Allergy-Intolerance-Observation-pattern-warnings" />
    <sch:active pattern="US-Realm-Address-pattern-warnings" />
    <sch:active pattern="US-Realm-Date-and-Time-pattern-warnings" />
    <sch:active pattern="US_Realm-pattern-warnings" />
  </sch:phase>
  <!--
      ERROR Patterns and Assertions
  -->
  <sch:pattern id="Substance-Recommended-pattern-errors">
    <sch:rule id="Substance-Recommended-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27495-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27495).</sch:assert>
      <sch:assert id="a-3343-13784-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13784).</sch:assert>
      <sch:assert id="a-3343-13785-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-13785) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.75" (CONF:3343-13786).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27152).</sch:assert>
      <sch:assert id="a-3343-27988-error" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:3343-27988).</sch:assert>
      <sch:assert id="a-3343-27720-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27720).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Recommended-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2017-08-01']]/cda:consumable">
      <sch:assert id="a-3343-27989-error" test="count(cda:manufacturedProduct)=1">This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:3343-27989).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Recommended-consumable-manufacturedProduct-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2017-08-01']]/cda:consumable/cda:manufacturedProduct">
      <sch:assert id="a-3343-27990-error" test="count(cda:manufacturedMaterial)=1">This manufacturedProduct SHALL contain exactly one [1..1] manufacturedMaterial (CONF:3343-27990).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Recommended-consumable-manufacturedProduct-manufacturedMaterial-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2017-08-01']]/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">
      <sch:assert id="a-3343-27991-error" test="count(cda:code)=1">This manufacturedMaterial SHALL contain exactly one [1..1] code (CONF:3343-27991).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Recommended-author-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29034-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29034).</sch:assert>
      <sch:assert id="a-3343-29035-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29035).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Recommended-author-assignedAuthor-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.75'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29036-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29036).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Author-Participation-pattern-errors">
    <sch:rule id="Author-Participation-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]">
      <sch:assert id="a-1098-32017-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-32017) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.119" (CONF:1098-32018).</sch:assert>
      <sch:assert id="a-1098-31471-error" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:1098-31471).</sch:assert>
      <sch:assert id="a-1098-31472-error" test="count(cda:assignedAuthor)=1">SHOULD contain zero or one [0..1] state (ValueSet: StateValueSet urn:oid:2.16.840.1.113883.3.88.12.80.1 DYNAMIC) (CONF:81-7293).</sch:assert>
    </sch:rule>
    <sch:rule id="Author-Participation-assignedAuthor-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]/cda:assignedAuthor">
      <sch:assert id="a-1098-31473-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:1098-31473).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting-Parameters-Act-pattern-errors">
    <sch:rule id="Reporting-Parameters-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
      <sch:assert id="a-23-3269-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:23-3269).</sch:assert>
      <sch:assert id="a-23-3270-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:23-3270).</sch:assert>
      <sch:assert id="a-23-18098-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:23-18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:23-18099).</sch:assert>
      <sch:assert id="a-23-26549-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:23-26549).</sch:assert>
      <sch:assert id="a-23-3272-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:23-3272).</sch:assert>
      <sch:assert id="a-23-3273-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:23-3273).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]/cda:code">
      <sch:assert id="a-23-26550-error" test="@code='252116004'">This code SHALL contain exactly one [1..1] @code="252116004" Observation Parameters (CONF:23-26550).</sch:assert>
      <sch:assert id="a-23-26551-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:23-26551).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-Parameters-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]/cda:effectiveTime">
      <sch:assert id="a-23-3274-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:23-3274).</sch:assert>
      <sch:assert id="a-23-3275-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:23-3275).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned-Procedure-pattern-errors">
    <sch:rule id="Planned-Procedure-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8568-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8568).</sch:assert>
      <sch:assert id="a-1098-8569-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8569).</sch:assert>
      <sch:assert id="a-1098-30444-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30444) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.41" (CONF:1098-30445). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32554).</sch:assert>
      <sch:assert id="a-1098-8571-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8571).</sch:assert>
      <sch:assert id="a-1098-30446-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30446).</sch:assert>
      <sch:assert id="a-1098-31976-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31976).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Procedure-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-31978-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31978).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Order-pattern-errors">
    <sch:rule id="Procedure-Order-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27323-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27323).</sch:assert>
      <sch:assert id="a-3343-11097-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11097).</sch:assert>
      <sch:assert id="a-3343-11098-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.63" (CONF:3343-11099). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27083).</sch:assert>
      <sch:assert id="a-3343-27324-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27324).</sch:assert>
      <sch:assert id="a-3343-27346-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27346).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Order-author-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29056-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29056).</sch:assert>
      <sch:assert id="a-3343-29055-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29055)</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Order-author-assignedAuthor-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.63'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29057-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29057).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Diagnosis-pattern-errors">
    <sch:rule id="Diagnosis-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28510-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28510).</sch:assert>
      <sch:assert id="a-3343-28511-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28511).</sch:assert>
      <sch:assert id="a-3343-28512-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28512).</sch:assert>
      <sch:assert id="a-3343-28498-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28498) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.135" (CONF:3343-28503). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28887).</sch:assert>
      <sch:assert id="a-3343-28499-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28499).</sch:assert>
      <sch:assert id="a-3343-28885-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2017-08-01'])=1">This template SHALL be contained by a Diagnosis Concern Act (V3) (CONF:3343-28885).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnosis-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28505-error" test="@code='29308-4'">This code SHALL contain exactly one [1..1] @code="29308-4" diagnosis (CONF:3343-28505).</sch:assert>
      <sch:assert id="a-3343-28506-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-28506).</sch:assert>
      <sch:assert id="a-3343-28886-error" test="count(cda:translation)=1">This code SHALL contain exactly one [1..1] translation (CONF:3343-28886).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnosis-code-translation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135'][@extension='2017-08-01']]/cda:code/cda:translation">
      <sch:assert id="a-3343-28888-error" test="@code='282291009'">This translation SHALL contain exactly one [1..1] @code="282291009" 2.16.840.1.113883.6.96 (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-28888).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Physical_Exam_Order-pattern-errors">
    <sch:rule id="Physical_Exam_Order-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27550-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27550).</sch:assert>
      <sch:assert id="a-3343-12685-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12685).</sch:assert>
      <sch:assert id="a-3343-12686-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12686) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.58" (CONF:3343-12687). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27078).</sch:assert>
      <sch:assert id="a-3343-12689-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-12689).</sch:assert>
      <sch:assert id="a-3343-13254-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-13254).</sch:assert>
      <sch:assert id="a-3343-27345-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27345) such that it SHALL contain exactly one [1..1] time (CONF:3343-29050). SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29049).</sch:assert>
    </sch:rule>
    <sch:rule id="Physical_Exam_Order-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-13242-error" test="@code='29545-1'">This code SHALL contain exactly one [1..1] @code="29545-1" physical examination (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-13242).</sch:assert>
    </sch:rule>
    <sch:rule id="Physical_Exam_Order-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.58'][@extension='2017-08-01']]/cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]/cda:assignedAuthor">
      <sch:assert id="a-3343-29051-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29051).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Device-Recommended-Act-pattern-errors">
    <sch:rule id="Device-Recommended-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28454-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28454).</sch:assert>
      <sch:assert id="a-3343-28455-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28455).</sch:assert>
      <sch:assert id="a-3343-28452-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28452) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.131" (CONF:3343-28456). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28922).</sch:assert>
      <sch:assert id="a-3343-28453-error" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension = '2017-08-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28453) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28458). SHALL contain exactly one [1..1] Device Recommended (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.10:2017-08-01) (CONF:3343-28459).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Immunization_medication_information-pattern-errors">
    <sch:rule id="Immunization_medication_information-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-9002-error" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-9002).</sch:assert>
      <sch:assert id="a-1098-9004-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-9004) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.54" (CONF:1098-10499). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32602).</sch:assert>
      <sch:assert id="a-1098-9006-error" test="count(cda:manufacturedMaterial)=1">SHALL contain exactly one [1..1] manufacturedMaterial (CONF:1098-9006).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_medication_information-manufacturedMaterial-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']]/cda:manufacturedMaterial">
      <sch:assert id="a-1098-9007-error" test="count(cda:code)=1">This manufacturedMaterial SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet CVX Vaccines Administered - Vaccine Set urn:oid:2.16.840.1.113762.1.4.1010.6 DYNAMIC (CONF:1098-9007).</sch:assert>
      <sch:assert id="a-1098-9014-error" test="count(cda:lotNumberText)=1">This manufacturedMaterial SHALL contain exactly one [1..1] lotNumberText (CONF:1098-9014).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient-data-section-pattern-errors">
    <sch:rule id="Patient-data-section-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]">
      <sch:assert id="a-67-12794-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12794) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.4" (CONF:67-12795).</sch:assert>
      <sch:assert id="a-67-3865-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-3865).</sch:assert>
      <sch:assert id="a-67-3866-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='patient data'])=1">SHALL contain exactly one [1..1] title="Patient Data" (CONF:67-3866).</sch:assert>
      <sch:assert id="a-67-3867-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:67-3867).</sch:assert>
      <sch:assert id="a-67-14567-error" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-14567).</sch:assert>
    </sch:rule>
    <sch:rule id="Patient-data-section-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']]/cda:code">
      <sch:assert id="a-67-26548-error" test="@code='55188-7'">This code SHALL contain exactly one [1..1] @code="55188-7" (CONF:67-26548).</sch:assert>
      <sch:assert id="a-67-27013-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27013).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Administered-pattern-errors">
    <sch:rule id="Medication_Administered-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-12444-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" Substance Administration (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-12444).</sch:assert>
      <sch:assert id="a-3343-12445-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12445).</sch:assert>
      <sch:assert id="a-3343-12446-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12446) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.42" (CONF:3343-12447). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27023).</sch:assert>
      <sch:assert id="a-3343-12452-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:3343-12452).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Administered-statuscode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.42'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-13241-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-13241).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Communication-From-Provider-To-Provider-pattern-errors">
    <sch:rule id="Communication-From-Provider-To-Provider-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-11816-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11816).</sch:assert>
      <sch:assert id="a-3343-11817-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11817).</sch:assert>
      <sch:assert id="a-3343-11818-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11818) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.4" (CONF:3343-11819). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27285).</sch:assert>
      <sch:assert id="a-3343-11821-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:3343-11821).</sch:assert>
      <sch:assert id="a-3343-26950-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-26950).</sch:assert>
      <sch:assert id="a-3343-11822-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11822).</sch:assert>
      <sch:assert id="a-3343-28921-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:3343-28921).</sch:assert>
      <sch:assert id="a-3343-11827-error" test="count(cda:participant[@typeCode='IRCP'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11827) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11828) SHALL contain exactly one [1..1] participantRole (CONF:3343-11829).</sch:assert>
      <sch:assert id="a-3343-11837-error" test="count(cda:participant[@typeCode='AUT'] [count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11837) such that it SHALL contain exactly one [1..1] @typeCode="AUT" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11838) SHALL contain exactly one [1..1] participantRole (CONF:3343-11839).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Provider-To-Provider-participant-participantRole-recipient-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole">
      <sch:assert id="a-3343-12096-error" test="@classCode='ASSIGNED'">This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12096).</sch:assert>
      <sch:assert id="a-3343-11830-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-11830).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Provider-To-Provider-participant-participantRole-recipient-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole/cda:code">
      <sch:assert id="a-3343-26951-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:3343-26951).</sch:assert>
      <sch:assert id="a-3343-26952-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-26952).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Provider-To-Provider-participant-participantRole-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole">
      <sch:assert id="a-3343-12097-error" test="@classCode='ASSIGNED'">This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12097).</sch:assert>
      <sch:assert id="a-3343-12103-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-12103).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Provider-To-Provider-participant-participantRole-author-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.4'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole/cda:code">
      <sch:assert id="a-3343-26953-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:3343-26953).</sch:assert>
      <sch:assert id="a-3343-26954-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-26954).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Family_History_Death_Observation-pattern-errors">
    <sch:rule id="Family_History_Death_Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]">
      <sch:assert id="a-81-8621-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8621).</sch:assert>
      <sch:assert id="a-81-8622-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-8622).</sch:assert>
      <sch:assert id="a-81-8623-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:81-8623) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.47" (CONF:81-10495).</sch:assert>
      <sch:assert id="a-81-19141-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-19141).</sch:assert>
      <sch:assert id="a-81-8625-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-8625).</sch:assert>
      <sch:assert id="a-81-8626-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:81-8626).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Death_Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]/cda:code">
      <sch:assert id="a-81-19142-error" test="@code ='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:81-19142).</sch:assert>
      <sch:assert id="a-81-26504-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:81-26504).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Death_Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]/cda:statusCode">
      <sch:assert id="a-81-19097-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19097).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Death_Observation-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.47']]/cda:value">
      <sch:assert id="a-81-26470-error" test="@code='419099009'">This value SHALL contain exactly one [1..1] @code="419099009" Dead (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:81-26470).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Supply_Order-pattern-errors">
    <sch:rule id="Medication_Supply_Order-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7427-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7427).</sch:assert>
      <sch:assert id="a-1098-7428-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7428).</sch:assert>
      <sch:assert id="a-1098-7429-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-7429) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.17" (CONF:1098-10507). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32578).</sch:assert>
      <sch:assert id="a-1098-7430-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7430).</sch:assert>
      <sch:assert id="a-1098-7432-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7432).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Supply_Order-statusCode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32362-error" test="count(@code)=1">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32362).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Supply_Order-may-entryRelationship-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']]/cda:entryRelationship">
      <sch:assert id="a-1098-7444-error" test="@typeCode='SUBJ'">The entryRelationship, if present, SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1098-7444).</sch:assert>
      <sch:assert id="a-1098-7445-error" test="@inversionInd='true'">The entryRelationship, if present, SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1098-7445).</sch:assert>
      <sch:assert id="a-1098-31391-error" test="count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20'][@extension='2014-06-09']])=1">The entryRelationship, if present, SHALL contain exactly one [1..1] Instruction (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.20:2014-06-09) (CONF:1098-31391).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Provider-Characteristic-Observation-Assertion-pattern-errors">
    <sch:rule id="Provider-Characteristic-Observation-Assertion-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27773-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-27773).</sch:assert>
      <sch:assert id="a-3343-27774-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27774).</sch:assert>
      <sch:assert id="a-3343-28101-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28101).</sch:assert>
      <sch:assert id="a-3343-27768-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-27768) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.114" (CONF:3343-27772). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27780).</sch:assert>
      <sch:assert id="a-3343-27775-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:3343-27775).</sch:assert>
      <sch:assert id="a-3343-27767-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27767).</sch:assert>
      <sch:assert id="a-3343-27776-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CONF:3343-27776).</sch:assert>
      <sch:assert id="a-3343-27770-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-27770).</sch:assert>
    </sch:rule>
    <sch:rule id="Provider-Characteristic-Observation-Assertion-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-27771-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-27771).</sch:assert>
      <sch:assert id="a-3343-28136-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28136).</sch:assert>
    </sch:rule>
    <sch:rule id="Provider-Characteristic-Observation-Assertion-participant-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114'][@extension='2017-08-01']]/cda:participant">
      <sch:assert id="a-3343-28219-error" test="@typeCode='IND'">The participant, if present, SHALL contain exactly one [1..1] @typeCode="IND" individual (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-28219).</sch:assert>
      <sch:assert id="a-3343-28218-error" test="count(cda:participantRole)=1">The participant, if present, SHALL contain exactly one [1..1] participantRole (CONF:3343-28218).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned-Supply-pattern-errors">
    <sch:rule id="Planned-Supply-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8577-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8577).</sch:assert>
      <sch:assert id="a-1098-8578-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2011-09-30 (CONF:1098-8578).</sch:assert>
      <sch:assert id="a-1098-30463-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30463) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.43" (CONF:1098-30464). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32556).</sch:assert>
      <sch:assert id="a-1098-8580-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8580).</sch:assert>
      <sch:assert id="a-1098-30458-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30458).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Supply-statusCode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32047-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32047).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Severity-Observation-pattern-errors">
    <sch:rule id="Severity-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7345-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7345).</sch:assert>
      <sch:assert id="a-1098-7346-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7346).</sch:assert>
      <sch:assert id="a-1098-7347-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7347) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.8" (CONF:1098-10525). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32577).</sch:assert>
      <sch:assert id="a-1098-19168-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19168).</sch:assert>
      <sch:assert id="a-1098-7352-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7352).</sch:assert>
      <sch:assert id="a-1098-7356-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem Severity urn:oid:2.16.840.1.113883.3.88.12.3221.6.8 DYNAMIC (CONF:1098-7356).</sch:assert>
    </sch:rule>
    <sch:rule id="Severity-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-19169-error" test="@code='SEV'">This code SHALL contain exactly one [1..1] @code="SEV" Severity (CONF:1098-19169).</sch:assert>
      <sch:assert id="a-1098-32170-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32170).</sch:assert>
    </sch:rule>
    <sch:rule id="Severity-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.8'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-19115-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19115).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient_Characteristic_Payer-pattern-errors">
    <sch:rule id="Patient_Characteristic_Payer-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]">
      <sch:assert id="a-67-14213-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-14213).</sch:assert>
      <sch:assert id="a-67-14214-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-14214).</sch:assert>
      <sch:assert id="a-67-12561-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55'][not(@extension)]) = 1">SHALL contain exactly one [1..1] templateId (CONF:67-12561) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.55" (CONF:67-12562).</sch:assert>
      <sch:assert id="a-67-12564-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:67-12564).</sch:assert>
      <sch:assert id="a-67-12565-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:67-12565).</sch:assert>
      <sch:assert id="a-67-26933-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:67-26933).</sch:assert>
      <sch:assert id="a-67-16710-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:67-16710).</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_Characteristic_Payer-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]/cda:code">
      <sch:assert id="a-67-14029-error" test="@code='48768-6'">This code SHALL contain exactly one [1..1] @code="48768-6" Payment source (CONF:67-14029).</sch:assert>
      <sch:assert id="a-67-27009-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27009).</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_Characteristic_Payer-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]/cda:effectiveTime">
      <sch:assert id="a-67-26934-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:67-26934).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Communication-From-Provider-To-Patient-pattern-errors">
    <sch:rule id="Communication-From-Provider-To-Patient-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-11840-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11840).</sch:assert>
      <sch:assert id="a-3343-11841-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11841).</sch:assert>
      <sch:assert id="a-3343-11842-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11842) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.3" (CONF:3343-11843). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27280).</sch:assert>
      <sch:assert id="a-3343-11845-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:3343-11845).</sch:assert>
      <sch:assert id="a-3343-11846-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11846).</sch:assert>
      <sch:assert id="a-3343-26947-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-26947).</sch:assert>
      <sch:assert id="a-3343-28920-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:3343-28920).</sch:assert>
      <sch:assert id="a-3343-11850-error" test="count(cda:participant[@typeCode='AUT'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11850) such that it SHALL contain exactly one [1..1] @typeCode="AUT" author (originator) (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11851). SHALL contain exactly one [1..1] participantRole (CONF:3343-11852).</sch:assert>
      <sch:assert id="a-3343-11856-error" test="count(cda:participant[@typeCode='IRCP'] [count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11856) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11857). SHALL contain exactly one [1..1] participantRole (CONF:3343-11858).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Provider-To-Patient-participant-participantRole-recipient-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole">
      <sch:assert id="a-3343-12102-error" test="@classCode='PAT'">This participantRole SHALL contain exactly one [1..1] @classCode="PAT" patient (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12102).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Provider-To-Patient-participant-participantRole-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole">
      <sch:assert id="a-3343-12101-error" test="@classCode='ASSIGNED'">This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12101).</sch:assert>
      <sch:assert id="a-3343-11853-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-11853).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Provider-To-Patient-participant-participantRole-author-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.3'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole/cda:code">
      <sch:assert id="a-3343-26948-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:3343-26948).</sch:assert>
      <sch:assert id="a-3343-26949-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CONF:3343-26949).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Provider-Care-Experience-pattern-errors">
    <sch:rule id="Provider-Care-Experience-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-12479-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" observation, which SHALL be selected from CodeSystem HL7ActClass (urn:oid:2.16.840.1.113883.5.6) (CONF:3343-12479).</sch:assert>
      <sch:assert id="a-3343-12480-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12480).</sch:assert>
      <sch:assert id="a-3343-28100-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28100).</sch:assert>
      <sch:assert id="a-3343-12481-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12481) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.67" (CONF:3343-12482). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27293).</sch:assert>
      <sch:assert id="a-3343-12484-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:3343-12484).</sch:assert>
      <sch:assert id="a-3343-12485-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-12485).</sch:assert>
      <sch:assert id="a-3343-12486-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:3343-12486).</sch:assert>
      <sch:assert id="a-3343-12572-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-12572).</sch:assert>
      <sch:assert id="a-3343-28941-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:3343-28941).</sch:assert>
    </sch:rule>
    <sch:rule id="Provider-Care-Experience-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.67'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-27562-error" test="@code='77219-4'">This code SHALL contain exactly one [1..1] @code="77219-4" Provider satisfaction with healthcare delivery (CONF:3343-27562).</sch:assert>
      <sch:assert id="a-3343-27563-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-27563).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Device-Applied-pattern-errors">
    <sch:rule id="Device-Applied-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28050-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28050).</sch:assert>
      <sch:assert id="a-3343-28051-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28051).</sch:assert>
      <sch:assert id="a-3343-12391-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12391) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.7" (CONF:3343-12392).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27132).</sch:assert>
      <sch:assert id="a-3343-12414-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-12414).</sch:assert>
      <sch:assert id="a-3343-12394-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-12394).</sch:assert>
      <sch:assert id="a-3343-12395-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-12395).</sch:assert>
      <sch:assert id="a-3343-12396-error" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-12396) such that it SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12397).  SHALL contain exactly one [1..1] participantRole (CONF:3343-12398).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Applied-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-12415-error" test="@code='360030002'">This code SHALL contain exactly one [1..1] @code="360030002" application of device (CONF:3343-12415).</sch:assert>
      <sch:assert id="a-3343-27356-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-27536).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Applied-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-29140-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-29140).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Applied-effectiveTime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-27537-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-27537).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Applied-participant-participantRole-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole">
      <sch:assert id="a-3343-12399-error" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem HL7RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12399).</sch:assert>
      <sch:assert id="a-3343-12400-error" test="count(cda:playingDevice)=1">This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:3343-12400).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Applied-participant-participantRole-playingDevice-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole[@classCode='MANU']/cda:playingDevice">
      <sch:assert id="a-3343-12401-error" test="@classCode='DEV'">This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12401).</sch:assert>
      <sch:assert id="a-3343-12402-error" test="count(cda:code)=1">This playingDevice SHALL contain exactly one [1..1] code (CONF:3343-12402).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Service-Delivery-Location-pattern-errors">
    <sch:rule id="Service-Delivery-Location-errors" context="cda:participationRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]">
      <sch:assert id="a-81-28426-error" test="@classCode='SDLOC'">SHALL contain exactly one [1..1] @classCode="SDLOC" (CodeSystem: RoleCode urn:oid:2.16.840.1.113883.5.111 STATIC) (CONF:81-7758).</sch:assert>
      <sch:assert id="a-81-10524-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7635) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.32" (CONF:81-10524).</sch:assert>
      <sch:assert id="a-81-16850-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet HealthcareServiceLocation urn:oid:2.16.840.1.113883.1.11.20275 STATIC (CONF:81-16850).</sch:assert>
    </sch:rule>
    <sch:rule id="Service-Delivery-Location-playingEntity-errors" context="cda:participationRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]/cda:playingEntity">
      <sch:assert id="a-81-7763-error" test="@classCode='PLC'">The playingEntity, if present, SHALL contain exactly one [1..1] @classCode="PLC" (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:81-7763).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Recommended-Act-pattern-errors">
    <sch:rule id="Encounter-Recommended-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28487-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28487).</sch:assert>
      <sch:assert id="a-3343-28488-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28488</sch:assert>
      <sch:assert id="a-3343-28485-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28485) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.134" (CONF:3343-28490). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28815).</sch:assert>
      <sch:assert id="a-3343-28677-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28677).</sch:assert>
      <sch:assert id="a-3343-28486-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28486) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28492).  SHALL contain exactly one [1..1] Encounter Recommended (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.24:2017-08-01) (CONF:3343-28493).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Recommended-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28814-error" test="@code='ENC'">This code SHALL contain exactly one [1..1] @code="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28814).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Device-Order-pattern-errors">
    <sch:rule id="Device-Order-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27723-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27723).</sch:assert>
      <sch:assert id="a-3343-12343-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12343).</sch:assert>
      <sch:assert id="a-3343-12344-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12344) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.9" (CONF:3343-12345). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27091).</sch:assert>
      <sch:assert id="a-3343-27721-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27721).</sch:assert>
      <sch:assert id="a-3343-12349-error" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-12349) such that it  SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12350). SHALL contain exactly one [1..1] participantRole (CONF:3343-12351).</sch:assert>
      <sch:assert id="a-3343-28665-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130'][@extension='2017-08-01'])=1">This template SHALL be contained by a Device Order Act (V2) (CONF:3343-28665).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Order-author-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29086-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29086).</sch:assert>
      <sch:assert id="a-3343-29085-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29085).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Order-author-assignedAuthor-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29087-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29087).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Order-participant-participantRole-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole">
      <sch:assert id="a-3343-12353-error" test="count(cda:playingDevice)=1">This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:3343-12353).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Order-participant-participantRole-playingDevice-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole/cda:playingDevice">
      <sch:assert id="a-3343-12354-error" test="@classCode='DEV'">This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12354).</sch:assert>
      <sch:assert id="a-3343-12355-error" test="count(cda:code)=1">his playingDevice SHALL contain exactly one [1..1] code (CONF:3343-12355).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure-section-qdm-pattern-errors">
    <sch:rule id="Measure-section-qdm-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']]">
      <sch:assert id="a-67-12803-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12803) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.3" (CONF:67-12804).</sch:assert>
      <sch:assert id="a-67-12978-error" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-12978).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure-section-qdm-entry-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']]/cda:entry">
      <sch:assert id="a-67-13193-error" test="count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']])=1">Such entries SHALL contain exactly one [1..1] eMeasure Reference QDM (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.97) (CONF:67-13193).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Discharge-Medication-pattern-errors">
    <sch:rule id="Discharge-Medication-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105'][@extension='2016-02-01']]">
      <sch:assert id="a-2228-16550-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-16550).</sch:assert>
      <sch:assert id="a-2228-16551-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-16551).</sch:assert>
      <sch:assert id="a-2228-26956-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2228-26956) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.105" (CONF:2228-26957). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27037).</sch:assert>
      <sch:assert id="a-2228-26955-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:2228-26955).</sch:assert>
      <sch:assert id="a-2228-16552-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2228-16552).</sch:assert>
      <sch:assert id="a-2228-16553-error" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16' ][@extension='2014-06-09']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2228-16553) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:2228-16554) SHALL contain exactly one [1..1] Medication Activity (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.16:2014-06-09) (CONF:2228-16555).</sch:assert>
    </sch:rule>
    <sch:rule id="Discharge-Medication-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.105'][@extension='2016-02-01']]/cda:code">
      <sch:assert id="a-2228-28140-error" test="@code='75311-1'">This code SHALL contain exactly one [1..1] @code="75311-1" Discharge medications (CONF:2228-28140).</sch:assert>
      <sch:assert id="a-2228-28141-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2228-28141).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Diagnosis_concern_act-pattern-errors">
    <sch:rule id="Diagnosis_concern_act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28148-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28148).</sch:assert>
      <sch:assert id="a-3343-28149-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28149).</sch:assert>
      <sch:assert id="a-3343-28143-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28143) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.137" (CONF:3343-28146). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28692).</sch:assert>
      <sch:assert id="a-3343-28144-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28144).</sch:assert>
      <sch:assert id="a-3343-28142-error" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.135' ][@extension='2017-08-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28142) such that it  SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28151).  SHALL contain exactly one [1..1] Diagnosis (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.135:2017-08-01) (CONF:3343-28145).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnosis_concern_act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.137'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-28150-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet QDM Diagnosis Status urn:oid:2.16.840.1.113762.1.4.1021.35 DYNAMIC (CONF:3343-28150).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Family_History_Organizer_V3-pattern-errors">
    <sch:rule id="Family_History_Organizer_V3-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-8600-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" Cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8600).</sch:assert>
      <sch:assert id="a-1198-8601-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8601).</sch:assert>
      <sch:assert id="a-1198-8604-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-8604) such that it 
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.45" (CONF:1198-10497). 
					SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32606).</sch:assert>
      <sch:assert id="a-1198-32485-error" test="count(cda:id)  &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-32485).</sch:assert>
      <sch:assert id="a-1198-8602-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1198-8602).</sch:assert>
      <sch:assert id="a-1198-8609-error" test="count(cda:subject)  = 1">SHALL contain exactly one [1..1] subject (CONF:1198-8609).</sch:assert>
      <sch:assert id="a-1198-32428-error" test="count(cda:component) &gt; 0">SHALL contain at least one [1..*] component (CONF:1198-32428).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Organizer_V3-statusCode-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:statusCode">
      <sch:assert id="a-1198-19099-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19099).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Organizer_V3-subject-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:subject">
      <sch:assert id="a-1198-15244-error" test="count(cda:relatedSubject) = 1">This subject SHALL contain exactly one [1..1] relatedSubject (CONF:1198-15244).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Organizer_V3-relatedSubject-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:subject/cda:relatedSubject">
      <sch:assert id="a-1198-15245-error" test="@classCode='PRS'">This relatedSubject SHALL contain exactly one [1..1] @classCode="PRS" Person (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1198-15245).</sch:assert>
      <sch:assert id="a-1198-15246-error" test="count(cda:code) = 1">This relatedSubject SHALL contain exactly one [1..1] code (CONF:1198-15246).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Organizer_V3-code-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:subject/cda:relatedSubject/cda:code">
      <sch:assert id="a-1198-15247-error" test="@code">This code SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Family Member Value Set urn:oid:2.16.840.1.113883.1.11.19579 DYNAMIC (CONF:1198-15247).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Organizer_V3-relatedSubject-subject-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:subject/cda:relatedSubject/cda:subject">
      <sch:assert id="a-1198-15974-error" test="count(cda:administrativeGenderCode) = 1">The subject, if present, SHALL contain exactly one [1..1] administrativeGenderCode (CONF:1198-15974).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Organizer_V3-relatedSubject-administrativeGenderCode-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:subject/cda:relatedSubject/cda:subject/cda:administrativeGenderCode">
      <sch:assert id="a-1198-15975-error" test="@code">This administrativeGenderCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Administrative Gender (HL7 V3) urn:oid:2.16.840.1.113883.1.11.1 DYNAMIC (CONF:1198-15975).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Organizer_V3-component-subject-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:component">
      <sch:assert id="a-1198-32429-error" test="count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]) = 1">Such components SHALL contain exactly one [1..1] Family History Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.46:2015-08-01) (CONF:1198-32429).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Physical_Exam_Recommended-pattern-errors">
    <sch:rule id="Physical_Exam_Recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27556-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27556).</sch:assert>
      <sch:assert id="a-3343-12665-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12665).</sch:assert>
      <sch:assert id="a-3343-12666-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12666) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.60" (CONF:3343-12667). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27082).</sch:assert>
      <sch:assert id="a-3343-12669-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-12669).</sch:assert>
      <sch:assert id="a-3343-13275-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-13275).</sch:assert>
      <sch:assert id="a-3343-27351-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27351).</sch:assert>
    </sch:rule>
    <sch:rule id="Physical_Exam_Recommended-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-13274-error" test="@code='29545-1'">This code SHALL contain exactly one [1..1] @code="29545-1" physical examination (CONF:3343-13274).</sch:assert>
      <sch:assert id="a-3343-28132-error" test="@codeSystem='2.16.840.1.113883.6.1' ">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-28132).</sch:assert>
    </sch:rule>
    <sch:rule id="Physical_Exam_Recommended-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29053-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29053).</sch:assert>
      <sch:assert id="a-3343-29052-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29052).</sch:assert>
    </sch:rule>
    <sch:rule id="Physical_Exam_Recommended-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.60'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29054-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29054).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Laboratory_Test_Performed-pattern-errors">
    <sch:rule id="Laboratory_Test_Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-11705-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11705).</sch:assert>
      <sch:assert id="a-3343-11706-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11706).</sch:assert>
      <sch:assert id="a-3343-11721-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-11721) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.38" (CONF:3343-11722). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27021).</sch:assert>
      <sch:assert id="a-3343-11707-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-11707).</sch:assert>
      <sch:assert id="a-3343-27637-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-27637).</sch:assert>
      <sch:assert id="a-3343-11709-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-11709).</sch:assert>
      <sch:assert id="a-3343-11711-error" test="count(cda:effectiveTime[count(cda:low)=1] [count(cda:high)=1]) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-11711) such that it  SHALL contain exactly one [1..1] low (CONF:3343-11712).  SHALL contain exactly one [1..1] high (CONF:3343-11713).</sch:assert>
      <sch:assert id="a-3343-29134-error" test="count(cda:value)=0">SHALL NOT contain [0..0] value (CONF:3343-29134).</sch:assert>
    </sch:rule>
    <sch:rule id="Laboratory_Test_Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-11710-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11710).</sch:assert>
    </sch:rule>
    <sch:rule id="Laboratory_Test_Performed-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29125-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-29125).</sch:assert>
      <sch:assert id="a-3343-29121-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29121).</sch:assert>
    </sch:rule>
    <sch:rule id="Laboratory_Test_Performed-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29126-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29126).</sch:assert>
    </sch:rule>
    <sch:rule id="Laboratory_Test_Performed-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:referenceRange">
      <sch:assert id="a-3343-29124-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:3343-29124).</sch:assert>
    </sch:rule>
    <sch:rule id="Laboratory_Test_Performed-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.38'][@extension='2017-08-01']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-3343-29129-error" test="count(cda:code)=0">This observationRange SHALL NOT contain [0..0] code (CONF:3343-29129).</sch:assert>
      <sch:assert id="a-3343-29130-error" test="count(cda:value[@xsi:type='IVL_PQ'])=0">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="IVL_PQ" (CONF:3343-29130).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Allergy_status_observation-pattern-errors">
    <sch:rule id="Allergy_status_observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]">
      <sch:assert id="a-1098-7318-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7318).</sch:assert>
      <sch:assert id="a-1098-7319-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7319).</sch:assert>
      <sch:assert id="a-1098-7317-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7317) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.28" (CONF:1098-10490).</sch:assert>
      <sch:assert id="a-1098-7320-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-7320).</sch:assert>
      <sch:assert id="a-1098-7321-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7321).</sch:assert>
      <sch:assert id="a-1098-7322-error" test="count(cda:value[@xsi:type='CE'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CE", where the code SHALL be selected from ValueSet Problem Status urn:oid:2.16.840.1.113883.3.88.12.80.68 DYNAMIC (CONF:1098-7322).</sch:assert>
    </sch:rule>
    <sch:rule id="Allergy_status_observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]/cda:code">
      <sch:assert id="a-1098-19131-error" test="@code='33999-4'">This code SHALL contain exactly one [1..1] @code="33999-4" Status (CONF:1098-19131).</sch:assert>
      <sch:assert id="a-1098-32155-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-32155).</sch:assert>
    </sch:rule>
    <sch:rule id="Allergy_status_observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.28']]/cda:statusCode">
      <sch:assert id="a-1098-19087-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19087).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient_Characteristic_Observation_Assertion-pattern-errors">
    <sch:rule id="Patient_Characteristic_Observation_Assertion-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-16536-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-16536).</sch:assert>
      <sch:assert id="a-3343-16537-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-16537).</sch:assert>
      <sch:assert id="a-3343-28623-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28623).</sch:assert>
      <sch:assert id="a-3343-26962-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-26962) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.103" (CONF:3343-26963) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27781).</sch:assert>
      <sch:assert id="a-3343-16538-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-16538).</sch:assert>
      <sch:assert id="a-3343-16544-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-16544).</sch:assert>
      <sch:assert id="a-3343-16539-error" test="count(cda:statusCode[@code='completed']) = 1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CONF:3343-16539).</sch:assert>
      <sch:assert id="a-3343-16540-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-16540).</sch:assert>
      <sch:assert id="a-3343-16541-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-16541)</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_Characteristic_Observation_Assertion-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-16545-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" (CONF:3343-16545).</sch:assert>
      <sch:assert id="a-3343-28135-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28135).</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_Characteristic_Observation_Assertion-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.103'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-27670-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-27670).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient_Characteristic_Clinical_Trial_Participant-pattern-errors">
    <sch:rule id="Patient_Characteristic_Clinical_Trial_Participant-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-16711-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-16711).</sch:assert>
      <sch:assert id="a-3343-12526-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12526).</sch:assert>
      <sch:assert id="a-3343-28086-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28086).</sch:assert>
      <sch:assert id="a-3343-12537-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12537) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.51" (CONF:3343-12538).SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27026).</sch:assert>
      <sch:assert id="a-3343-26996-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-26996).</sch:assert>
      <sch:assert id="a-3343-13041-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-13041).</sch:assert>
      <sch:assert id="a-3343-13042-error" test="count(cda:statusCode[@code='active']) = 1">SHALL contain exactly one [1..1] statusCode="active" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-13042).</sch:assert>
      <sch:assert id="a-3343-12536-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-12536).</sch:assert>
      <sch:assert id="a-3343-16712-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-16712).</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_Characteristic_Clinical_Trial_Participant-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28130-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-28130).</sch:assert>
      <sch:assert id="a-3343-28131-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28131).</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_Characteristic_Clinical_Trial_Participant-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.51'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-27668-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-27668).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Dispensed-pattern-errors">
    <sch:rule id="Medication_Dispensed-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27528-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27528).</sch:assert>
      <sch:assert id="a-3343-27529-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-27529).</sch:assert>
      <sch:assert id="a-3343-13851-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-13851) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.45" (CONF:3343-13852). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26555).</sch:assert>
      <sch:assert id="a-3343-19440-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:3343-19440).</sch:assert>
      <sch:assert id="a-3343-28910-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-28910).</sch:assert>
      <sch:assert id="a-3343-28908-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139'][@extension='2017-08-01']) = 1">This template SHALL be contained by a Medication Dispensed Act (V2) (CONF:3343-28908).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed-author-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29011-error" test="count(cda:time) = 1">This author SHALL contain exactly one [1..1] time (CONF:3343-29011).</sch:assert>
      <sch:assert id="a-3343-29010-error" test="count(cda:assignedAuthor) = 1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29010).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed-author-assignedAuthor-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29012-error" test="count(cda:id) &gt;= 1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29012).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed-statuscode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-19441-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-19441).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed-effectiveTime-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-29143-error" test="count(cda:low)=1">The effectiveTime, if present, SHALL contain exactly one [1..1] low (CONF:3343-29143).</sch:assert>
      <sch:assert id="a-3343-29144-error" test="count(cda:high)=1">The effectiveTime, if present, SHALL contain exactly one [1..1] high (CONF:3343-29144).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed-entryRelationship-substanceAdministration-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration">
      <sch:assert id="a-3343-28226-error" test="@classCode='SBADM'">This substanceAdministration SHALL contain exactly one [1..1] @classCode="SBADM" Substance Administration (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28226).</sch:assert>
      <sch:assert id="a-3343-28227-error" test="@moodCode='EVN'">This substanceAdministration SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28227).</sch:assert>
      <sch:assert id="a-3343-28229-error" test="count(cda:consumable)=1">This substanceAdministration SHALL contain exactly one [1..1] consumable (CONF:3343-28229).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed-entryRelationship-substanceAdministration-consumable-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration/cda:consumable">
      <sch:assert id="a-3343-28230-error" test="count(cda:manufacturedProduct)=1">This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:3343-28230).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed-entryRelationship-substanceAdministration-consumable-manufacturedProduct-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct">
      <sch:assert id="a-3343-28231-error" test="count(cda:manufacturedMaterial)=1">This manufacturedProduct SHALL contain exactly one [1..1] manufacturedMaterial (CONF:3343-28231).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed-entryRelationship-substanceAdministration-consumable-manufacturedProduct-manufacturedMaterial-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']]/cda:entryRelationship[@typeCode='REFR']/cda:substanceAdministration/cda:consumable/cda:manufacturedProduct/cda:manufacturedMaterial">
      <sch:assert id="a-3343-28232-error" test="@nullFlavor='NA'">This manufacturedMaterial SHALL contain exactly one [1..1] @nullFlavor="NA" (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:3343-28232).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Recommended-pattern-errors">
    <sch:rule id="Procedure-Recommended-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27337-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27337).</sch:assert>
      <sch:assert id="a-3343-11103-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11103).</sch:assert>
      <sch:assert id="a-3343-11104-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11104) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.65" (CONF:3343-11105). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27086).</sch:assert>
      <sch:assert id="a-3343-11107-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-11107).</sch:assert>
      <sch:assert id="a-3343-27352-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27352).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Recommended-author-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29059-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29059).</sch:assert>
      <sch:assert id="a-3343-29058-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29058).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Recommended-author-assignedAuthor-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.65'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29060-warning" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29060).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient_Characteristic_Expired-pattern-errors">
    <sch:rule id="Patient_Characteristic_Expired-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54'][@extension='2016-02-01']]">
      <sch:assert id="a-2228-28087-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2228-28087).</sch:assert>
      <sch:assert id="a-2228-28088-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:2228-28088).</sch:assert>
      <sch:assert id="a-2228-28089-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:2228-28089).</sch:assert>
      <sch:assert id="a-2228-12540-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.54'][@extension='2016-02-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:2228-12540) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.54" (CONF:2228-12541). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2228-27014).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Product-Instance-pattern-errors">
    <sch:rule id="Product-Instance-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]">
      <sch:assert id="a-81-7900-error" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:81-7900).</sch:assert>
      <sch:assert id="a-81-7901-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7901) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.37" (CONF:81-10522).</sch:assert>
      <sch:assert id="a-81-7902-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:81-7902).</sch:assert>
      <sch:assert id="a-81-7903-error" test="count(cda:playingDevice)=1">SHALL contain exactly one [1..1] playingDevice (CONF:81-7903).</sch:assert>
      <sch:assert id="a-81-7905-error" test="count(cda:scopingEntity)=1">SHALL contain exactly one [1..1] scopingEntity (CONF:81-7905).</sch:assert>
    </sch:rule>
    <sch:rule id="Product-Instance-scopingEntity-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]/cda:scopingEntity">
      <sch:assert id="a-81-7908-error" test="count(cda:id)&gt;=1">This scopingEntity SHALL contain at least one [1..*] id (CONF:81-7908).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Assessment_recommended-pattern-errors">
    <sch:rule id="Assessment_recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28682-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28682).</sch:assert>
      <sch:assert id="a-3343-28681-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28681).</sch:assert>
      <sch:assert id="a-3343-28673-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28673) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.145" (CONF:3343-28676). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28702).</sch:assert>
      <sch:assert id="a-3343-28674-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28674).</sch:assert>
      <sch:assert id="a-3343-28680-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1])=1">SHALL contain exactly one [1..1] author (CONF:3343-28680) such that it SHALL contain exactly one [1..1] time (CONF:3343-29038). SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29037).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_recommended-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.145'][@extension='2017-08-01']]/cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]/cda:assignedAuthor">
      <sch:assert id="a-3343-29039-error" test="count(cda:id) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29039).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Incision_datetime-pattern-errors">
    <sch:rule id="Incision_datetime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]">
      <sch:assert id="a-67-14559-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-14559).</sch:assert>
      <sch:assert id="a-67-11401-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-11401).</sch:assert>
      <sch:assert id="a-67-11402-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:67-11402) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.89" (CONF:67-11403).</sch:assert>
      <sch:assert id="a-67-26984-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:67-26984).</sch:assert>
      <sch:assert id="a-67-14562-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-14562).</sch:assert>
      <sch:assert id="a-67-14561-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:67-14561).</sch:assert>
    </sch:rule>
    <sch:rule id="Incision_datetime-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.89']]/cda:code">
      <sch:assert id="a-67-27014-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:67-27014).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Performed-pattern-errors">
    <sch:rule id="Encounter-Performed-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27532-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27532).</sch:assert>
      <sch:assert id="a-3343-27533-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-27533).</sch:assert>
      <sch:assert id="a-3343-11861-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11861) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.23" (CONF:3343-11862).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26552).</sch:assert>
      <sch:assert id="a-3343-28802-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-28802).</sch:assert>
      <sch:assert id="a-3343-27624-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27624).</sch:assert>
      <sch:assert id="a-3343-11874-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-11874).</sch:assert>
      <sch:assert id="a-3343-11876-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-11876).</sch:assert>
      <sch:assert id="a-3343-28803-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133'][@extension='2017-08-01'])=1">This template SHALL be contained by an Encounter Performed Act (V2) (CONF:3343-28803).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Performed-id-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:id">
      <sch:assert id="a-3343-28804-error" test="@root">Such ids SHALL contain exactly one [1..1] @root (CONF:3343-28804).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Performed-statusCode-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-11875-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11875).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Performed-effectiveTime-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-11877-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-11877).</sch:assert>
      <sch:assert id="a-3343-11878-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:3343-11878).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Order-pattern-errors">
    <sch:rule id="Encounter-Order-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27534-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27534).</sch:assert>
      <sch:assert id="a-3343-11932-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11932).</sch:assert>
      <sch:assert id="a-3343-11933-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11933) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.22" (CONF:3343-11934).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27064).</sch:assert>
      <sch:assert id="a-3343-11936-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-11936).</sch:assert>
      <sch:assert id="a-3343-27341-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27341).</sch:assert>
      <sch:assert id="a-3343-28668-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'][@extension='2017-08-01'])=1">This template SHALL be contained by an Encounter Order Act (V2) (CONF:3343-28668).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Order-author-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29023-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29023).</sch:assert>
      <sch:assert id="a-3343-29022-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29022).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Order-author-assignedAuthor-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29024-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29024).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Precondition-For-Substance-Administration-pattern-errors">
    <sch:rule id="Precondition-For-Substance-Administration-errors" context="cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7372-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7372) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.25" (CONF:1098-10517). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32603).</sch:assert>
      <sch:assert id="a-1098-32396-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code with @xsi:type="CD" (CONF:1098-32396).</sch:assert>
      <sch:assert id="a-098-7369-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1098-7369).</sch:assert>
    </sch:rule>
    <sch:rule id="Precondition-For-Substance-Administration-code-errors" context="cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-32397-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-32397).</sch:assert>
      <sch:assert id="a-1098-32398-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32398).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Order-pattern-errors">
    <sch:rule id="Medication_Order-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27377-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27377).</sch:assert>
      <sch:assert id="a-3343-12639-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12639).</sch:assert>
      <sch:assert id="a-3343-12585-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.47'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12585) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.47" (CONF:3343-12586). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27089).</sch:assert>
      <sch:assert id="a-3343-27740-error" test="count(cda:effectiveTime[count(cda:low)=1][count(cda:high)=1]) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-27740) such that it SHALL contain exactly one [1..1] low (CONF:3343-27742) SHALL contain exactly one [1..1] high (CONF:3343-29141).</sch:assert>
      <sch:assert id="a-3343-27745-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:3343-27745).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Information-pattern-errors">
    <sch:rule id="Medication_Information-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7408-error" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-7408).</sch:assert>
      <sch:assert id="a-1098-7409-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-7409) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.23" (CONF:1098-10506). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32579).</sch:assert>
      <sch:assert id="a-1098-7411-error" test="count(cda:manufacturedMaterial) = 1">SHALL contain exactly one [1..1] manufacturedMaterial (CONF:1098-7411).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Information-manufacturedMaterial-errors" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09']]/cda:manufacturedMaterial">
      <sch:assert id="a-1098-7412-error" test="count(cda:code) = 1">This manufacturedMaterial SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Medication Clinical Drug urn:oid:2.16.840.1.113762.1.4.1010.4 DYNAMIC (CONF:1098-7412).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Facility-Location-pattern-errors">
    <sch:rule id="Facility-Location-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-13374-error" test="@typeCode='LOC'">SHALL contain exactly one [1..1] @typeCode="LOC" location (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:3343-13374).</sch:assert>
      <sch:assert id="a-3343-13375-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-13375) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.100" (CONF:3343-13376) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28729).</sch:assert>
      <sch:assert id="a-3343-13371-error" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:3343-13371).</sch:assert>
      <sch:assert id="a-3343-13372-error" test="count(cda:participantRole)=1">SHALL contain exactly one [1..1] participantRole (CONF:3343-13372).</sch:assert>
    </sch:rule>
    <sch:rule id="Facility-Location-participantRole-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]/cda:participantRole">
      <sch:assert id="a-3343-13373-error" test="@classCode='SDLOC'">This participantRole SHALL contain exactly one [1..1] @classCode="SDLOC" service delivery location (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:3343-13373).</sch:assert>
      <sch:assert id="a-3343-13378-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-13378).</sch:assert>
    </sch:rule>
    <sch:rule id="Facility-Location-participantRole-playingEntity-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]/cda:participantRole/cda:playingEntity">
      <sch:assert id="a-3343-13382-error" test="@classCode='PLC'">The playingEntity, if present, SHALL contain exactly one [1..1] @classCode="PLC" place (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:3343-13382).</sch:assert>
    </sch:rule>
    <sch:rule id="Facility-Location-time-errors" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]/cda:time">
      <sch:assert id="a-3343-13384-error" test="count(cda:low)=1">This time SHALL contain exactly one [1..1] low (CONF:3343-13384).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Allergy-Intolerance-pattern-errors">
    <sch:rule id="Allergy-Intolerance-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28826-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3343-28826).</sch:assert>
      <sch:assert id="a-3343-28827-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3343-28827).</sch:assert>
      <sch:assert id="a-3343-28848-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28848).</sch:assert>
      <sch:assert id="a-3343-28816-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-28816) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.147" (CONF:3343-28828). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28829).</sch:assert>
      <sch:assert id="a-3343-28817-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28817).</sch:assert>
      <sch:assert id="a-3343-28819-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28819).</sch:assert>
      <sch:assert id="a-3343-28836-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28836).</sch:assert>
      <sch:assert id="a-3343-28820-error" test="count(cda:participant[@typeCode='CSM'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-28820) such that it SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:3343-28837). SHALL contain exactly one [1..1] participantRole (CONF:3343-28821).</sch:assert>
    </sch:rule>
    <sch:rule id="Allergy-Intolerance-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28831-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-28831).</sch:assert>
      <sch:assert id="a-3343-28832-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28832).</sch:assert>
    </sch:rule>
    <sch:rule id="Allergy-Intolerance-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-28834-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28834).</sch:assert>
    </sch:rule>
    <sch:rule id="Allergy-Intolerance-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:value[@xsi:type='CD']">
      <sch:assert id="a-3343-28849-error" test="@code='419199007'">This value SHALL contain exactly one [1..1] @code="419199007" Allergy to substance (CONF:3343-28849).</sch:assert>
      <sch:assert id="a-3343-28850-error" test="@codeSystem='2.16.840.1.113883.6.96'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-28850).</sch:assert>
    </sch:rule>
    <sch:rule id="Allergy-Intolerance-participant-participantRole-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:participant[@typeCode='CSM']/cda:participantRole">
      <sch:assert id="a-3343-28838-error" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:3343-28838).</sch:assert>
      <sch:assert id="a-3343-28822-error" test="count(cda:playingEntity)=1">This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:3343-28822).</sch:assert>
    </sch:rule>
    <sch:rule id="Allergy-Intolerance-participant-participantRole-playingEntity-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.147'][@extension='2017-08-01']]/cda:participant[@typeCode='CSM']/cda:participantRole[@classCode='MANU']/cda:playingEntity">
      <sch:assert id="a-3343-28839-error" test="@classCode='MMAT'">This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured Material (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:3343-28839).</sch:assert>
      <sch:assert id="a-3343-28840-error" test="count(cda:code)=1">This playingEntity SHALL contain exactly one [1..1] code (CONF:3343-28840).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Substance-Device-Allergy-Intolerance-Observation-pattern-errors">
    <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-16303-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-16303).</sch:assert>
      <sch:assert id="a-1098-16304-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-16304).</sch:assert>
      <sch:assert id="a-1098-16305-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-16305) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.90" (CONF:1098-16306).  SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32527).</sch:assert>
      <sch:assert id="a-1098-16307-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-16307).</sch:assert>
      <sch:assert id="a-1098-16345-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-16345).</sch:assert>
      <sch:assert id="a-1098-16308-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-16308).</sch:assert>
      <sch:assert id="a-1098-16309-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-16309).</sch:assert>
      <sch:assert id="a-1098-16312-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1098-16312).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-16346-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1098-16346).</sch:assert>
      <sch:assert id="a-1098-32171-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32171).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-26354-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-26354).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09']]/cda:effectiveTime">
      <sch:assert id="a-1098-31536-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1098-31536).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09']]/cda:value">
      <sch:assert id="a-1098-16317-error" test="@code">This value SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Allergy and Intolerance Type urn:oid:2.16.840.1.113883.3.88.12.3221.6.2 DYNAMIC (CONF:1098-16317).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Problem-Concern-Act-pattern-errors">
    <sch:rule id="Problem-Concern-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-9024-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9024).</sch:assert>
      <sch:assert id="a-1198-9025-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9025).</sch:assert>
      <sch:assert id="a-1198-16772-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-16772) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.3" (CONF:1198-16773). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32509).</sch:assert>
      <sch:assert id="a-1198-9026-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1198-9026).</sch:assert>
      <sch:assert id="a-1198-9027-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-9027).</sch:assert>
      <sch:assert id="a-1198-9029-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-9029).</sch:assert>
      <sch:assert id="a-1198-9030-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9030).</sch:assert>
      <sch:assert id="a-1198-9034-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']])=1]) &gt;= 1">SHALL contain at least one [1..*] entryRelationship (CONF:1198-9034) such that it SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-15980). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-9035).</sch:assert>
    </sch:rule>
    <sch:rule id="Problem-Concern-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]/cda:code">
      <sch:assert id="a-1198-19184-error" test="@code='CONC'">This code SHALL contain exactly one [1..1] @code="CONC" Concern (CONF:1198-19184).</sch:assert>
      <sch:assert id="a-1198-32168-error" test="@codeSystem='2.16.840.1.113883.5.6'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.6" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1198-32168).</sch:assert>
    </sch:rule>
    <sch:rule id="Problem-Concern-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]/cda:statusCode">
      <sch:assert id="a-1198-31525-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProblemAct statusCode urn:oid:2.16.840.1.113883.11.20.9.19 STATIC (CONF:1198-31525).</sch:assert>
    </sch:rule>
    <sch:rule id="Problem-Concern-Act-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]/cda:effectiveTime">
      <sch:assert id="a-1198-9032-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-9032).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned-Medication-Activity-pattern-errors">
    <sch:rule id="Planned-Medication-Activity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8572-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8572).</sch:assert>
      <sch:assert id="a-1098-8573-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2011-09-30 (CONF:1098-8573).</sch:assert>
      <sch:assert id="a-1098-30465-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30465) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.42" (CONF:1098-30466). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32557).</sch:assert>
      <sch:assert id="a-1098-8575-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8575).</sch:assert>
      <sch:assert id="a-1098-32087-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32087).</sch:assert>
      <sch:assert id="a-1098-30468-error" test="count(cda:effectiveTime)&gt;=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-30468).</sch:assert>
      <sch:assert id="a-1098-32082-error" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1098-32082).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Medication-Activity-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32088-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32088).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Medication-Activity-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09']]/cda:consumable">
      <sch:assert id="a-1098-32083-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'] [@extension = '2014-06-09']])=1">This consumable SHALL contain exactly one [1..1] Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:1098-32083).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Medication-Activity-precondition-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09']]/cda:precondition">
      <sch:assert id="a-1098-32085-error" test="@typeCode='PRCN'">The precondition, if present, SHALL contain exactly one [1..1] @typeCode="PRCN" Precondition (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32085).</sch:assert>
      <sch:assert id="a-1098-32086-error" test="count(cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25' and @extension = '2014-06-09']])=1">The precondition, if present, SHALL contain exactly one [1..1] Precondition for Substance Administration (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.25:2014-06-09) (CONF:1098-32086).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Activity-Procedure-pattern-errors">
    <sch:rule id="Procedure-Activity-Procedure-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7652-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7652).</sch:assert>
      <sch:assert id="a-1098-7653-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7653).</sch:assert>
      <sch:assert id="a-1098-7654-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7654) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.14" (CONF:1098-10521). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32506).</sch:assert>
      <sch:assert id="a-1098-7655-error" test="count(cda:id) &gt;=1">SHALL contain at least one [1..*] id (CONF:1098-7655).</sch:assert>
      <sch:assert id="a-1098-7656-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-7656).</sch:assert>
      <sch:assert id="a-1098-7661-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7661).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-code-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:code/cda:originalText/cda:reference[@value]">
      <sch:assert id="a-1098-19206-error" test="starts-with(@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19206).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32366-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureAct statusCode urn:oid:2.16.840.1.113883.11.20.9.22 STATIC 2014-04-23 (CONF:1098-32366).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-targetSiteCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:targetSiteCode">
      <sch:assert id="a-1098-16082-error" test="@code">The targetSiteCode, if present, SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-16082).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-performer-specimen-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:specimen">
      <sch:assert id="a-1098-7704-error" test="count(cda:specimenRole)=1">The specimen, if present, SHALL contain exactly one [1..1] specimenRole (CONF:1098-7704).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-performer-assignedEntity-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1098-7722-error" test="count(cda:id)&gt;=1">This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-7722).</sch:assert>
      <sch:assert id="a-1098-7732-error" test="count(cda:telecom)&gt;=1">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-7732).</sch:assert>
      <sch:assert id="a-1098-7731-error" test="count(cda:addr)&gt;=1">This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-7731).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-performer-assignedEntity-representedOrganization-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-1098-7737-error" test="count(cda:telecom)=1">The representedOrganization, if present, SHALL contain exactly one [1..1] telecom (CONF:1098-7737).</sch:assert>
      <sch:assert id="a-1098-7736-error" test="count(cda:addr)=1">The representedOrganization, if present, SHALL contain exactly one [1..1] addr (CONF:1098-7736).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Symptom-Concern-Act-pattern-errors">
    <sch:rule id="Symptom-Concern-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28547-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28547).</sch:assert>
      <sch:assert id="a-3343-28548-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28548).</sch:assert>
      <sch:assert id="a-3343-28539-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28539) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.138" (CONF:3343-28544). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28694).</sch:assert>
      <sch:assert id="a-3343-28540-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28540).</sch:assert>
      <sch:assert id="a-3343-28538-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136'][@extension='2017-08-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28538) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28543). SHALL contain exactly one [1..1] Symptom (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.136:2017-08-01) (CONF:3343-28542).</sch:assert>
    </sch:rule>
    <sch:rule id="Symptom-Concern-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-28545-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28545).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Problem-Status-pattern-errors">
    <sch:rule id="Problem-Status-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]">
      <sch:assert id="a-1098-7357-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7357).</sch:assert>
      <sch:assert id="a-1098-7358-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7358).</sch:assert>
      <sch:assert id="a-1098-10518-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7359) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.6" (CONF:1098-10518).</sch:assert>
      <sch:assert id="a-1098-19162-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19162).</sch:assert>
      <sch:assert id="a-1098-7364-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7364).</sch:assert>
    </sch:rule>
    <sch:rule id="Problem-Status-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]/cda:code">
      <sch:assert id="a-1098-19163-error" test="@code='33999-4'">This code SHALL contain exactly one [1..1] @code="33999-4" Status (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1098-19163).</sch:assert>
    </sch:rule>
    <sch:rule id="Problem-Status-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.6']]/cda:statusCode">
      <sch:assert id="a-1098-19113-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19113).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned_Encounter-pattern-errors">
    <sch:rule id="Planned_Encounter-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8564-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8564).</sch:assert>
      <sch:assert id="a-1098-8565-error" test="@moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8565).</sch:assert>
      <sch:assert id="a-1098-30437-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-30437) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.40" (CONF:1098-30438). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32553).</sch:assert>
      <sch:assert id="a-1098-8567-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8567).</sch:assert>
      <sch:assert id="a-1098-30439-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30439).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Encounter-statusCode-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-31880-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31880).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Status-pattern-errors">
    <sch:rule id="Status-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]">
      <sch:assert id="a-67-11879-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-11879).</sch:assert>
      <sch:assert id="a-67-11880-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-11880).</sch:assert>
      <sch:assert id="a-67-11881-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:67-11881) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.93" (CONF:67-11882).</sch:assert>
      <sch:assert id="a-67-11885-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-11885).</sch:assert>
      <sch:assert id="a-67-11887-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:67-11887).</sch:assert>
    </sch:rule>
    <sch:rule id="Status-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.93']]/cda:code">
      <sch:assert id="a-67-11886-error" test="@code='33999-4'">This code SHALL contain exactly one [1..1] @code="33999-4" status (CONF:67-11886).</sch:assert>
      <sch:assert id="a-67-27011-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27011).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Result-Observation-pattern-errors">
    <sch:rule id="Result-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-7130-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-7130).</sch:assert>
      <sch:assert id="a-1198-7131-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-7131).</sch:assert>
      <sch:assert id="a-1198-7136-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-7136) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.2" (CONF:1198-9138). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32575).</sch:assert>
      <sch:assert id="a-1198-7137-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1198-7137).</sch:assert>
      <sch:assert id="a-1198-7133-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1198-7133).</sch:assert>
      <sch:assert id="a-1198-7134-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-7134).</sch:assert>
      <sch:assert id="a-1198-7140-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-7140).</sch:assert>
      <sch:assert id="a-1198-7143-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1198-7143).</sch:assert>
    </sch:rule>
    <sch:rule id="Result-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01']]/cda:statusCode">
      <sch:assert id="a-1198-14849-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Result Status urn:oid:2.16.840.1.113883.11.20.9.39 STATIC (CONF:1198-14849).</sch:assert>
    </sch:rule>
    <sch:rule id="Result-Observation-interpretationCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01']]/cda:interpretationCode">
      <sch:assert id="a-1198-32476-error" test="@code">The interpretationCode, if present, SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Observation Interpretation (HL7) urn:oid:2.16.840.1.113883.1.11.78 STATIC (CONF:1198-32476).</sch:assert>
    </sch:rule>
    <sch:rule id="Result-Observation-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01']]/cda:referenceRange">
      <sch:assert id="a-1198-7151-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:1198-7151).</sch:assert>
    </sch:rule>
    <sch:rule id="Result-Observation-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-1198-7152-error" test="count(cda:code)=0">This observationRange SHALL NOT contain [0..0] code (CONF:1198-7152).</sch:assert>
      <sch:assert id="a-1198-32175-error" test="count(cda:value)=1">This observationRange SHALL contain exactly one [1..1] value (CONF:1198-32175).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Instruction-pattern-errors">
    <sch:rule id="Instruction-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7391-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7391).</sch:assert>
      <sch:assert id="a-1098-7392-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7392).</sch:assert>
      <sch:assert id="a-1098-7393-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7393) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.20" (CONF:1098-10503). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32598).</sch:assert>
      <sch:assert id="a-1098-16884-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Patient Education urn:oid:2.16.840.1.113883.11.20.9.34 DYNAMIC (CONF:1098-16884).</sch:assert>
      <sch:assert id="a-1098-7396-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7396).</sch:assert>
    </sch:rule>
    <sch:rule id="Instruction-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.20'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-19106-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19106).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reason-pattern-errors">
    <sch:rule id="Reason-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-11357-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11357).</sch:assert>
      <sch:assert id="a-3343-11358-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11358).</sch:assert>
      <sch:assert id="a-3343-11359-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11359) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.88" (CONF:3343-11360). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27027).</sch:assert>
      <sch:assert id="a-3343-11361-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-11361).</sch:assert>
      <sch:assert id="a-3343-11367-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-11367).</sch:assert>
    </sch:rule>
    <sch:rule id="Reason-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-11362-error" test="@code='77301-0'">This code SHALL contain exactly one [1..1] @code="77301-0" Reason care action performed or not (CONF:3343-11362).</sch:assert>
      <sch:assert id="a-3343-27028-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-27028).</sch:assert>
    </sch:rule>
    <sch:rule id="Reason-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.88'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-27551-error" test="count(cda:low)=1">The effectiveTime, if present, SHALL contain exactly one [1..1] low (CONF:3343-27551).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Drug-Vehicle-pattern-errors">
    <sch:rule id="Drug-Vehicle-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]">
      <sch:assert id="a-81-7490-error" test="@classCode='MANU'">SHALL contain exactly one [1..1] @classCode="MANU" (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:81-7490).</sch:assert>
      <sch:assert id="a-81-7495-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:817495) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.24" (CONF:81-10493).</sch:assert>
      <sch:assert id="a-81-19137-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-19137).</sch:assert>
      <sch:assert id="a-81-7492-error" test="count(cda:playingEntity)=1">SHALL contain exactly one [1..1] playingEntity (CONF:81-7492).</sch:assert>
    </sch:rule>
    <sch:rule id="Drug-Vehicle-code-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]/cda:code">
      <sch:assert id="a-81-30818-error" test="@code='412307009'">This code SHALL contain exactly one [1..1] @code="412307009" Drug Vehicle (CONF:81-19138).</sch:assert>
      <sch:assert id="a-81-26502-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:81-26502).</sch:assert>
    </sch:rule>
    <sch:rule id="Drug-Vehicle-playingEntity-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.24']]/cda:playingEntity">
      <sch:assert id="a-81-7493-error" test="count(cda:code)=1">This playingEntity SHALL contain exactly one [1..1] code (CONF:81-7493).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Laboratory_Test_Order-pattern-errors">
    <sch:rule id="Laboratory_Test_Order-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27417-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27417).</sch:assert>
      <sch:assert id="a-3343-11953-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11953).</sch:assert>
      <sch:assert id="a-3343-11954-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-11954) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.37" (CONF:3343-11955). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27075).</sch:assert>
      <sch:assert id="a-3343-11957-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-11957).</sch:assert>
      <sch:assert id="a-3343-27344-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1])=1">SHALL contain exactly one [1..1] author (CONF:3343-27344) such that it SHALL contain exactly one [1..1] time (CONF:3343-29089).  SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29088).</sch:assert>
    </sch:rule>
    <sch:rule id="Laboratory_Test_Order-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.37'][@extension='2017-08-01']]/cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]/cda:assignedAuthor">
      <sch:assert id="a-3343-29090-error" test="count(cda:id) &gt;= 1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29090).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Intervention_Recommended-pattern-errors">
    <sch:rule id="Intervention_Recommended-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27355-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27355).</sch:assert>
      <sch:assert id="a-3343-13763-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13763).</sch:assert>
      <sch:assert id="a-3343-13764-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-13764) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.33" (CONF:3343-13765). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26557).</sch:assert>
      <sch:assert id="a-3343-13767-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-13767).</sch:assert>
      <sch:assert id="a-3343-27349-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27349).</sch:assert>
    </sch:rule>
    <sch:rule id="Intervention_Recommended-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29020-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29020).</sch:assert>
      <sch:assert id="a-3343-29019-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29019).</sch:assert>
    </sch:rule>
    <sch:rule id="Intervention_Recommended-author-assignedAuthor-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.33'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29021-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29021).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Prognosis-Observation-pattern-errors">
    <sch:rule id="Prognosis-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113']]">
      <sch:assert id="a-1098-29035-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-29035).</sch:assert>
      <sch:assert id="a-1098-29036-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-29036).</sch:assert>
      <sch:assert id="a-1098-29037-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-29037) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.113" (CONF:1098-29038).</sch:assert>
      <sch:assert id="a-1098-29439-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] value (CONF:1098-29439).</sch:assert>
      <sch:assert id="a-1098-31350-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31350).</sch:assert>
      <sch:assert id="a-1098-31123-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31123).</sch:assert>
      <sch:assert id="a-1098-29469-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1098-29469).</sch:assert>
    </sch:rule>
    <sch:rule id="Prognosis-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113']]/cda:code">
      <sch:assert id="a-1098-29468-error" test="@code='75328-5'">This code SHALL contain exactly one [1..1] @code="75328-5" Prognosis (CONF:1098-29468).</sch:assert>
      <sch:assert id="a-1098-31349-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31349).</sch:assert>
    </sch:rule>
    <sch:rule id="Prognosis-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.113']]/cda:statusCode">
      <sch:assert id="a-1098-31351-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31351).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Care-Goal-pattern-errors">
    <sch:rule id="Care-Goal-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-11245-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11245).</sch:assert>
      <sch:assert id="a-3343-11246-error" test="@moodCode='GOL'">SHALL contain exactly one [1..1] @moodCode="GOL" goal (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11246).</sch:assert>
      <sch:assert id="a-3343-28040-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28040).</sch:assert>
      <sch:assert id="a-3343-11247-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11247) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.1" (CONF:3343-11248). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27067).</sch:assert>
      <sch:assert id="a-3343-27576-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27576).</sch:assert>
      <sch:assert id="a-3343-11255-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-11255).</sch:assert>
    </sch:rule>
    <sch:rule id="Care-Goal-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.1'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-27557-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-27557).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Immunization_administered-pattern-errors">
    <sch:rule id="Immunization_administered-errors" context="cda:substanceAdministration [cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28588-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" Substance Administration (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28588).</sch:assert>
      <sch:assert id="a-3343-28589-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28589).</sch:assert>
      <sch:assert id="a-3343-28574-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28574) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.140" (CONF:3343-28581). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28958).</sch:assert>
      <sch:assert id="a-3343-28576-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28576).</sch:assert>
      <sch:assert id="a-3343-28578-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28578).</sch:assert>
      <sch:assert id="a-3343-28957-error" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:3343-28957).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_administered-statusCode-errors" context="cda:substanceAdministration [cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-28585-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28585).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_administered-effectiveTime-errors" context="cda:substanceAdministration [cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-28959-error" test="@value">This effectiveTime SHALL contain exactly one [1..1] @value (CONF:3343-28959).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_administered-consumable-errors" context="cda:substanceAdministration [cda:templateId[@root='2.16.840.1.113883.10.20.24.3.140'][@extension='2017-08-01']]/cda:consumable">
      <sch:assert id="a-3343-28960-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']])=1">This consumable SHALL contain exactly one [1..1] Immunization Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:3343-28960).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Activity-Observation-pattern-errors">
    <sch:rule id="Procedure-Activity-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8282-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8282).</sch:assert>
      <sch:assert id="a-1098-8237-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-8237).</sch:assert>
      <sch:assert id="a-1098-8238-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8238) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.13" (CONF:1098-10520). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32507).</sch:assert>
      <sch:assert id="a-1098-8239-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8239).</sch:assert>
      <sch:assert id="a-1098-19197-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-19197).</sch:assert>
      <sch:assert id="a-1098-8245-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8245).</sch:assert>
      <sch:assert id="a-1098-16846-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:1098-16846).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:code/cda:originalText/cda:reference[@value]">
      <sch:assert id="a-1098-19201-error" test="starts-with(@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19201).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32365-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureAct statusCode urn:oid:2.16.840.1.113883.11.20.9.22 STATIC 2014-04-23 (CONF:1098-32365).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-performer-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:performer">
      <sch:assert id="a-1098-8252-error" test="count(cda:assignedEntity)=1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-8252).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-performer-assignedEntity-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1098-8253-error" test="count(cda:id)&gt;=1">This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-8253).</sch:assert>
      <sch:assert id="a-1098-8254-error" test="count(cda:addr)&gt;=1">This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-8254).</sch:assert>
      <sch:assert id="a-1098-8255-error" test="count(cda:telecom)&gt;=1">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-8255).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-performer-assignedEntity-representedOrganization-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-1098-8259-error" test="count(cda:addr)&gt;=1">The representedOrganization, if present, SHALL contain exactly one [1..1] addr (CONF:1098-8259).</sch:assert>
      <sch:assert id="a-1098-8260-error" test="count(cda:telecom)&gt;=1">The representedOrganization, if present, SHALL contain exactly one [1..1] telecom (CONF:1098-8260).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Dispense_V2-pattern-errors">
    <sch:rule id="Medication_Dispense_V2-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7451-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7451).</sch:assert>
      <sch:assert id="a-1098-7452-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7452).</sch:assert>
      <sch:assert id="a-1098-7453-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-7453) such that it
					SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.18" (CONF:1098-10505).
					SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32580).</sch:assert>
      <sch:assert id="a-1098-7454-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7454).</sch:assert>
      <sch:assert id="a-1098-7455-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7455).</sch:assert>
      <sch:assert id="a-1098-9333-error" test="(cda:product[count(cda:manufacturedProduct)=1]) and (count(cda:product[cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09']] or cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']]]) = 1)">A supply act SHALL contain one product/Medication Information OR one product/Immunization Medication Information template (CONF:1098-9333).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispense_V2-statuscode-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32361-error" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.88.12.80.64']/voc:code/@value">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Medication Fill Status urn:oid:2.16.840.1.113883.3.88.12.80.64 STATIC 2014-04-23 (CONF:1098-32361).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispense_V2-may-performer-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18'][@extension='2014-06-09']]/cda:performer">
      <sch:assert id="a-1098-7461-error" test="count(cda:assignedEntity) = 1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-7467).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="US-Realm-Person-Name-pattern-errors">
    <sch:rule id="US-Realm-Person-Name-name-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:patient/cda:name             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3']]/cda:recordTarget/cda:patientRole/cda:patient/cda:name             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:guardianPerson/cda:name             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author/cda:assignedAuthor/cda:assignedPerson/cda:name             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:dataEnterer/cda:assignedEntity/cda:assignedPerson/cda:name             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:informationRecipient/cda:intendedRecipient/cda:informationRecipient/cda:name             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson/cda:name">
      <sch:assert id="a-81-9371-error" test="(cda:given and cda:family) or (count(../cda:name/*)=0 and string-length(../cda:name/text()[normalize-space()])!=0)">The content of name SHALL be either a conformant Patient Name (PTN.US.FIELDED), or a string (CONF:81-9371).</sch:assert>
      <sch:assert id="a-81-9372-error" test="(cda:given and cda:family) or (count(../cda:name/*)=0)">The string SHALL NOT contain name parts (CONF:81-9372).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Problem-Observation-pattern-errors">
    <sch:rule id="Problem-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-9041-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-9041).</sch:assert>
      <sch:assert id="a-1198-9042-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-9042).</sch:assert>
      <sch:assert id="a-1198-14926-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14926) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.4" (CONF:1198-14927). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32508).</sch:assert>
      <sch:assert id="a-1198-9043-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1198-9043).</sch:assert>
      <sch:assert id="a-1198-9045-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-9045).</sch:assert>
      <sch:assert id="a-1198-9049-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-9049).</sch:assert>
      <sch:assert id="a-1198-9050-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9050).</sch:assert>
      <sch:assert id="a-1198-9058-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1198-9058).</sch:assert>
    </sch:rule>
    <sch:rule id="Problem-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']]/cda:code">
      <sch:assert id="a-1198-32848-error" test="count(cda:translation) &gt;= 1">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 2014-09-02 (CONF:1198-32848).</sch:assert>
    </sch:rule>
    <sch:rule id="Problem-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']]/cda:statusCode">
      <sch:assert id="a-1198-19112-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19112).</sch:assert>
    </sch:rule>
    <sch:rule id="Problem-Observation-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']]/cda:effectiveTime">
      <sch:assert id="a-1198-15603-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-15603).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Immunization_order-pattern-errors">
    <sch:rule id="Immunization_order-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28645-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28645).</sch:assert>
      <sch:assert id="a-3343-28644-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28644).</sch:assert>
      <sch:assert id="a-3343-28627-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28627) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.143" (CONF:3343-28634). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28923).</sch:assert>
      <sch:assert id="a-3343-28924-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28924).</sch:assert>
      <sch:assert id="a-3343-28646-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-28646).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_order-effectiveTime-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-28925-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28925).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_order-author-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29029-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29029).</sch:assert>
      <sch:assert id="a-3343-29028-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29028).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_order-author-assignedAuthor-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.143'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29030-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29030).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="US-Realm-Date-and-Time-pattern-errors">
    <sch:rule id="US-Realm-Date-and-Time-effectiveTime-errors" context="cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]]              | cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3']]]             | cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2016-09-01']]]">
      <sch:assert id="a-81-10127-e-error" test="string-length(@value)&gt;=8">SHALL be precise to the day (CONF:81-10127).</sch:assert>
    </sch:rule>
    <sch:rule id="US-Realm-Date-and-Time-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author/cda:time                                                             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator/cda:time">
      <sch:assert id="a-81-10127-t-error" test="string-length(@value)&gt;=8">SHALL be precise to the day (CONF:81-10127).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Order-Act-pattern-errors">
    <sch:rule id="Encounter-Order-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28469-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28469).</sch:assert>
      <sch:assert id="a-3343-28470-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28470).</sch:assert>
      <sch:assert id="a-3343-28467-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28467) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.132" (CONF:3343-28471). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28812).</sch:assert>
      <sch:assert id="a-3343-28810-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28810).</sch:assert>
      <sch:assert id="a-3343-28468-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.22'][@extension='2017-08-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28468) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28473).  SHALL contain exactly one [1..1] Encounter Order (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.22:2017-08-01) (CONF:3343-28474).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Order-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.132'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28811-error" test="@code='ENC'">This code SHALL contain exactly one [1..1] @code="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28811).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="US-Realm-Patient-Name-pattern-errors">
    <sch:rule id="US-Realm-Patient-Name-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]/cda:participant/cda:participantRole/cda:playingEntity/cda:name">
      <sch:assert id="a-81-7159-error" test="count(cda:family[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] family (CONF:81-7159).</sch:assert>
      <sch:assert id="a-81-7157-error" test="count(cda:given[@xsi:type='ST']) &gt;=1">SHALL contain at least one [1..*] given (CONF:81-7157).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Diagnostic-Study-Performed-pattern-errors">
    <sch:rule id="Diagnostic-Study-Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27369-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27369).</sch:assert>
      <sch:assert id="a-3343-12950-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12950).</sch:assert>
      <sch:assert id="a-3343-12951-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12951) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.18" (CONF:3343-12952). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27141).</sch:assert>
      <sch:assert id="a-3343-27617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27617).</sch:assert>
      <sch:assert id="a-3343-12956-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-12956).</sch:assert>
      <sch:assert id="a-3343-12958-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-12958).</sch:assert>
      <sch:assert id="a-3343-29135-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:3343-29135).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnostic-Study-Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-12957-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-12957).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnostic-Study-Performed-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-12959-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-12959).</sch:assert>
      <sch:assert id="a-3343-12960-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:3343-12960).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnostic-Study-Performed-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.18'][@extension='2017-08-01']]/cda:value">
      <sch:assert id="a-3343-29139-error" test="@nullFlavor='NA'">This value SHALL contain exactly one [1..1] @nullFlavor="NA" (CONF:3343-29139).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Substance-Administered-Act-pattern-errors">
    <sch:rule id="Substance-Administered-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']]">
      <sch:assert id="a-1098-31500-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31500).</sch:assert>
      <sch:assert id="a-1098-31501-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31501).</sch:assert>
      <sch:assert id="a-1098-31502-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-31502) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.118" (CONF:1098-31503).</sch:assert>
      <sch:assert id="a-1098-31504-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1098-31504).</sch:assert>
      <sch:assert id="a-1098-31506-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31506).</sch:assert>
      <sch:assert id="a-1098-31505-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31505).</sch:assert>
    </sch:rule>
    <sch:rule id="Substance-Administered-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']]/cda:code">
      <sch:assert id="a-1098-31507-error" test="@code='416118004'">This code SHALL contain exactly one [1..1] @code="416118004" Administration (CONF:1098-31507).</sch:assert>
      <sch:assert id="a-1098-31508-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-31508).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Active-pattern-errors">
    <sch:rule id="Medication_Active-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28861-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28861).</sch:assert>
      <sch:assert id="a-3343-28079-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28079).</sch:assert>
      <sch:assert id="a-3343-28858-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-28858) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.41" (CONF:3343-28860). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28654).</sch:assert>
      <sch:assert id="a-3343-28859-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28859).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Active-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.41'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-28655-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28655).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Family_History_Organizer_QDM-pattern-errors">
    <sch:rule id="Family_History_Organizer_QDM-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-14175-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-14175) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.12" (CONF:3343-14176). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26553).</sch:assert>
      <sch:assert id="a-3343-27715-error" test="(count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2017-08-01']]) = 1]) &gt; 0)">SHALL contain at least one [1..*] component (CONF:3343-27715) such that it SHALL contain exactly one [1..1] Family History Observation QDM (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.112:2017-08-01) (CONF:3343-27716).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient_data_section_QDM-pattern-errors">
    <sch:rule id="Patient_data_section_QDM-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-12796-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12796) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.1" (CONF:3343-12797). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28405).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Activity-Act-pattern-errors">
    <sch:rule id="Procedure-Activity-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8289-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8289).</sch:assert>
      <sch:assert id="a-1098-8290-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-8290).</sch:assert>
      <sch:assert id="a-1098-8291-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8291) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.12" (CONF:1098-10519). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32505).</sch:assert>
      <sch:assert id="a-1098-8292-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8292).</sch:assert>
      <sch:assert id="a-1098-8293-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-8293).</sch:assert>
      <sch:assert id="a-1098-8298-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8298).</sch:assert>
      <sch:assert id="a-1098-8299-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-8299).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Act-code-originalText-reference-value-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:code/cda:originalText/cda:reference[@value]">
      <sch:assert id="a-1098-19189-error" test="starts-with(@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1098-19189).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32364-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ProcedureAct statusCode urn:oid:2.16.840.1.113883.11.20.9.22 STATIC 2014-04-23 (CONF:1098-32364).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Act-performer-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer">
      <sch:assert id="a-1098-8302-error" test="count(cda:assignedEntity)=1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1098-8302).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Act-performer-assignedEntity-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1098-8303-error" test="count(cda:id)&gt;=1">This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-8303).</sch:assert>
      <sch:assert id="a-1098-8304-error" test="count(cda:addr)&gt;=1">This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-8304).</sch:assert>
      <sch:assert id="a-1098-8305-error" test="count(cda:telecom)&gt;=1">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-8305).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Act-performer-assignedEntity-representedOrganization-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-1098-8309-error" test="count(cda:addr)&gt;=1">The representedOrganization, if present, SHALL contain at least one [1..*] addr (CONF:1098-8309).</sch:assert>
      <sch:assert id="a-1098-8310-error" test="count(cda:telecom)&gt;=1">The representedOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:1098-8310).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Activity-pattern-errors">
    <sch:rule id="Encounter-Activity-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-8710-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8710).</sch:assert>
      <sch:assert id="a-1198-8711-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8711).</sch:assert>
      <sch:assert id="a-1198-8712-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-8712) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.49" (CONF:1198-26353). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32546).</sch:assert>
      <sch:assert id="a-1198-8713-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1198-8713).</sch:assert>
      <sch:assert id="a-1198-8714-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-8714).</sch:assert>
      <sch:assert id="a-1198-8715-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-8715).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Activity-code-originalText-reference-value-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:code/cda:originalText/cda:reference">
      <sch:assert id="a-1198-15972-error" test="starts-with(@value,'#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1198-15972).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Activity-performer-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:performer">
      <sch:assert id="a-1198-8726-error" test="count(cda:assignedEntity)=1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-8726).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Family_History_Observation_QDM-pattern-errors">
    <sch:rule id="Family_History_Observation_QDM-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27685-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27685).</sch:assert>
      <sch:assert id="a-3343-27686-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-27686).</sch:assert>
      <sch:assert id="a-3343-28057-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28057).</sch:assert>
      <sch:assert id="a-3343-27675-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.112'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-27675) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.112" (CONF:3343-27681). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27682).</sch:assert>
      <sch:assert id="a-3343-27688-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-27688).</sch:assert>
      <sch:assert id="a-3343-28661-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.12'][@extension='2017-08-01'])=1">This template SHALL be contained by a Family History Organizer QDM (V4) (CONF:3343-28661).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reaction-Observation-pattern-errors">
    <sch:rule id="Reaction-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7325-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7325).</sch:assert>
      <sch:assert id="a-1098-7326-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7326).</sch:assert>
      <sch:assert id="a-1098-7323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.9" (CONF:1098-10523). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32504).</sch:assert>
      <sch:assert id="a-1098-7329-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-7329).</sch:assert>
      <sch:assert id="a-1098-16851-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-16851).</sch:assert>
      <sch:assert id="a-1098-7328-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7328).</sch:assert>
      <sch:assert id="a-1098-7335-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1098-7335).</sch:assert>
    </sch:rule>
    <sch:rule id="Reaction-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-31124-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" (CONF:1098-31124).</sch:assert>
      <sch:assert id="a-1098-32169-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-32169).</sch:assert>
    </sch:rule>
    <sch:rule id="Reaction-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-19114-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19114).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Intervention_Performed-pattern-errors">
    <sch:rule id="Intervention_Performed-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27354-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27354).</sch:assert>
      <sch:assert id="a-3343-13590-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13590).</sch:assert>
      <sch:assert id="a-3343-13591-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-13591) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.32" (CONF:3343-13592). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27144).</sch:assert>
      <sch:assert id="a-3343-27633-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-27633).</sch:assert>
      <sch:assert id="a-3343-27362-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-27362).</sch:assert>
      <sch:assert id="a-3343-13611-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-13611).</sch:assert>
    </sch:rule>
    <sch:rule id="Intervention_Performed-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-27363-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-27363).</sch:assert>
    </sch:rule>
    <sch:rule id="Intervention_Performed-effectiveTime-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.32'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-13612-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-13612).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Supply_Request-pattern-errors">
    <sch:rule id="Medication_Supply_Request-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99'][@extension='2014-04-05']]">
      <sch:assert id="a-1140-28373-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1140-28373).</sch:assert>
      <sch:assert id="a-1140-13820-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1140-13820).</sch:assert>
      <sch:assert id="a-1140-13821-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.99'][@extension='2014-04-05']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1140-13821) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.99" (CONF:1140-13822). SHALL contain exactly one [1..1] @extension="2014-04-05" (CONF:1140-28374).</sch:assert>
      <sch:assert id="a-1140-13829-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:1140-13829).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Diagnostic-Study-Order-pattern-errors">
    <sch:rule id="Diagnostic-Study-Order-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27408-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27408).</sch:assert>
      <sch:assert id="a-3343-13411-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13411).</sch:assert>
      <sch:assert id="a-3343-13412-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-13412) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.17" (CONF:3343-13413). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27069).</sch:assert>
      <sch:assert id="a-3343-27615-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27615).</sch:assert>
      <sch:assert id="a-3343-27340-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27340) such that it  SHALL contain exactly one [1..1] time (CONF:3343-29041).  . SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29040).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnostic-Study-Order-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.17'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29042-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29042).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Device-Recommended-pattern-errors">
    <sch:rule id="Device-Recommended-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27722-error" test="@classCode='SPLY'">SHALL contain exactly one [1..1] @classCode="SPLY" Supply (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27722).</sch:assert>
      <sch:assert id="a-3343-12368-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12368).</sch:assert>
      <sch:assert id="a-3343-12369-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12369) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.10" (CONF:3343-12370). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27094).</sch:assert>
      <sch:assert id="a-3343-27719-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27719).</sch:assert>
      <sch:assert id="a-3343-12374-error" test="count(cda:participant[@typeCode='DEV'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-12374) such that it SHALL contain exactly one [1..1] @typeCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12375).SHALL contain exactly one [1..1] participantRole (CONF:3343-12376).</sch:assert>
      <sch:assert id="a-3343-28666-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.131'][@extension='2017-08-01'])=1">This template SHALL be contained by a Device Recommended Act (V2) (CONF:3343-28666).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Recommended-author-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29062-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29062).</sch:assert>
      <sch:assert id="a-3343-29061-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29061).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Recommended-author-assignedAuthor-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29063-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29063).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Recommended-participant-participantRole-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole">
      <sch:assert id="a-3343-12377-error" test="@classCode='MANU'">This participantRole SHALL contain exactly one [1..1] @classCode="MANU" manufactured product, which SHALL be selected from CodeSystem HL7RoleClass (urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12377).</sch:assert>
      <sch:assert id="a-3343-12378-error" test="count(cda:playingDevice)=1">This participantRole SHALL contain exactly one [1..1] playingDevice (CONF:3343-12378).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Recommended-participant-participantRole-playingDevice-errors" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.10'][@extension='2017-08-01']]/cda:participant[@typeCode='DEV']/cda:participantRole[@classCode='MANU']/cda:playingDevice">
      <sch:assert id="a-3343-12379-error" test="@classCode='DEV'">This playingDevice SHALL contain exactly one [1..1] @classCode="DEV" device, which SHALL be selected from CodeSystem HL7ParticipationType (urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12379).</sch:assert>
      <sch:assert id="a-3343-12380-error" test="count(cda:code)=1">This playingDevice SHALL contain exactly one [1..1] code (CONF:3343-12380).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Target-Outcome-pattern-errors">
    <sch:rule id="Target-Outcome-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28033-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28033).</sch:assert>
      <sch:assert id="a-3343-28034-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28034).</sch:assert>
      <sch:assert id="a-3343-28025-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.119'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28025) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.119" (CONF:3343-28028). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28029).</sch:assert>
      <sch:assert id="a-3343-28026-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:3343-28026).</sch:assert>
      <sch:assert id="a-3343-28027-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:3343-28027).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Assessment_performed-pattern-errors">
    <sch:rule id="Assessment_performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28670-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28670).</sch:assert>
      <sch:assert id="a-3343-28669-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28669).</sch:assert>
      <sch:assert id="a-3343-28652-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28652) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.144" (CONF:3343-28660) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28701).</sch:assert>
      <sch:assert id="a-3343-28656-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28656).</sch:assert>
      <sch:assert id="a-3343-28653-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28653).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-28662-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28662).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_performed-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-28986-error" test="count(cda:time)=1">The author, if present, SHALL contain exactly one [1..1] time (CONF:3343-28986).</sch:assert>
      <sch:assert id="a-3343-28985-error" test="count(cda:assignedAuthor)=1">The author, if present, SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-28985).</sch:assert>
    </sch:rule>
    <sch:rule id="Assessment_performed-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.144'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-28987-error" test="count(cda:id) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-28987).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Adverse_Event-pattern-errors">
    <sch:rule id="Adverse_Event-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28773-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28773).</sch:assert>
      <sch:assert id="a-3343-28774-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28774).</sch:assert>
      <sch:assert id="a-3343-28776-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28776).</sch:assert>
      <sch:assert id="a-3343-28751-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28751) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.146" (CONF:3343-28761). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28762).</sch:assert>
      <sch:assert id="a-3343-28775-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-28775).</sch:assert>
      <sch:assert id="a-3343-28752-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28752).</sch:assert>
      <sch:assert id="a-3343-28753-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-28753).</sch:assert>
      <sch:assert id="a-3343-28754-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28754).</sch:assert>
      <sch:assert id="a-3343-28756-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28756).</sch:assert>
      <sch:assert id="a-3343-28755-error" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'][count(cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.24.3.148'][@extension='2017-08-01'])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28755) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28768). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3343-28769). SHALL contain exactly one [1..1] Adverse Event Cause Observation Assertion (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.148:2017-08-01) (CONF:3343-28770).</sch:assert>
    </sch:rule>
    <sch:rule id="Adverse_Event-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28763-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-28763).</sch:assert>
      <sch:assert id="a-3343-28764-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: HL7ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28764).</sch:assert>
    </sch:rule>
    <sch:rule id="Adverse_Event-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-28765-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: HL7ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-28765).</sch:assert>
    </sch:rule>
    <sch:rule id="Adverse_Event-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-28766-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28766).</sch:assert>
    </sch:rule>
    <sch:rule id="Adverse_Event-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:value">
      <sch:assert id="a-3343-28771-error" test="@code='281647001'">This value SHALL contain exactly one [1..1] @code="281647001" Adverse reaction (CONF:3343-28771).</sch:assert>
      <sch:assert id="a-3343-28772-error" test="@codeSystem='2.16.840.1.113883.6.96'">This value SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" SNOMED CT (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-28772).</sch:assert>
    </sch:rule>
    <sch:rule id="Adverse_Event-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-28983-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-28983).</sch:assert>
      <sch:assert id="a-3343-28982-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-28982).</sch:assert>
    </sch:rule>
    <sch:rule id="Adverse_Event-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-28984-error" test="count(cda:id) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-28984).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Immunization_activity-pattern-errors">
    <sch:rule id="Immunization_activity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8826-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8826).</sch:assert>
      <sch:assert id="a-1098-8827-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2014-09-01 (CONF:1098-8827).</sch:assert>
      <sch:assert id="a-1098-8828-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-8828) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.52" (CONF:1098-10498). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32528).</sch:assert>
      <sch:assert id="a-1098-8829-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8829).</sch:assert>
      <sch:assert id="a-1098-8833-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-8833).</sch:assert>
      <sch:assert id="a-1098-8834-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-8834).</sch:assert>
      <sch:assert id="a-1098-8847-error" test="count(cda:consumable)=1">SHALL contain exactly one [1..1] consumable (CONF:1098-8847).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_activity-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32359-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32359).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_activity-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]/cda:consumable">
      <sch:assert id="a-1098-15546-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']])=1">This consumable SHALL contain exactly one [1..1] Immunization Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:1098-15546).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Performed-Act-pattern-errors">
    <sch:rule id="Encounter-Performed-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28477-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28477).</sch:assert>
      <sch:assert id="a-3343-28478-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28478).</sch:assert>
      <sch:assert id="a-3343-28475-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28475) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.133" (CONF:3343-28479). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28809).</sch:assert>
      <sch:assert id="a-3343-28807-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28807).</sch:assert>
      <sch:assert id="a-3343-28476-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.23'][@extension='2017-08-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28476) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28481). SHALL contain exactly one [1..1] Encounter Performed (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.23:2017-08-01) (CONF:3343-28482).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Performed-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.133'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28808-error" test="@code='ENC'">This code SHALL contain exactly one [1..1] @code="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28808).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Dispensed_Act-pattern-errors">
    <sch:rule id="Medication_Dispensed_Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28562-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28562).</sch:assert>
      <sch:assert id="a-3343-28563-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28563).</sch:assert>
      <sch:assert id="a-3343-28558-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-28558) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.139" (CONF:3343-28560). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28907).</sch:assert>
      <sch:assert id="a-3343-28564-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-28564).</sch:assert>
      <sch:assert id="a-3343-28567-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-28567).</sch:assert>
      <sch:assert id="a-3343-28557-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.45'][@extension='2017-08-01']])=1]) = 1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28557) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28561). SHALL contain exactly one [1..1] Medication Dispensed (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.45:2017-08-01) (CONF:3343-28566).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispensed_Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.139'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28568-error" test="@code='SPLY'">This code SHALL contain exactly one [1..1] @code="SPLY" supply (CONF:3343-28568).</sch:assert>
      <sch:assert id="a-3343-28569-error" test="@codeSystem='2.16.840.1.113883.5.6'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.6" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28569).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Deceased-Observation-pattern-errors">
    <sch:rule id="Deceased-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-14851-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14851).</sch:assert>
      <sch:assert id="a-1198-14852-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14852).</sch:assert>
      <sch:assert id="a-1198-14871-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14871) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.79" (CONF:1198-14872) SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32541).</sch:assert>
      <sch:assert id="a-1198-14873-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1198-14873).</sch:assert>
      <sch:assert id="a-1198-14854-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-14854).</sch:assert>
      <sch:assert id="a-1198-14853-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-14853).</sch:assert>
      <sch:assert id="a-1198-14855-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14855).</sch:assert>
      <sch:assert id="a-1198-14857-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:1198-14857).</sch:assert>
    </sch:rule>
    <sch:rule id="Deceased-Observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]/cda:code">
      <sch:assert id="a-1198-19135-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:1198-19135).</sch:assert>
      <sch:assert id="a-1198-32158-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1198-32158).</sch:assert>
    </sch:rule>
    <sch:rule id="Deceased-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]/cda:statusCode">
      <sch:assert id="a-1198-19095-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19095).</sch:assert>
    </sch:rule>
    <sch:rule id="Deceased-Observation-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]/cda:value">
      <sch:assert id="a-1198-15142-error" test="@code='419099009'">This value SHALL contain exactly one [1..1] @code="419099009" Dead (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:1198-15142).</sch:assert>
    </sch:rule>
    <sch:rule id="Deceased-Observation-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79'][@extension='2015-08-01']]/cda:effectiveTime">
      <sch:assert id="a-1198-14874-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-14874).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned_Act-pattern-errors">
    <sch:rule id="Planned_Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8538-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8538).</sch:assert>
      <sch:assert id="a-1098-8539-error" test="@moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.23']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Act/Encounter/Procedure) urn:oid:2.16.840.1.113883.11.20.9.23 STATIC 2011-09-30 (CONF:1098-8539).</sch:assert>
      <sch:assert id="a-1098-30430-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-30430) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.39" (CONF:1098-30431). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32552).</sch:assert>
      <sch:assert id="a-1098-8546-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-8546).</sch:assert>
      <sch:assert id="a-1098-31687-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:1098-31687).</sch:assert>
      <sch:assert id="a-1098-30432-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30432).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32019-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32019).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QDM_based_QRDA_V5-pattern-errors">
    <sch:rule id="QDM_based_QRDA_V5-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-12972-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12972) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.2" (CONF:3343-26943). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28696).</sch:assert>
      <sch:assert id="a-3343-16598-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:3343-16598).</sch:assert>
      <sch:assert id="a-3343-16600-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:3343-16600).</sch:assert>
      <sch:assert id="a-3343-12973-error" test="count(cda:component[count(cda:structuredBody)=1])=1">SHALL contain exactly one [1..1] component (CONF:3343-12973) such that it SHALL contain exactly one [1..1] structuredBody (CONF:3343-17081).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:recordTarget">
      <sch:assert id="a-3343-16856-error" test="count(cda:patientRole)=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:3343-16856).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-recordTarget-patientRole-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:recordTarget/cda:patientRole">
      <sch:assert id="a-3343-27570-error" test="count(cda:patient)=1">This patientRole SHALL contain exactly one [1..1] patient (CONF:3343-27570).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-recordTarget-patientRole-patient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:recordTarget/cda:patientRole/cda:patient">
      <sch:assert id="a-3343-27571-error" test="count(cda:birthTime)=1">This patient SHALL contain exactly one [1..1] birthTime (CONF:3343-27571).</sch:assert>
      <sch:assert id="a-3343-27572-error" test="count(cda:administrativeGenderCode)=1">This patient SHALL contain exactly one [1..1] administrativeGenderCode (CONF:3343-27572).</sch:assert>
      <sch:assert id="a-3343-27573-error" test="count(cda:raceCode)=1">This patient SHALL contain exactly one [1..1] raceCode (CONF:3343-27573).</sch:assert>
      <sch:assert id="a-3343-27574-error" test="count(cda:ethnicGroupCode)=1">This patient SHALL contain exactly one [1..1] ethnicGroupCode (CONF:3343-27574).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:custodian">
      <sch:assert id="a-3343-28239-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:3343-28239).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:custodian/cda:assignedCustodian">
      <sch:assert id="a-3343-28240-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:3343-28240).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:informationRecipient">
      <sch:assert id="a-3343-16704-error" test="count(cda:intendedRecipient)=1">The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:3343-16704).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-informationRecipient-intendedRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:informationRecipient/cda:intendedRecipient">
      <sch:assert id="a-3343-16705-error" test="count(cda:id) &gt; 0">This intendedRecipient SHALL contain at least one [1..*] id (CONF:3343-16705).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:component/cda:structuredBody">
      <sch:assert id="a-3343-17082-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.3']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-17082). This component SHALL contain exactly one [1..1] Measure Section QDM (identifier: urn:oid:2.16.840.1.113883.10.20.24.2.3) (CONF:3343-17083).</sch:assert>
      <sch:assert id="a-3343-17090-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-17090). This component SHALL contain exactly one [1..1] Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.1) (CONF:3343-17092).</sch:assert>
      <sch:assert id="a-3343-17091-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.1'][@extension='2017-08-01']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-17091). This component SHALL contain exactly one [1..1] Patient Data Section QDM (V5) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.2.1:2017-08-01) (CONF:3343-17093).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:documentationOf/cda:serviceEvent">
      <sch:assert id="a-3343-16581-error" test="@classCode='PCPR'">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CONF:3343-16581).</sch:assert>
      <sch:assert id="a-3343-16583-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:3343-16583).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer">
      <sch:assert id="a-3343-16584-error" test="@typeCode='PRF'">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CONF:3343-16584).</sch:assert>
      <sch:assert id="a-3343-16586-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:3343-16586).</sch:assert>
    </sch:rule>
    <sch:rule id="QDM_based_QRDA_V5-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-3343-16591-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:3343-16591).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Immunization_refusal_reason-pattern-errors">
    <sch:rule id="Immunization_refusal_reason-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.53']]">
      <sch:assert id="a-81-8991-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-8991).</sch:assert>
      <sch:assert id="a-81-8992-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-8992).</sch:assert>
      <sch:assert id="a-81-8993-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.53'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:81-8993) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.53" (CONF:81-10500).</sch:assert>
      <sch:assert id="a-81-8994-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:81-8994).</sch:assert>
      <sch:assert id="a-81-8995-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet No Immunization Reason Value Set urn:oid:2.16.840.1.113883.1.11.19717 DYNAMIC (CONF:81-8995).</sch:assert>
      <sch:assert id="a-81-8996-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-8996).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_refusal_reason-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.53']]/cda:statusCode">
      <sch:assert id="a-81-19104-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-19104).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Symptom-pattern-errors">
    <sch:rule id="Symptom-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28524-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28524).</sch:assert>
      <sch:assert id="a-3343-28525-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28525).</sch:assert>
      <sch:assert id="a-3343-28526-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28526).</sch:assert>
      <sch:assert id="a-3343-28514-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28514) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.136" (CONF:3343-28518). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28855).</sch:assert>
      <sch:assert id="a-3343-28515-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28515).</sch:assert>
      <sch:assert id="a-3343-28854-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28854).</sch:assert>
      <sch:assert id="a-3343-28516-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28516).</sch:assert>
      <sch:assert id="a-3343-28667-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.138'][@extension='2017-08-01'])=1">This template SHALL be contained by a Symptom Concern Act (V3) (CONF:3343-28667).</sch:assert>
    </sch:rule>
    <sch:rule id="Symptom-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28520-error" test="@code='75325-1'">This code SHALL contain exactly one [1..1] @code="75325-1" Symptom (CONF:3343-28520).</sch:assert>
      <sch:assert id="a-3343-28521-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-28521).</sch:assert>
    </sch:rule>
    <sch:rule id="Symptom-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.136'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-28856-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28856).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference-pattern-errors">
    <sch:rule id="Measure_Reference-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:assert id="a-67-12979-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12979).</sch:assert>
      <sch:assert id="a-67-12980-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12980).</sch:assert>
      <sch:assert id="a-67-19532-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'][not(@extension)]) = 1">SHALL contain exactly one [1..1] templateId (CONF:67-19532) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:67-19533).</sch:assert>
      <sch:assert id="a-67-26992-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:67-26992).</sch:assert>
      <sch:assert id="a-67-12981-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12981).</sch:assert>
      <sch:assert id="a-67-12982-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:67-12982) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-12983). SHALL contain exactly one [1..1] externalDocument (CONF:67-12984).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference-externalDocument-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-67-19534-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:67-19534).</sch:assert>
      <sch:assert id="a-67-12985-error" test="count(cda:id[@root]) &gt; 0">This externalDocument SHALL contain at least one [1..*] id (CONF:67-12985) such that it SHALL contain exactly one [1..1] @root (CONF:67-12986). This ID references an ID of the Quality Measure (CONF:67-27008).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_I-pattern-errors">
    <sch:rule id="QRDA_Category_I_V3-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-12910-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-12910) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.1.1" (CONF:3343-14613). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27005)</sch:assert>
      <sch:assert id="a-3343-12911-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-12911).</sch:assert>
      <sch:assert id="a-3343-12912-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:3343-12912).</sch:assert>
      <sch:assert id="a-3343-12913-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:3343-12913).</sch:assert>
      <sch:assert id="a-3343-12914-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:3343-12914).</sch:assert>
      <sch:assert id="a-3343-12918-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:3343-12918).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_I_V3-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28137-error" test="@code='55182-0'">This code SHALL contain exactly one [1..1] @code="55182-0" Quality Measure Report (CONF:3343-28137).</sch:assert>
      <sch:assert id="a-3343-28138-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-28138).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_I_V3-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:recordTarget">
      <sch:assert id="a-3343-28387-error" test="count(cda:patientRole)=1">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:3343-28387).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_I_V3-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:custodian">
      <sch:assert id="a-3343-12915-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:3343-12915).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_I_V3-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:custodian/cda:assignedCustodian">
      <sch:assert id="a-3343-12916-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:3343-12916).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_I_V3-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:component">
      <sch:assert id="a-3343-12919-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:3343-12919).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_I_V3-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.1'][@extension='2017-08-01']]/cda:component/cda:structuredBody">
      <sch:assert id="a-3343-12920-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-12920) such that it SHALL contain exactly one [1..1] Measure Section (identifier: urn:oid:2.16.840.1.113883.10.20.24.2.2) (CONF:3343-17078).</sch:assert>
      <sch:assert id="a-3343-12923-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-12923) such that it SHALL contain exactly one [1..1] Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.1) (CONF:3343-17079).</sch:assert>
      <sch:assert id="a-3343-12924-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.4']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:3343-12924) such that it SHALL contain exactly one [1..1] Patient Data Section (identifier: urn:oid:2.16.840.1.113883.10.20.17.2.4) (CONF:3343-17080).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Device-Order-Act-pattern-errors">
    <sch:rule id="Device-Order-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28444-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28444).</sch:assert>
      <sch:assert id="a-3343-28445-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-28445).</sch:assert>
      <sch:assert id="a-3343-28441-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28441) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.130" (CONF:3343-28447).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28918).</sch:assert>
      <sch:assert id="a-3343-28442-error" test="count(cda:code) =1">SHALL contain exactly one [1..1] code (CONF:3343-28442).</sch:assert>
      <sch:assert id="a-3343-28443-error" test="count(cda:entryRelationship[@typeCode='SUBJ'] [count(cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.9' and @extension = '2017-08-01']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:3343-28443) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28450). SHALL contain exactly one [1..1] Device Order (V4) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.9:2017-08-01) (CONF:3343-28451).</sch:assert>
    </sch:rule>
    <sch:rule id="Device-Order-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.130'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28448-error" test="@code='SPLY'">This code SHALL contain exactly one [1..1] @code="SPLY" Supply (CONF:3343-28448).</sch:assert>
      <sch:assert id="a-3343-28449-error" test="@codeSystem">This code SHALL contain exactly one [1..1] @codeSystem (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28449).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Communication-From-Patient-To-Provider-pattern-errors">
    <sch:rule id="Communication-From-Patient-To-Provider-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-11484-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-11484).</sch:assert>
      <sch:assert id="a-3343-11485-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11485).</sch:assert>
      <sch:assert id="a-3343-11486-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11486) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.2" (CONF:3343-11487). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27275).</sch:assert>
      <sch:assert id="a-3343-11619-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:3343-11619).</sch:assert>
      <sch:assert id="a-3343-26946-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-26946).</sch:assert>
      <sch:assert id="a-3343-11620-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-11620).</sch:assert>
      <sch:assert id="a-3343-28919-error" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]) = 1">SHALL contain exactly one [1..1] Author (identifier: urn:hl7ii:2.16.840.1.113883.10.20.24.3.155:2017-08-01) (CONF:3343-28919).</sch:assert>
      <sch:assert id="a-3343-11835-error" test="count(cda:participant[@typeCode='AUT'][count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11835) such that it SHALL contain exactly one [1..1] @typeCode="AUT" author (originator) (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-12099). SHALL contain exactly one [1..1] participantRole (CONF:3343-11836).</sch:assert>
      <sch:assert id="a-3343-11631-error" test="count(cda:participant[@typeCode='IRCP'] [count(cda:participantRole)=1])=1">SHALL contain exactly one [1..1] participant (CONF:3343-11631) such that it SHALL contain exactly one [1..1] @typeCode="IRCP" information recipient (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90) (CONF:3343-11632). SHALL contain exactly one [1..1] participantRole (CONF:3343-11633).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Patient-To-Provider-participant-participantRole-recipient-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole">
      <sch:assert id="a-3343-12098-error" test="@classCode='ASSIGNED'">This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" assigned entity (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12098).</sch:assert>
      <sch:assert id="a-3343-11651-error" test="count(cda:code)=1">This participantRole SHALL contain exactly one [1..1] code (CONF:3343-11651).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Patient-To-Provider-participant-participantRole-recipient-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]/cda:participant[@typeCode='IRCP']/cda:participantRole/cda:code">
      <sch:assert id="a-3343-27272-error" test="@code='158965000'">This code SHALL contain exactly one [1..1] @code="158965000" Medical practitioner (CONF:3343-27272).</sch:assert>
      <sch:assert id="a-3343-26945-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-26945).</sch:assert>
    </sch:rule>
    <sch:rule id="Communication-From-Patient-To-Provider-participant-participantRole-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.2'][@extension='2017-08-01']]/cda:participant[@typeCode='AUT']/cda:participantRole">
      <sch:assert id="a-3343-12100-error" test="@classCode='PAT'">This participantRole SHALL contain exactly one [1..1] @classCode="PAT" patient (CodeSystem: HL7RoleClass urn:oid:2.16.840.1.113883.5.110) (CONF:3343-12100).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="US-Realm-Address-pattern-errors">
    <sch:rule id="US-Realm-Address-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3']]/cda:recordTarget/cda:patientRole/cda:addr             | cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]/cda:performer/cda:assignedEntity/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author/cda:assignedAuthor/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:dataEnterer/cda:assignedEntity/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator/cda:assignedEntity/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:addr">
      <sch:assert id="a-81-7292-error" test="count(cda:city)=1">SHALL contain exactly one [1..1] city (CONF:81-7292).</sch:assert>
      <sch:assert id="a-81-7291-error" test="count(cda:streetAddressLine) &gt; 0 and count(cda:streetAddressLine) &lt; 5">SHALL contain at least one and not more than 4 [1..4] streetAddressLine (CONF:81-7291).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting-parameters-section-pattern-errors">
    <sch:rule id="Reporting-parameters-section-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
      <sch:assert id="a-23-14611-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:23-14611) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.1" (CONF:23-14612).</sch:assert>
      <sch:assert id="a-23-18191-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:23-18191).</sch:assert>
      <sch:assert id="a-23-4142-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='reporting parameters'])=1">SHALL contain exactly one [1..1] title="Reporting Parameters" (CONF:23-4142).</sch:assert>
      <sch:assert id="a-23-4143-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:23-4143).</sch:assert>
      <sch:assert id="a-23-3277-error" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:23-3277) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:23-3278). SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:23-17496).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting-parameters-section-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]/cda:code">
      <sch:assert id="a-23-19229-error" test="@code='55187-9'">This code SHALL contain exactly one [1..1] @code="55187-9" Reporting Parameters (CONF:23-19229).</sch:assert>
      <sch:assert id="a-23-26552-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:23-26552).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Goal_Observation-pattern-errors">
    <sch:rule id="Goal_Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]">
      <sch:assert id="a-1098-30418-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30418).</sch:assert>
      <sch:assert id="a-1098-30419-error" test="@moodCode='GOL'">SHALL contain exactly one [1..1] @moodCode="GOL" Goal (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-30419).</sch:assert>
      <sch:assert id="a-1098-8583-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121'][not(@extension)]) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-8583) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.121" (CONF:1098-10512).</sch:assert>
      <sch:assert id="a-1098-32332-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-32332).</sch:assert>
      <sch:assert id="a-1098-30784-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30784).</sch:assert>
      <sch:assert id="a-1098-32333-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32333).</sch:assert>
    </sch:rule>
    <sch:rule id="Goal_Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]/cda:statusCode">
      <sch:assert id="a-1098-32334-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32334).</sch:assert>
    </sch:rule>
    <sch:rule id="Goal_Observation-may-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]/cda:reference">
      <sch:assert id="a-1098-32755-error" test="@typeCode='REFR'">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-32755).</sch:assert>
      <sch:assert id="a-1098-32756-error" test="count(cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115'][@extension='2014-06-09']])=1">The reference, if present, SHALL contain exactly one [1..1] External Document Reference (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.115:2014-06-09) (CONF:1098-32756).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned_Coverage-pattern-errors">
    <sch:rule id="Planned_Coverage-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]">
      <sch:assert id="a-1098-31945-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" act (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-31945).</sch:assert>
      <sch:assert id="a-1098-31946-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31946).</sch:assert>
      <sch:assert id="a-1098-31947-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129'][not(@extension)]) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-31947) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.129" (CONF:1098-31948).</sch:assert>
      <sch:assert id="a-1098-31950-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-31950).</sch:assert>
      <sch:assert id="a-1098-31951-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:1098-31951).</sch:assert>
      <sch:assert id="a-1098-31954-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31954).</sch:assert>
      <sch:assert id="a-1098-31967-error" test="count(cda:entryRelationship[@typeCode='COMP'][count(cda:act)=1]) = 1">SHALL contain exactly one [1..1] entryRelationship (CONF:1098-31967) such that it SHALL contain exactly one [1..1] @typeCode="COMP" has component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31968). SHALL contain exactly one [1..1] act (CONF:1098-31969).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Coverage-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:code">
      <sch:assert id="a-1098-31952-error" test="@code='48768-6'">This code SHALL contain exactly one [1..1] @code="48768-6" Payment Sources (CONF:1098-31952).</sch:assert>
      <sch:assert id="a-1098-31953-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31953).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Coverage-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:statusCode">
      <sch:assert id="a-1098-31955-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:1098-31955).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Coverage-act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:entryRelationship/cda:act">
      <sch:assert id="a-1098-31970-error" test="@classCode='ACT'">This act SHALL contain exactly one [1..1] @classCode="ACT" ACT (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31970).</sch:assert>
      <sch:assert id="a-1098-31971-error" test="@moodCode='INT'">This act SHALL contain exactly one [1..1] @moodCode="INT" intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31971).</sch:assert>
      <sch:assert id="a-1098-31972-error" test="count(cda:id) &gt; 0">This act SHALL contain at least one [1..*] id (CONF:1098-31972).</sch:assert>
      <sch:assert id="a-1098-31973-error" test="count(cda:code) = 1">This act SHALL contain exactly one [1..1] code, which SHALL be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:1098-31973).</sch:assert>
      <sch:assert id="a-1098-31974-error" test="count(cda:statusCode) = 1">This act SHALL contain exactly one [1..1] statusCode (CONF:1098-31974).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Coverage-act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.129']]/cda:entryRelationship/cda:act/cda:statusCode">
      <sch:assert id="a-1098-31975-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-31975).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="External-Document-Reference-pattern-errors">
    <sch:rule id="External-Document-Reference-errors" context="cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-31931-error" test="@classCode='DOCCLIN'">encounter</sch:assert>
      <sch:assert id="a-1098-31932-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31932).</sch:assert>
      <sch:assert id="a-1098-32748-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-32748) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.115" (CONF:1098-32750).SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32749).</sch:assert>
      <sch:assert id="a-1098-32751-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:1098-32751).</sch:assert>
      <sch:assert id="a-1098-31933-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31933).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Physical_Exam_Performed-pattern-errors">
    <sch:rule id="Physical_Exam_Performed-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27559-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27559).</sch:assert>
      <sch:assert id="a-3343-12643-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12643).</sch:assert>
      <sch:assert id="a-3343-12644-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12644) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.59" (CONF:3343-12645). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27135).</sch:assert>
      <sch:assert id="a-3343-27651-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-27651).</sch:assert>
      <sch:assert id="a-3343-12649-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:3343-12649).</sch:assert>
      <sch:assert id="a-3343-12651-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-12651).</sch:assert>
    </sch:rule>
    <sch:rule id="Physical_Exam_Performed-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-12652-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-12652).</sch:assert>
      <sch:assert id="a-3343-12653-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:3343-12653).</sch:assert>
    </sch:rule>
    <sch:rule id="Physical_Exam_Performed-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.59'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-12650-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-12650).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Recommended-pattern-errors">
    <sch:rule id="Encounter-Recommended-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27549-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" Encounter (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27549).</sch:assert>
      <sch:assert id="a-3343-11911-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11911).</sch:assert>
      <sch:assert id="a-3343-11912-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.24" (CONF:3343-11913).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27066).</sch:assert>
      <sch:assert id="a-3343-11915-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-11915).</sch:assert>
      <sch:assert id="a-3343-27347-error" test="count(cda:author)=1">SHALL contain exactly one [1..1] author (CONF:3343-27347).</sch:assert>
      <sch:assert id="a-3343-28813-error" test="count(../../cda:templateId[@root='2.16.840.1.113883.10.20.24.3.134'][@extension='2017-08-01'])=1">This template SHALL be contained by an Encounter Recommended Act (V2) (CONF:3343-28813).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Recommended-author-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29026-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29026).</sch:assert>
      <sch:assert id="a-3343-29025-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29025).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Recommended-author-assignedAuthor-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.24'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29027-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29027).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient_care_experience-pattern-errors">
    <sch:rule id="Patient_care_experience-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-12464-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" observation, which SHALL be selected from CodeSystem HL7ActClass (urn:oid:2.16.840.1.113883.5.6) (CONF:3343-12464).</sch:assert>
      <sch:assert id="a-3343-12465-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event, which SHALL be selected from CodeSystem ActMood (urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-12465).</sch:assert>
      <sch:assert id="a-3343-28085-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28085)</sch:assert>
      <sch:assert id="a-3343-12466-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-12466) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.48" (CONF:3343-12467). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27290).</sch:assert>
      <sch:assert id="a-3343-12469-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-12469).</sch:assert>
      <sch:assert id="a-3343-12470-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-12470).</sch:assert>
      <sch:assert id="a-3343-12471-error" test="count(cda:statusCode[@code='completed']) = 1">SHALL contain exactly one [1..1] statusCode="completed", which SHALL be selected from CodeSystem ActStatus (urn:oid:2.16.840.1.113883.5.14) (CONF:3343-12471).</sch:assert>
      <sch:assert id="a-3343-13038-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-13038).</sch:assert>
      <sch:assert id="a-3343-28932-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-28932).</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_care_experience-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-13037-error" test="@code='77218-6'">This code SHALL contain exactly one [1..1] @code="77218-6" Patient satisfaction with healthcare delivery (CONF:3343-13037).</sch:assert>
      <sch:assert id="a-3343-27555-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:3343-27555).</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_care_experience-author-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29014-error" test="count(cda:time) = 1">This author SHALL contain exactly one [1..1] time (CONF:3343-29014).</sch:assert>
      <sch:assert id="a-3343-29013-error" test="count(cda:assignedAuthor) = 1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29013)</sch:assert>
    </sch:rule>
    <sch:rule id="Patient_care_experience-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.48'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29015-error" test="count(cda:id) &gt;= 1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29015).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Laboratory_Test_Recommended-pattern-errors">
    <sch:rule id="Laboratory_Test_Recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27416-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27416).</sch:assert>
      <sch:assert id="a-3343-11793-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11793).</sch:assert>
      <sch:assert id="a-3343-11794-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-11794) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.39" (CONF:3343-11795).  SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27077).</sch:assert>
      <sch:assert id="a-3343-27639-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-27639).</sch:assert>
      <sch:assert id="a-3343-27350-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27350) such that it SHALL contain exactly one [1..1] time (CONF:3343-29047). SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29046).</sch:assert>
    </sch:rule>
    <sch:rule id="Laboratory_Test_Recommended-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.39'][@extension='2017-08-01']]/cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]/cda:assignedAuthor">
      <sch:assert id="a-3343-29048-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29048).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Principal-Diagnosis-pattern-errors">
    <sch:rule id="Principal-Diagnosis-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.152'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-29004-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-29004).</sch:assert>
      <sch:assert id="a-3343-29005-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-29005).</sch:assert>
      <sch:assert id="a-3343-29006-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-29006).</sch:assert>
      <sch:assert id="a-3343-28998-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.152'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28998) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.152" (CONF:3343-29001). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-29002).</sch:assert>
      <sch:assert id="a-3343-28997-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28997).</sch:assert>
      <sch:assert id="a-3343-29003-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-29003).</sch:assert>
    </sch:rule>
    <sch:rule id="Principal-Diagnosis-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.152'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28999-error" test="@code='8319008'">This code SHALL contain exactly one [1..1] @code="8319008" Principal Diagnosis (CONF:3343-28999).</sch:assert>
      <sch:assert id="a-3343-29000-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:3343-29000).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Entry-Reference-pattern-errors">
    <sch:rule id="Entry-Reference-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122']]">
      <sch:assert id="a-1098-31485-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-31485).</sch:assert>
      <sch:assert id="a-1098-31486-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Intent (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-31486</sch:assert>
      <sch:assert id="a-1098-31487-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-31487) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.122" (CONF:1098-31488).</sch:assert>
      <sch:assert id="a-1098-31489-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1098-31489).</sch:assert>
      <sch:assert id="a-1098-31490-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-31490).</sch:assert>
      <sch:assert id="a-1098-31498-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] code (CONF:1098-31498).</sch:assert>
    </sch:rule>
    <sch:rule id="Entry-Reference-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.122']]/cda:code">
      <sch:assert id="a-1098-31491-error" test="@nullFlavor='NP'">This code SHALL contain exactly one [1..1] @nullFlavor="NP" Not Present (CodeSystem: HL7NullFlavor urn:oid:2.16.840.1.113883.5.1008) (CONF:1098-31491).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Indication-pattern-errors">
    <sch:rule id="Indication-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7480-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7480).</sch:assert>
      <sch:assert id="a-1098-7481-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1098-7481).</sch:assert>
      <sch:assert id="a-1098-7482-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-7482) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.19" (CONF:1098-10502). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32570).</sch:assert>
      <sch:assert id="a-1098-7483-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7483).</sch:assert>
      <sch:assert id="a-1098-31229-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which MAY be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2014-09-02 (CONF:1098-31229).</sch:assert>
      <sch:assert id="a-1098-7487-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7487).</sch:assert>
    </sch:rule>
    <sch:rule id="Indication-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-19105-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1098-19105).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Diagnosis-pattern-errors">
    <sch:rule id="Encounter-Diagnosis-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-14889-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-14889).</sch:assert>
      <sch:assert id="a-1198-14890-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-14890).</sch:assert>
      <sch:assert id="a-1198-14895-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-14895) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.80" (CONF:1198-14896). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32542).</sch:assert>
      <sch:assert id="a-1198-19182-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-19182).</sch:assert>
      <sch:assert id="a-1198-14892-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']])=1])&gt;0">SHALL contain at least one [1..*] entryRelationship (CONF:1198-14892) such that it  SHALL contain exactly one [1..1] @typeCode="SUBJ" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14893). SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-14898).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Diagnosis-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.80'][@extension='2015-08-01']]/cda:code">
      <sch:assert id="a-1198-19183-error" test="@code='29308-4'">This code SHALL contain exactly one [1..1] @code="29308-4" Diagnosis (CONF:1198-19183).</sch:assert>
      <sch:assert id="a-1198-32160-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32160).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="US_Realm-pattern-errors">
    <sch:rule id="US_Realm-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-5252-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-5252) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.1.1" (CONF:1198-10036). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32503).</sch:assert>
      <sch:assert id="a-1198-16791-error" test="count(cda:realmCode[@code='US'])=1">SHALL contain exactly one [1..1] realmCode="US" (CONF:1198-16791)</sch:assert>
      <sch:assert id="a-1198-5361-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:1198-5361).</sch:assert>
      <sch:assert id="a-1198-5363-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:1198-5363).</sch:assert>
      <sch:assert id="a-1198-5253-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1198-5253).</sch:assert>
      <sch:assert id="a-1198-5254-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:1198-5254).</sch:assert>
      <sch:assert id="a-1198-5256-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5256).</sch:assert>
      <sch:assert id="a-1198-5259-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode (CONF:1198-5259).</sch:assert>
      <sch:assert id="a-1198-5372-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:1198-5372).</sch:assert>
      <sch:assert id="a-1198-5266-error" test="count(cda:recordTarget) &gt; 0">SHALL contain at least one [1..*] recordTarget (CONF:1198-5266).</sch:assert>
      <sch:assert id="a-1198-5444-error" test="count(cda:author) &gt; 0">SHALL contain at least one [1..*] author (CONF:1198-5444).</sch:assert>
      <sch:assert id="a-1198-5519-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:1198-5519).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:typeId">
      <sch:assert id="a-1198-5250-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:1198-5250).</sch:assert>
      <sch:assert id="a-1198-5251-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:1198-5251).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-setId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:setId">
      <sch:assert id="a-1198-6380-error" test="count(../cda:versionNumber)=1">If setId is present versionNumber SHALL be present (CONF:1198-6380).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-versionNumber-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:versionNumber">
      <sch:assert id="a-1198-6387-error" test="count(../cda:setId)=1">If versionNumber is present setId SHALL be present (CONF:1198-6387).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget">
      <sch:assert id="a-1198-5267-error" test="count(cda:patientRole)=1">Such recordTargets SHALL contain exactly one [1..1] patientRole (CONF:1198-5267).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole">
      <sch:assert id="a-1198-5268-error" test="count(cda:id) &gt; 0">This patientRole SHALL contain at least one [1..*] id (CONF:1198-5268).</sch:assert>
      <sch:assert id="a-1198-5271-error" test="count(cda:addr) &gt; 0">This patientRole SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5271).</sch:assert>
      <sch:assert id="a-1198-5280-error" test="count(cda:telecom) &gt; 0">This patientRole SHALL contain at least one [1..*] telecom (CONF:1198-5280).</sch:assert>
      <sch:assert id="a-1198-5283-error" test="count(cda:patient)=1">This patientRole SHALL contain exactly one [1..1] patient (CONF:1198-5283).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient">
      <sch:assert id="a-1198-5284-error" test="count(cda:name)&gt; 0">This patient SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5284).</sch:assert>
      <sch:assert id="a-1198-6394-error" test="count(cda:administrativeGenderCode)=1">This patient SHALL contain exactly one [1..1] administrativeGenderCode, which SHALL be selected from ValueSet Administrative Gender (HL7 V3) urn:oid:2.16.840.1.113883.1.11.1 DYNAMIC (CONF:1198-6394).</sch:assert>
      <sch:assert id="a-1198-5298-error" test="count(cda:birthTime)=1">This patient SHALL contain exactly one [1..1] birthTime (CONF:1198-5298).</sch:assert>
      <sch:assert id="a-1198-5322-error" test="count(cda:raceCode)=1">This patient SHALL contain exactly one [1..1] raceCode, which SHALL be selected from ValueSet Race Category Excluding Nulls urn:oid:2.16.840.1.113883.3.2074.1.1.3 DYNAMIC (CONF:1198-5322).</sch:assert>
      <sch:assert id="a-1198-5323-error" test="count(cda:ethnicGroupCode)=1">This patient SHALL contain exactly one [1..1] ethnicGroupCode, which SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:1198-5323).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthTime-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime">
      <sch:assert id="a-1198-5299-error" test="string-length(@value) &gt;= 4">SHALL be precise to year (CONF:1198-5299).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-raceCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/sdtc:raceCode">
      <sch:assert id="a-1198-31347-error" test="count(../cda:raceCode)=1">If sdtc:raceCode is present, then the patient SHALL contain [1..1] raceCode (CONF:1198-31347).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-guardian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian">
      <sch:assert id="a-1198-5385-error" test="count(cda:guardianPerson)=1">The guardian, if present, SHALL contain exactly one [1..1] guardianPerson (CONF:1198-5385).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-guardian-guardianPerson-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:guardianPerson">
      <sch:assert id="a-1198-5386-error" test="count(cda:name) &gt; 0">This guardianPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5386).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthplace-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace">
      <sch:assert id="a-1198-5396-error" test="count(cda:place)=1">The birthplace, if present, SHALL contain exactly one [1..1] place (CONF:1198-5396).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthplace-place-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place">
      <sch:assert id="a-1198-5397-error" test="count(cda:addr)=1">This place SHALL contain exactly one [1..1] addr (CONF:1198-5397).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-languageCommunication-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication">
      <sch:assert id="a-1198-5407-error" test="count(cda:languageCode)=1">The languageCommunication, if present, SHALL contain exactly one [1..1] languageCode, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:1198-5407).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-providerOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:providerOrganization">
      <sch:assert id="a-1198-5417-error" test="count(cda:id) &gt; 0">The providerOrganization, if present, SHALL contain at least one [1..*] id (CONF:1198-5417).</sch:assert>
      <sch:assert id="a-1198-5419-error" test="count(cda:name) &gt; 0">The providerOrganization, if present, SHALL contain at least one [1..*] name (CONF:1198-5419).</sch:assert>
      <sch:assert id="a-1198-5420-error" test="count(cda:telecom) &gt; 0">The providerOrganization, if present, SHALL contain at least one [1..*] telecom (CONF:1198-5420).</sch:assert>
      <sch:assert id="a-1198-5422-error" test="count(cda:addr) &gt; 0">The providerOrganization, if present, SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5422).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-author-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author">
      <sch:assert id="a-1198-5445-error" test="count(cda:time)=1">Such authors SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5445).</sch:assert>
      <sch:assert id="a-1198-5448-error" test="count(cda:assignedAuthor)=1">Such authors SHALL contain exactly one [1..1] assignedAuthor (CONF:1198-5448).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-author-assignedAuthor-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-1198-5449-error" test="count(cda:id) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] id (CONF:1198-5449).</sch:assert>
      <sch:assert id="a-1198-5452-error" test="count(cda:addr) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5452).</sch:assert>
      <sch:assert id="a-1198-5428-error" test="count(cda:telecom) &gt; 0">This assignedAuthor SHALL contain at least one [1..*] telecom (CONF:1198-5428).</sch:assert>
      <sch:assert id="a-1198-16790-error" test="count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:1198-16790).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-author-assignedAuthor-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:code">
      <sch:assert id="a-1198-16788-error" test="@code">The code, if present, SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-16788).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-author-assignedAuthor-assignedPerson-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:assignedPerson">
      <sch:assert id="a-1198-16789-error" test="count(cda:name) &gt; 0">The assignedPerson, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-16789).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-author-assignedAuthor-assignedAuthoringDevice-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice">
      <sch:assert id="a-1198-16784-error" test="count(cda:manufacturerModelName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] manufacturerModelName (CONF:1198-16784).</sch:assert>
      <sch:assert id="a-1198-16785-error" test="count(cda:softwareName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:1198-16785).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-dataEnterer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer">
      <sch:assert id="a-1198-5442-error" test="count(cda:assignedEntity)=1">The dataEnterer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-5442).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-dataEnterer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer/cda:assignedEntity">
      <sch:assert id="a-1198-5443-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-5443).</sch:assert>
      <sch:assert id="a-1198-5460-error" test="count(cda:addr) &gt; 0">This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5460).</sch:assert>
      <sch:assert id="a-1198-5466-error" test="count(cda:telecom) &gt; 0">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1198-5466).</sch:assert>
      <sch:assert id="a-1198-5469-error" test="count(cda:assignedPerson)=1">This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:1198-5469).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-dataEnterer-assignedEntity-assignedPerson-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer/cda:assignedEntity/cda:assignedPerson">
      <sch:assert id="a-1198-5470-error" test="count(cda:name) &gt; 0">This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5470).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian">
      <sch:assert id="a-1198-5520-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:1198-5520).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian/cda:assignedCustodian">
      <sch:assert id="a-1198-5521-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:1198-5521).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-1198-5522-error" test="count(cda:id) &gt; 0">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:1198-5522).</sch:assert>
      <sch:assert id="a-1198-5524-error" test="count(cda:name)=1">This representedCustodianOrganization SHALL contain exactly one [1..1] name (CONF:1198-5524).</sch:assert>
      <sch:assert id="a-1198-5525-error" test="count(cda:telecom)=1">This representedCustodianOrganization SHALL contain exactly one [1..1] telecom (CONF:1198-5525).</sch:assert>
      <sch:assert id="a-1198-5559-error" test="count(cda:addr)=1">This representedCustodianOrganization SHALL contain exactly one [1..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5559).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:informationRecipient">
      <sch:assert id="a-1198-5566-error" test="count(cda:intendedRecipient)=1">The informationRecipient, if present, SHALL contain exactly one [1..1] intendedRecipient (CONF:1198-5566).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-informationRecipient-intendedRecipient-informationRecipient-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:informationRecipient/cda:intendedRecipient/cda:informationRecipient">
      <sch:assert id="a-1198-5568-error" test="count(cda:name) &gt; 0">The informationRecipient, if present, SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5568).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-informationRecipient-intendedRecipient-receivedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization">
      <sch:assert id="a-1198-5578-error" test="count(cda:name)=1">The receivedOrganization, if present, SHALL contain exactly one [1..1] name (CONF:1198-5578).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-legalAuthenticator-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator">
      <sch:assert id="a-1198-5580-error" test="count(cda:time)=1">The legalAuthenticator, if present, SHALL contain exactly one [1..1] US Realm Date and Time (DTM.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.4) (CONF:1198-5580).</sch:assert>
      <sch:assert id="a-1198-5583-error" test="count(cda:signatureCode)=1">The legalAuthenticator, if present, SHALL contain exactly one [1..1] signatureCode (CONF:1198-5583).</sch:assert>
      <sch:assert id="a-1198-5585-error" test="count(cda:assignedEntity)=1">The legalAuthenticator, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-5585).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-legalAuthenticator-signatureCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator/cda:signatureCode">
      <sch:assert id="a-1198-5584-error" test="@code='S'">This signatureCode SHALL contain exactly one [1..1] @code="S" (CodeSystem: Participationsignature urn:oid:2.16.840.1.113883.5.89 STATIC) (CONF:1198-5584).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-legalAuthenticator-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator/cda:assignedEntity">
      <sch:assert id="a-1198-5586-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-5586).</sch:assert>
      <sch:assert id="a-1198-5589-error" test="count(cda:addr) &gt; 0">This assignedEntity SHALL contain at least one [1..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5589).</sch:assert>
      <sch:assert id="a-1198-5595-error" test="count(cda:telecom) &gt; 0">This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1198-5595).</sch:assert>
      <sch:assert id="a-1198-5597-error" test="count(cda:assignedPerson)=1">This assignedEntity SHALL contain exactly one [1..1] assignedPerson (CONF:1198-5597).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-legalAuthenticator-assignedEntity-assignedPerson-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:assignedPerson">
      <sch:assert id="a-1198-5598-error" test="count(cda:name) &gt; 0">This assignedPerson SHALL contain at least one [1..*] US Realm Person Name (PN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1.1) (CONF:1198-5598).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-inFulfillmentOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:inFulfillmentOf">
      <sch:assert id="a-1198-9953-error" test="count(cda:order)=1">The inFulfillmentOf, if present, SHALL contain exactly one [1..1] order (CONF:1198-9953).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-inFulfillmentOf-order-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:inFulfillmentOf/cda:order">
      <sch:assert id="a-1198-9954-error" test="count(cda:id) &gt; 0">This order SHALL contain at least one [1..*] id (CONF:1198-9954).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf">
      <sch:assert id="a-1198-14836-error" test="count(cda:serviceEvent)=1">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:1198-14836).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent">
      <sch:assert id="a-1198-14837-error" test="count(cda:effectiveTime)=1">This serviceEvent SHALL contain exactly one [1..1] effectiveTime (CONF:1198-14837).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-serviceEvent-effectiveTime-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:effectiveTime">
      <sch:assert id="a-1198-14838-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:1198-14838).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer">
      <sch:assert id="a-1198-14840-error" test="@typeCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.19601']/voc:code/@value">The performer, if present, SHALL contain exactly one [1..1] @typeCode, which SHALL be selected from ValueSet x_ServiceEventPerformer urn:oid:2.16.840.1.113883.1.11.19601 STATIC (CONF:1198-14840).</sch:assert>
      <sch:assert id="a-1198-14841-error" test="count(cda:assignedEntity)=1">The performer, if present, SHALL contain exactly one [1..1] assignedEntity (CONF:1198-14841).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1198-14846-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:1198-14846).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-componentOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:componentOf">
      <sch:assert id="a-1198-9956-error" test="count(cda:encompassingEncounter)=1">The componentOf, if present, SHALL contain exactly one [1..1] encompassingEncounter (CONF:1198-9956).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-componentOf-encompassingEncounter-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:componentOf/cda:encompassingEncounter">
      <sch:assert id="a-1198-9959-error" test="count(cda:id) &gt; 0">This encompassingEncounter SHALL contain at least one [1..*] id (CONF:1198-9959).</sch:assert>
      <sch:assert id="a-1198-9958-error" test="count(cda:effectiveTime)=1">This encompassingEncounter SHALL contain exactly one [1..1] effectiveTime (CONF:1198-9958).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned_Immunization_Activity-pattern-errors">
    <sch:rule id="Planned_Immunization_Activity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]">
      <sch:assert id="a-1098-32091-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CONF:1098-32091).</sch:assert>
      <sch:assert id="a-1098-32097-error" test="@moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.24']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (SubstanceAdministration/Supply) urn:oid:2.16.840.1.113883.11.20.9.24 STATIC 2014-09-01 (CONF:1098-32097).</sch:assert>
      <sch:assert id="a-1098-32098-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120'][not(@extension)]) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-32098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.120" (CONF:1098-32099).</sch:assert>
      <sch:assert id="a-1098-32100-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-32100).</sch:assert>
      <sch:assert id="a-1098-32101-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-32101).</sch:assert>
      <sch:assert id="a-1098-32103-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-32103).</sch:assert>
      <sch:assert id="a-1098-32131-error" test="count(cda:consumable) = 1">SHALL contain exactly one [1..1] consumable (CONF:1098-32131).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Immunization_Activity-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]/cda:consumable">
      <sch:assert id="a-1098-32132-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']]) = 1">This consumable SHALL contain exactly one [1..1] Immunization Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.54:2014-06-09) (CONF:1098-32132).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Immunization_Activity-statusCode-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]/cda:statusCode">
      <sch:assert id="a-1098-32102-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32102).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Family_History_Observation_V3-pattern-errors">
    <sch:rule id="Family_History_Observation_V3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-8586-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-8586).</sch:assert>
      <sch:assert id="a-1198-8587-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:1198-8587).</sch:assert>
      <sch:assert id="a-1198-8599-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:1198-8599) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.46" (CONF:1198-10496). SHALL contain exactly one [1..1] @extension="2015-08-01" (CONF:1198-32605).</sch:assert>
      <sch:assert id="a-1198-8592-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1198-8592).</sch:assert>
      <sch:assert id="a-1198-32427-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-32427).</sch:assert>
      <sch:assert id="a-1198-8590-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1198-8590).</sch:assert>
      <sch:assert id="a-1198-8591-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Problem urn:oid:2.16.840.1.113883.3.88.12.3221.7.4 DYNAMIC (CONF:1198-8591).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Observation_V3-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]/cda:code">
      <sch:assert id="a-1198-32847-error" test="count(cda:translation) &gt; 0">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2014-09-02 (CONF:1198-32847).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Observation_V3-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]/cda:statusCode">
      <sch:assert id="a-1198-19098-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:1198-19098).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Free_Text_Sig-pattern-errors">
    <sch:rule id="Medication_Free_Text_Sig-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]">
      <sch:assert id="a-1198-32770-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1198-32770).</sch:assert>
      <sch:assert id="a-1198-32771-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2011-04-03 (CONF:1198-32771).</sch:assert>
      <sch:assert id="a-1198-32753-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147'][not(@extension)]) = 1">SHALL contain exactly one [1..1] templateId (CONF:1198-32753) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.147" (CONF:1198-32772).</sch:assert>
      <sch:assert id="a-1198-32775-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:1198-32775).</sch:assert>
      <sch:assert id="a-1198-32754-error" test="count(cda:text) = 1">SHALL contain exactly one [1..1] text (CONF:1198-32754).</sch:assert>
      <sch:assert id="a-1198-32776-error" test="count(cda:consumable) = 1">SHALL contain exactly one [1..1] consumable (CONF:1198-32776).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Free_Text_Sig-code-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:code">
      <sch:assert id="a-1198-32780-error" test="@code='76662-6'">This code SHALL contain exactly one [1..1] @code="76662-6" Instructions Medication (CONF:1198-32780).</sch:assert>
      <sch:assert id="a-1198-32781-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:1198-32781).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Free_Text_Sig-text-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:text">
      <sch:assert id="a-1198-32755-error" test="count(cda:reference) = 1">This text SHALL contain exactly one [1..1] reference (CONF:1198-32755).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Free_Text_Sig-reference-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:text/cda:reference">
      <sch:assert id="a-1198-32774-error" test="starts-with(@value, '#')">This reference/@value SHALL begin with a '#' and SHALL point to its corresponding narrative (using the approach defined in CDA Release 2, section 4.3.5.1) (CONF:1198-32774).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Free_Text_Sig-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:consumable">
      <sch:assert id="a-1198-32777-error" test="count(cda:manufacturedProduct) = 1">This consumable SHALL contain exactly one [1..1] manufacturedProduct (CONF:1198-32777).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Free_Text_Sig-manufacturedProduct-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:consumable/cda:manufacturedProduct">
      <sch:assert id="a-1198-32778-error" test="count(cda:manufacturedLabeledDrug) = 1">This manufacturedProduct SHALL contain exactly one [1..1]  (CONF:1198-32778).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Free_Text_Sig-manufacturedLabeledDrug-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:consumable/cda:manufacturedProduct/cda:manufacturedLabeledDrug">
      <sch:assert id="a-1198-32779-error" test="@nullFlavor='NA'">This manufacturedLabeledDrug SHALL contain exactly one [1..1] @nullFlavor="NA" Not Applicable (CONF:1198-32779).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Activity-pattern-errors">
    <sch:rule id="Medication_Activity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7496-error" test="@classCode='SBADM'">SHALL contain exactly one [1..1] @classCode="SBADM" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-7496).</sch:assert>
      <sch:assert id="a-1098-7497-v-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.18']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet MoodCodeEvnInt urn:oid:2.16.840.1.113883.11.20.9.18 STATIC 2011-04-03 (CONF:1098-7497).</sch:assert>
      <sch:assert id="a-1098-7499-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']) = 1">SHALL contain exactly one [1..1] templateId (CONF:1098-7499) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.16" (CONF:1098-10504). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32498).</sch:assert>
      <sch:assert id="a-1098-7500-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:1098-7500).</sch:assert>
      <sch:assert id="a-1098-7507-error" test="count(cda:statusCode) = 1">SHALL contain exactly one [1..1] statusCode (CONF:1098-7507).</sch:assert>
      <sch:assert id="a-1098-7508-error" test="count(cda:effectiveTime[not(@operator='A')]) = 1 and (cda:effectiveTime[@value] or count(cda:effectiveTime[cda:low])=1) and not(cda:effectiveTime[@value] and cda:effectiveTime[cda:low])">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-7508) such that it SHALL contain either a low or a @value but not both (CONF:1098-32890).</sch:assert>
      <sch:assert id="a-1098-7516-error" test="count(cda:doseQuantity) = 1">SHALL contain exactly one [1..1] doseQuantity (CONF:1098-7516).</sch:assert>
      <sch:assert id="a-1098-7520-error" test="count(cda:consumable) = 1">SHALL contain exactly one [1..1] consumable (CONF:1098-7520).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Activity-code-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32360-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32360).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Activity-may-rateQuantity-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:rateQuantity">
      <sch:assert id="a-1098-7525-error" test="@unit">The rateQuantity, if present, SHALL contain exactly one [1..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-7525).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Activity-consumable-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:consumable">
      <sch:assert id="a-1098-16085-error" test="count(cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.23'][@extension='2014-06-09']])=1">This consumable SHALL contain exactly one [1..1] Medication Information (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.23:2014-06-09) (CONF:1098-16085).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Activity-may-errors" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:precondition">
      <sch:assert id="a-1098-31882-error" test="@typeCode='PRCN'">The precondition, if present, SHALL contain exactly one [1..1] @typeCode="PRCN" (CONF:1098-31882).</sch:assert>
      <sch:assert id="a-1098-31883-error" test="count(cda:criterion[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.25'][@extension='2014-06-09']]) = 1">The precondition, if present, SHALL contain exactly one [1..1] Precondition for Substance Administration (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.25:2014-06-09) (CONF:1098-31883).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned-Observation-pattern-errors">
    <sch:rule id="Planned-Observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8581-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:1098-8581).</sch:assert>
      <sch:assert id="a-1098-8582-error" test="@moodCode and @moodCode=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.25']/voc:code/@value">SHALL contain exactly one [1..1] @moodCode, which SHALL be selected from ValueSet Planned moodCode (Observation) urn:oid:2.16.840.1.113883.11.20.9.25 STATIC 2011-09-30 (CONF:1098-8582).</sch:assert>
      <sch:assert id="a-1098-30451-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44'][@extension='2014-06-09'])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30451) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.44" (CONF:1098-30452). SHALL contain exactly one [1..1] @extension="2014-06-09" (CONF:1098-32555).</sch:assert>
      <sch:assert id="a-1098-8584-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-8584).</sch:assert>
      <sch:assert id="a-1098-30453-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-30453).</sch:assert>
      <sch:assert id="a-1098-31030-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-31030).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44'][@extension='2014-06-09']]/cda:statusCode">
      <sch:assert id="a-1098-32032-error" test="@code='active'">This statusCode SHALL contain exactly one [1..1] @code="active" Active (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:1098-32032).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure-section-pattern-errors">
    <sch:rule id="Measure-section-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:assert id="a-67-12801-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:67-12802).</sch:assert>
      <sch:assert id="a-67-12798-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-12798).</sch:assert>
      <sch:assert id="a-67-12799-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:67-12799).</sch:assert>
      <sch:assert id="a-67-12800-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:67-12800).</sch:assert>
      <sch:assert id="a-67-13003-error" test="count(cda:entry[cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-13003) such that it SHALL contain exactly one [1..1] Measure Reference (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.98) (CONF:67-16677).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure-section-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]/cda:code">
      <sch:assert id="a-67-19230-error" test="@code='55186-1'">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CONF:67-19230).</sch:assert>
      <sch:assert id="a-67-27012-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27012).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Component-pattern-errors">
    <sch:rule id="Component-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.149'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28788-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:3343-28788).</sch:assert>
      <sch:assert id="a-3343-28789-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:3343-28789).</sch:assert>
      <sch:assert id="a-3343-28786-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.149'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28786) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.149" (CONF:3343-28793).SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28796).</sch:assert>
      <sch:assert id="a-3343-28784-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28784).</sch:assert>
      <sch:assert id="a-3343-28797-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:3343-28797).</sch:assert>
      <sch:assert id="a-3343-28785-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:3343-28785).</sch:assert>
    </sch:rule>
    <sch:rule id="Component-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.149'][@extension='2017-08-01']]/cda:referenceRange">
      <sch:assert id="a-3343-28795-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:3343-28795).</sch:assert>
    </sch:rule>
    <sch:rule id="Component-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.149'][@extension='2017-08-01']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-3343-28798-error" test="count(cda:code)=0">This observationRange SHALL NOT contain [0..0] code (CONF:3343-28798).</sch:assert>
      <sch:assert id="a-3343-28799-error" test="count(cda:value)=1">This observationRange SHALL contain exactly one [1..1] value (CONF:3343-28799).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Admission_Source-pattern-errors">
    <sch:rule id="Admission_Source-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.151'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-29094-error" test="@classCode='SDLOC'">SHALL contain exactly one [1..1] @classCode="SDLOC" (CodeSystem: HL7RoleCode urn:oid:2.16.840.1.113883.5.111 STATIC) (CONF:3343-29094).</sch:assert>
      <sch:assert id="a-3343-29091-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.151'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-29091) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.151" (CONF:3343-29093). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-29100).</sch:assert>
      <sch:assert id="a-3343-29099-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-29099).</sch:assert>
    </sch:rule>
    <sch:rule id="Admission_Source-playingEntity-errors" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.151'][@extension='2017-08-01']]/cda:playingEntity">
      <sch:assert id="a-3343-29097-error" test="@classCode='PLC'">The playingEntity, if present, SHALL contain exactly one [1..1] @classCode="PLC" (CodeSystem: HL7EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:3343-29097).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Drug-Monitoring-Act-pattern-errors">
    <sch:rule id="Drug-Monitoring-Act-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]">
      <sch:assert id="a-1098-30823-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30823).</sch:assert>
      <sch:assert id="a-1098-28656-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CONF:1098-28656).</sch:assert>
      <sch:assert id="a-1098-28657-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-28657) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.123" (CONF:1098-28658).</sch:assert>
      <sch:assert id="a-1098-31920-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:1098-31920).</sch:assert>
      <sch:assert id="a-1098-28660-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-28660).</sch:assert>
      <sch:assert id="a-1098-31921-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:1098-31921).</sch:assert>
      <sch:assert id="a-1098-31922-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:1098-31922).</sch:assert>
      <sch:assert id="a-1098-28661-error" test="count(cda:participant[@typeCode='RESP'][count(cda:participantRole[@classCode='ASSIGNED'][count(cda:id)&gt;=1] [count(cda:playingEntity[@classCode='PSN'][count(cda:name)=1])=1])=1])=1">SHALL contain at least one [1..*] participant (CONF:1098-28661) such that it SHALL contain exactly one [1..1] @typeCode="RESP" (CONF:1098-28663). SHALL contain exactly one [1..1] participantRole (CONF:1098-28662). This participantRole SHALL contain exactly one [1..1] @classCode="ASSIGNED" (CONF:1098-28664). This participantRole SHALL contain at least one [1..*] id (CONF:1098-28665). This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-28667). This playingEntity SHALL contain exactly one [1..1] @classCode="PSN" (CONF:1098-28668).  This playingEntity SHALL contain exactly one [1..1] US Realm Patient Name (PTN.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.1) (CONF:1098-28669).</sch:assert>
    </sch:rule>
    <sch:rule id="Drug-Monitoring-Act-code-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]/cda:code">
      <sch:assert id="a-1098-30818-error" test="@code='395170001'">This code SHALL contain exactly one [1..1] @code="395170001" medication monitoring (regime/therapy) (CONF:1098-30818).</sch:assert>
      <sch:assert id="a-1098-30819-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-30819).</sch:assert>
    </sch:rule>
    <sch:rule id="Drug-Monitoring-Act-statusCode-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.123']]/cda:statusCode">
      <sch:assert id="a-1098-32358-error" test="@code">This statusCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet ActStatus urn:oid:2.16.840.1.113883.1.11.159331 DYNAMIC (CONF:1098-32358).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Diagnostic-Study-Recommended-pattern-errors">
    <sch:rule id="Diagnostic-Study-Recommended-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27406-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27406).</sch:assert>
      <sch:assert id="a-3343-13392-error" test="@moodCode='INT'">SHALL contain exactly one [1..1] @moodCode="INT" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13392).</sch:assert>
      <sch:assert id="a-3343-13393-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-13393) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.19" (CONF:3343-13394). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27070).</sch:assert>
      <sch:assert id="a-3343-27619-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27619).</sch:assert>
      <sch:assert id="a-3343-13400-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1])=1">SHALL contain exactly one [1..1] author (CONF:3343-13400) such that it SHALL contain exactly one [1..1] time (CONF:3343-29044).  SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29043).</sch:assert>
    </sch:rule>
    <sch:rule id="Diagnostic-Study-Recommended-author-assignedAuthor-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.19'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29045-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29045).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="eMeasure-Reference-QDM-pattern-errors">
    <sch:rule id="eMeasure-Reference-QDM-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]">
      <sch:assert id="a-67-12805-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12805).</sch:assert>
      <sch:assert id="a-67-12806-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12806).</sch:assert>
      <sch:assert id="a-67-12807-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12807).</sch:assert>
      <sch:assert id="a-67-12808-error" test="count(cda:reference[@typeCode='REFR'] [count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:67-12808) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-12809). SHALL contain exactly one [1..1] externalDocument (CONF:67-12810).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-externalDocument-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-67-27017-error" test="@classCode='DOC'">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:67-27017).</sch:assert>
      <sch:assert id="a-67-12811-error" test="count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1">This externalDocument SHALL contain exactly one [1..1] id (CONF:67-12811) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:67-12812). SHALL contain exactly one [1..1] @extension (CONF:67-12813).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-component-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component">
      <sch:assert id="a-67-16679-error" test="count(cda:observation)=1">The component, if present, SHALL contain exactly one [1..1] observation (CONF:67-16679).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-component-observation-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation">
      <sch:assert id="a-67-16680-error" test="@negationInd">This observation SHALL contain exactly one [1..1] @negationInd (CONF:67-16680).</sch:assert>
      <sch:assert id="a-67-16681-error" test="count(cda:code)=1">This observation SHALL contain exactly one [1..1] code (CONF:67-16681).</sch:assert>
      <sch:assert id="a-67-16683-error" test="count(cda:value[@xsi:type='CD'])=1">This observation SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:67-16683).</sch:assert>
      <sch:assert id="a-67-16684-error" test="count(cda:reference)=1">This observation SHALL contain exactly one [1..1] reference (CONF:67-16684).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-component-observation-code-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:code">
      <sch:assert id="a-67-16682-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:67-16682).</sch:assert>
      <sch:assert id="a-67-27010-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:67-27010).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-component-observation-reference-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:reference">
      <sch:assert id="a-67-16685-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:67-16685).</sch:assert>
      <sch:assert id="a-67-16686-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:67-16686).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-component-observation-reference-externalObservation-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:reference/cda:externalObservation">
      <sch:assert id="a-67-16693-error" test="@classCode='OBS'">This externalObservation SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-16693).</sch:assert>
      <sch:assert id="a-67-16694-error" test="@moodCode='EVN'">This externalObservation SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-16694).</sch:assert>
      <sch:assert id="a-67-16687-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:67-16687).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-component-observation-referenceRange-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:referenceRange">
      <sch:assert id="a-67-16690-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:67-16690).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-component-observation-referenceRange-observationRange-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:component/cda:observation/cda:referenceRange/observationRange">
      <sch:assert id="a-67-16691-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:67-16691).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Related-To-pattern-errors">
    <sch:rule id="Related-To-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-29113-error" test="@typeCode='FLFS'">SHALL contain exactly one [1..1] @typeCode="FLFS" Fulfills (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-29113).</sch:assert>
      <sch:assert id="a-3343-29104-error" test="count(sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] sdtc:templateId (CONF:3343-29104) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.150" (CONF:3343-29107). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-29108).</sch:assert>
      <sch:assert id="a-3343-29105-error" test="count(sdtc:actReference)=1">SHALL contain exactly one [1..1] sdtc:actReference (CONF:3343-29105).</sch:assert>
    </sch:rule>
    <sch:rule id="Related-To-actReference-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01']]/sdtc:actReference">
      <sch:assert id="a-3343-29114-error" test="@classCode">This sdtc:actReference SHALL contain exactly one [1..1] @classCode (CONF:3343-29114).</sch:assert>
      <sch:assert id="a-3343-29110-error" test="@moodCode">This sdtc:actReference SHALL contain exactly one [1..1] @moodCode (CONF:3343-29110).</sch:assert>
      <sch:assert id="a-3343-29106-error" test="count(sdtc:id)&gt;=1">This sdtc:actReference SHALL contain at least one [1..*] sdtc:id (CONF:3343-29106)</sch:assert>
    </sch:rule>
    <sch:rule id="Related-To-actReference-id-errors" context="sdtc:inFulfillmentOf1[sdtc:templateId[@root='2.16.840.1.113883.10.20.24.3.150'][@extension='2017-08-01']]/sdtc:actReference/sdtc:id">
      <sch:assert id="a-3343-29111-error" test="@root">Such sdtc:ids SHALL contain exactly one [1..1] @root (CONF:3343-29111).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Program_Participation-pattern-errors">
    <sch:rule id="Program_Participation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.154'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28974-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-29974).</sch:assert>
      <sch:assert id="a-3343-28975-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28975).</sch:assert>
      <sch:assert id="a-3343-28978-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28978).</sch:assert>
      <sch:assert id="a-3343-28965-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.154'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-28965) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.154" (CONF:3343-28969) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28970).</sch:assert>
      <sch:assert id="a-3343-28976-error" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:3343-28976).</sch:assert>
      <sch:assert id="a-3343-28964-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-28964).</sch:assert>
      <sch:assert id="a-3343-28977-error" test="count(cda:statusCode[@code='completed']) = 1">SHALL contain exactly one [1..1] statusCode="completed" Completed (CONF:3343-28977).</sch:assert>
      <sch:assert id="a-3343-28966-error" test="count(cda:effectiveTime) = 1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-28966).</sch:assert>
      <sch:assert id="a-3343-28973-error" test="count(cda:value[@xsi:type='CD']) = 1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28973)</sch:assert>
    </sch:rule>
    <sch:rule id="Program_Participation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.154'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28967-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" (CONF:3343-28967).</sch:assert>
      <sch:assert id="a-3343-28968-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28968).</sch:assert>
    </sch:rule>
    <sch:rule id="Program_Participation-effectiveTime-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.154'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-28971-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-28971).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Intervention_Order-pattern-errors">
    <sch:rule id="Intervention_Order-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27353-error" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" Act (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27353).</sch:assert>
      <sch:assert id="a-3343-13742-error" test="@moodCode='RQO'">SHALL contain exactly one [1..1] @moodCode="RQO" Request (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-13742).</sch:assert>
      <sch:assert id="a-3343-13743-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2017-08-01']) = 1">SHALL contain exactly one [1..1] templateId (CONF:3343-13743) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.31" (CONF:3343-13744). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-26556).</sch:assert>
      <sch:assert id="a-3343-13746-error" test="count(cda:code) = 1">SHALL contain exactly one [1..1] code (CONF:3343-13746).</sch:assert>
      <sch:assert id="a-3343-27343-error" test="count(cda:author) = 1">SHALL contain exactly one [1..1] author (CONF:3343-27343).</sch:assert>
    </sch:rule>
    <sch:rule id="Intervention_Order-author-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2017-08-01']]/cda:author">
      <sch:assert id="a-3343-29017-error" test="count(cda:time)=1">This author SHALL contain exactly one [1..1] time (CONF:3343-29017).</sch:assert>
      <sch:assert id="a-3343-29016-error" test="count(cda:assignedAuthor)=1">This author SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29016).</sch:assert>
    </sch:rule>
    <sch:rule id="Intervention_Order-author-assignedAuthor-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.31'][@extension='2017-08-01']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-3343-29018-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29018).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Age-observation-pattern-errors">
    <sch:rule id="Age-observation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]">
      <sch:assert id="a-81-7613-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:81-7613).</sch:assert>
      <sch:assert id="a-81-7614-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:81-7614).</sch:assert>
      <sch:assert id="a-81-7899-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:81-7899) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.31" (CONF:81-10487).</sch:assert>
      <sch:assert id="a-81-7615-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:81-7615).</sch:assert>
      <sch:assert id="a-81-15965-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:81-15965).</sch:assert>
      <sch:assert id="a-81-7617-error" test="count(cda:value[@xsi:type='PQ'])=1">SHALL contain exactly one [1..1] value with @xsi:type="PQ" (CONF:81-7617).</sch:assert>
    </sch:rule>
    <sch:rule id="Age-observation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]/cda:code">
      <sch:assert id="a-81-16776-error" test="@code='445518008'">This code SHALL contain exactly one [1..1] @code="445518008" Age At Onset (CONF:81-16776).</sch:assert>
      <sch:assert id="a-81-26499-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:81-26499).</sch:assert>
    </sch:rule>
    <sch:rule id="Age-observation-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]/cda:statusCode">
      <sch:assert id="a-81-15966-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:81-15966).</sch:assert>
    </sch:rule>
    <sch:rule id="Age-observation-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.31']]/cda:value[@xsi:type='PQ']">
      <sch:assert id="a-81-7618-error" test="@unit">This value SHALL contain exactly one [1..1] @unit, which SHALL be selected from ValueSet AgePQ_UCUM urn:oid:2.16.840.1.113883.11.20.9.21 DYNAMIC (CONF:81-7618).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Priority-Preference-pattern-errors">
    <sch:rule id="Priority-Preference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]">
      <sch:assert id="a-1098-30949-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:1098-30949).</sch:assert>
      <sch:assert id="a-1098-30950-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:1098-30950).</sch:assert>
      <sch:assert id="a-1098-30951-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143'][not(@extension)])=1">SHALL contain exactly one [1..1] templateId (CONF:1098-30951) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.22.4.143" (CONF:1098-30952).</sch:assert>
      <sch:assert id="a-1098-30953-error" test="count(cda:id) &gt;= 1">SHALL contain at least one [1..*] id (CONF:1098-30953).</sch:assert>
      <sch:assert id="a-1098-30954-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:1098-30954).</sch:assert>
      <sch:assert id="a-1098-30957-error" test="count(cda:value[@xsi:type='CD' and @code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.11.20.9.60']/voc:code/@value or @nullFlavor])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Priority Level urn:oid:2.16.840.1.113883.11.20.9.60 STATIC 2014-06-11 (CONF:1098-30957).</sch:assert>
    </sch:rule>
    <sch:rule id="Priority-Preference-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]/cda:code">
      <sch:assert id="a-1098-30955-error" test="@code='225773000'">This code SHALL contain exactly one [1..1] @code="225773000" Preference (CONF:1098-30955).</sch:assert>
      <sch:assert id="a-1098-30956-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:1098-30956).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Author-pattern-errors">
    <sch:rule id="Author-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-29151-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-29151) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.155" (CONF:3343-29160) SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-29161).</sch:assert>
      <sch:assert id="a-3343-29152-error" test="count(cda:time)=1">SHALL contain exactly one [1..1] time (CONF:3343-29152).</sch:assert>
      <sch:assert id="a-3343-29146-error" test="count(cda:assignedAuthor)=1">SHALL contain exactly one [1..1] assignedAuthor (CONF:3343-29146).</sch:assert>
    </sch:rule>
    <sch:rule id="Author-assignedAuthor-errors" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.155'][@extension='2017-08-01']]/cda:assignedAuthor">
      <sch:assert id="a-3343-29147-error" test="count(cda:id)&gt;=1">This assignedAuthor SHALL contain at least one [1..*] id (CONF:3343-29147).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Performed-pattern-errors">
    <sch:rule id="Procedure-Performed-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27308-error" test="@classCode='PROC'">SHALL contain exactly one [1..1] @classCode="PROC" Procedure (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-27308).</sch:assert>
      <sch:assert id="a-3343-11261-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001) (CONF:3343-11261).</sch:assert>
      <sch:assert id="a-3343-11262-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-11262) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.64" (CONF:3343-11263). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-27129).</sch:assert>
      <sch:assert id="a-3343-27309-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-27309).</sch:assert>
      <sch:assert id="a-3343-27305-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:3343-27305).</sch:assert>
      <sch:assert id="a-3343-11669-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3343-11669).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Performed-statusCode-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]/cda:statusCode">
      <sch:assert id="a-3343-27367-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:3343-27367).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Performed-effectiveTime-errors" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-11670-error" test="count(cda:low)=1">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3343-11670).</sch:assert>
      <sch:assert id="a-3343-11671-error" test="count(cda:high)=1">This effectiveTime SHALL contain exactly one [1..1] high (CONF:3343-11671).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Adverse-Event-Cause-Observation-Assertion-pattern-errors">
    <sch:rule id="Adverse-Event-Cause-Observation-Assertion-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.148'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28741-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CONF:3343-28741).</sch:assert>
      <sch:assert id="a-3343-28742-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:3343-28742).</sch:assert>
      <sch:assert id="a-3343-28745-error" test="not(@negationInd)">SHALL NOT contain [0..0] @negationInd (CONF:3343-28745).</sch:assert>
      <sch:assert id="a-3343-28731-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.148'][@extension='2017-08-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:3343-28731) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.148" (CONF:3343-28736). SHALL contain exactly one [1..1] @extension="2017-08-01" (CONF:3343-28737).</sch:assert>
      <sch:assert id="a-3343-28730-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:3343-28730).</sch:assert>
      <sch:assert id="a-3343-28733-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:3343-28733).</sch:assert>
    </sch:rule>
    <sch:rule id="Adverse-Event-Cause-Observation-Assertion-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.148'][@extension='2017-08-01']]/cda:code">
      <sch:assert id="a-3343-28734-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:3343-28734).</sch:assert>
      <sch:assert id="a-3343-28735-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:3343-28735).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <!--
      WARNING Patterns and Assertions
  -->
  <sch:pattern id="US-Realm-Address-pattern-warnings">
    <sch:rule id="US-Realm-Address-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:addr             | cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18']]/cda:performer/cda:assignedEntity/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author/cda:assignedAuthor/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:dataEnterer/cda:assignedEntity/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator/cda:assignedEntity/cda:addr             | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:addr">
      <sch:assert id="a-81-7290-warning" test="@use">SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet PostalAddressUse urn:oid:2.16.840.1.113883.1.11.10637 STATIC 2005-05-01 (CONF:81-7290).</sch:assert>
      <sch:assert id="a-81-7295-warning" test="count(cda:country)=1">SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:81-7295).</sch:assert>
      <sch:assert id="a-81-7293-warning" test="count(cda:state)=1">SHOULD contain zero or one [0..1] state (ValueSet: StateValueSet urn:oid:2.16.840.1.113883.3.88.12.80.1 DYNAMIC) (CONF:81-7293).</sch:assert>
      <sch:assert id="a-81-7294-warning" test="count(cda:postalCode)=1">SHOULD contain zero or one [0..1] postalCode, which SHOULD be selected from ValueSet PostalCode urn:oid:2.16.840.1.113883.3.88.12.80.2 DYNAMIC (CONF:81-7294).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference-pattern-warnings">
    <sch:rule id="Measure_Reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-67-12997-warning" test="count(cda:text) &gt; 0">This externalDocument SHOULD contain zero or one [0..1] text (CONF:67-12997).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Free_Text_Sig-pattern-warnings">
    <sch:rule id="Medication_Free_Text_Sig-reference-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.147']]/cda:text/cda:reference">
      <sch:assert id="a-1198-32756-warning" test="count(@value) = 1">This reference SHOULD contain zero or one [0..1] @value (CONF:1198-32756).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Supply_Order-pattern-warnings">
    <sch:rule id="Medication_Supply_Order-effectiveTime-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.17'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-15143-warning" test="count(cda:effectiveTime[count(cda:high)=1]) = 1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-15143) such that it SHALL contain exactly one [1..1] high (CONF:1098-15144).</sch:assert>
      <sch:assert id="a-1098-7434-warning" test="count(cda:repeatNumber) = 1">SHOULD contain zero or one [0..1] repeatNumber (CONF:1098-7434).</sch:assert>
      <sch:assert id="a-1098-7436-warning" test="count(cda:quantity) = 1">SHOULD contain zero or one [0..1] quantity (CONF:1098-7436).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reaction-Observation-pattern-warnings">
    <sch:rule id="Reaction-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7332-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7332).</sch:assert>
    </sch:rule>
    <sch:rule id="Reaction-Observation-effectiveTime-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09']]/cda:effectiveTime">
      <sch:assert id="a-1098-7333-warning" test="count(cda:low)=1">The effectiveTime, if present, SHOULD contain zero or one [0..1] low (CONF:1098-7333).</sch:assert>
      <sch:assert id="a-1098-7334-warning" test="count(cda:high)=1">The effectiveTime, if present, SHOULD contain zero or one [0..1] high (CONF:1098-7334).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Provider-Characteristic-Observation-Assertion-pattern-warnings">
    <sch:rule id="Provider-Characteristic-Observation-Assertion-participant-participantRole-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.114'][@extension='2017-08-01']]/cda:participant/cda:participantRole">
      <sch:assert id="a-3343-28221-warning" test="count(cda:id [@root='2.16.840.1.113883.4.6'][@extension])&gt;=1">This participantRole SHOULD contain zero or more [0..*] id (CONF:3343-28221) such that it  SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider ID (CONF:3343-28222).  SHOULD contain zero or one [0..1] @extension (CONF:3343-28223).</sch:assert>
      <sch:assert id="a-3343-28218-warning" test="count(cda:code)=1">This participantRole SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 (CONF:3343-28220).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Activity-Observation-pattern-warnings">
    <sch:rule id="Procedure-Activity-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8246-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-8246).</sch:assert>
      <sch:assert id="a-1098-8250-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-8250).</sch:assert>
      <sch:assert id="a-1098-8251-warning" test="count(cda:performer)&gt;=1">SHOULD contain zero or more [0..*] performer (CONF:1098-8251).</sch:assert>
      <sch:assert id="a-1098-32478-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32478).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-code-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-19198-warning" test="count(cda:originalText)=1">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19198).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-code-originalText-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:code/cda:originalText">
      <sch:assert id="a-1098-19199-warning" test="count(cda:reference)=1">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1098-19199).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-code-originalText-reference-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:code/cda:originalText/cda:reference">
      <sch:assert id="a-1098-19200-warning" test="@value">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1098-19200).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-performer-assignedEntity-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1098-8256-warning" test="count(cda:representedOrganization)=1">This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-8256).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Observation-performer-assignedEntity-representedOrganization-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.13'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-1098-8257-warning" test="count(cda:id)&gt;=1">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-8257).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Dispense_V2-pattern-warnings">
    <sch:rule id="Medication_Dispense_V2-warning" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7456-warning" test="count(cda:effectiveTime) = 1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7456).</sch:assert>
      <sch:assert id="a-1098-7457-warning" test="count(cda:repeatNumber) = 1">SHOULD contain zero or one [0..1] repeatNumber (CONF:1098-7457).</sch:assert>
      <sch:assert id="a-1098-7458-warning" test="count(cda:quantity) = 1">SHOULD contain zero or one [0..1] quantity (CONF:1098-7458).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Dispense_V2-may-performer-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.18'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1098-7468-warning" test="count(cda:addr) = 1">This assignedEntity SHOULD contain zero or one [0..1] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1098-7468).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Indication-pattern-warnings">
    <sch:rule id="Indication-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.19'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7488-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7488).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Substance-Device-Allergy-Intolerance-Observation-pattern-warnings">
    <sch:rule id="Substance-Device-Allergy-Intolerance-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.90'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-31144-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31144).</sch:assert>
      <sch:assert id="a-1098-16318-warning" test="count(cda:participant[@typeCode='CSM']  [count(cda:participantRole[@classCode='MANU']  [count(cda:playingEntity[@classCode='MMAT']  [count(cda:code)=1])=1])=1])&gt;=1">SHOULD contain zero or more [0..*] participant (CONF:1098-16318) such that it SHALL contain exactly one [1..1] @typeCode="CSM" Consumable (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:1098-16319). SHALL contain exactly one [1..1] participantRole (CONF:1098-16320). This participantRole SHALL contain exactly one [1..1] @classCode="MANU" Manufactured Product (CodeSystem: RoleClass urn:oid:2.16.840.1.113883.5.110 STATIC) (CONF:1098-16321). This participantRole SHALL contain exactly one [1..1] playingEntity (CONF:1098-16322). This playingEntity SHALL contain exactly one [1..1] @classCode="MMAT" Manufactured Material (CodeSystem: EntityClass urn:oid:2.16.840.1.113883.5.41 STATIC) (CONF:1098-16323).  This playingEntity SHALL contain exactly one [1..1] code, which MAY be selected from ValueSet Substance-Reactant for Intolerance urn:oid:2.16.840.1.113762.1.4.1010.1 DYNAMIC (CONF:1098-16324).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Family_History_Organizer_V3-pattern-warnings">
    <sch:rule id="Family_History_Organizer_QDM_V2-subject-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:subject/cda:relatedSubject">
      <sch:assert id="a-1198-15248-warning" test="count(cda:subject) = 1">This relatedSubject SHOULD contain zero or one [0..1] subject (CONF:1198-15248).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Organizer_QDM_V2-subject-subject-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.45'][@extension='2015-08-01']]/cda:subject/cda:relatedSubject/cda:subject">
      <sch:assert id="a-1198-15976-warning" test="count(cda:birthTime) = 1">The subject, if present, SHOULD contain zero or one [0..1] birthTime (CONF:1198-15976).</sch:assert>
      <sch:assert id="a-1198-15249-warning" test="count(sdtc:id) &gt; 0">The subject SHOULD contain zero or more [0..*] sdtc:id. The prefix sdtc: SHALL be bound to the namespace “urn:hl7-org:sdtc”. The use of the namespace provides a necessary extension to CDA R2 for the use of the id element (CONF:1198-15249).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned-Medication-Activity-pattern-warnings">
    <sch:rule id="Planned-Medication-Activity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-32046-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt;= 1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32046).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Medication-Activity-doseQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09']]/cda:doseQuantity">
      <sch:assert id="a-1098-32133-warning" test="@unit">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32133).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Medication-Activity-rateQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.42'][@extension='2014-06-09']]/cda:rateQuantity">
      <sch:assert id="a-1098-32134-warning" test="@unit">The rateQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32134).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned-Observation-pattern-warnings">
    <sch:rule id="Planned-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.44'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-30454-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30454).</sch:assert>
      <sch:assert id="a-1098-32033-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt;= 1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32033).</sch:assert>
      <sch:assert id="a-1098-32044-warning" test="count(cda:targetSiteCode) &gt;= 1">SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-32044).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned-Supply-pattern-warnings">
    <sch:rule id="Planned-Supply-warnings" context="cda:supply[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.43'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-30459-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30459).</sch:assert>
      <sch:assert id="a-1098-32325-warning" test="count(cda:product)=1">SHOULD contain zero or one [0..1] product (CONF:1098-32325).</sch:assert>
      <sch:assert id="a-1098-31129-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])=1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31129).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Immunization_activity-pattern-warnings">
    <sch:rule id="Immunization_activity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8841-warning" test="count(cda:doseQuantity)=1">SHOULD contain zero or one [0..1] doseQuantity (CONF:1098-8841).</sch:assert>
      <sch:assert id="a-1098-8849-warning" test="count(cda:performer)=1">SHOULD contain zero or one [0..1] performer (CONF:1098-8849).</sch:assert>
      <sch:assert id="a-1098-31151-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31151).</sch:assert>
      <sch:assert id="a-1098-31510-warning" test="count(cda:entryRelationship[@typeCode='COMP'][@inversionInd='true'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.118']])=1]) &gt; 0">SHOULD contain zero or more [0..*] entryRelationship (CONF:1098-31510) such that it SHALL contain exactly one [1..1] @typeCode="COMP" Component (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-31511). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:1098-31512). SHALL contain exactly one [1..1] Substance Administered Act (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.118) (CONF:1098-31514).</sch:assert>
    </sch:rule>
    <sch:rule id="Immunization_activity-doseQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.52'][@extension='2014-06-09']]/cda:doseQuantity">
      <sch:assert id="a-1098-8842-warning" test="@unit">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-8842).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Family_History_Observation_V3-pattern-warnings">
    <sch:rule id="Family_History_Observation_V3-code-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]/cda:code">
      <sch:assert id="a-1198-32427-v-warning" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.3.88.12.3221.7.2']/voc:code/@value">SHALL contain exactly one [1..1] code, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2012-06-01 (CONF:1198-32427).</sch:assert>
      <sch:assert id="a-1198-32847-warning" test="count(cda:translation[@sdtc:valueSet='2.16.840.1.113883.3.88.12.3221.7.2']) &gt; 0">This code SHALL contain at least one [1..*] translation, which SHOULD be selected from ValueSet Problem Type urn:oid:2.16.840.1.113883.3.88.12.3221.7.2 STATIC 2014-09-02 (CONF:1198-32847).</sch:assert>
    </sch:rule>
    <sch:rule id="Family_History_Observation_V3-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.46'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-8593-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1198-8593).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Author-Participation-pattern-warnings">
    <sch:rule id="Author-Participation-assignedAuthor-warnings" context="cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]/cda:assignedAuthor">
      <sch:assert id="a-1098-31671-warning" test="count(cda:code)=1">This assignedAuthor SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1098-31671). .</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned_Encounter-pattern-warnings">
    <sch:rule id="Planned_Encounter-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.40'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-30440-warning" test="count(cda:effectiveTime) = 1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30440).</sch:assert>
      <sch:assert id="a-1098-32045-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32045).</sch:assert>
      <sch:assert id="a-1098-31032-warning" test="count(cda:code) = 1">SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Encounter Planned urn:oid:2.16.840.1.113883.11.20.9.52 DYNAMIC (CONF:1098-31032).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Device-Applied-pattern-warnings">
    <sch:rule id="Device-Applied-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.7'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-12416-warning" test="count(cda:targetSiteCode)=1">SHOULD contain zero or one [0..1] targetSiteCode (CONF:3343-12416).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Patient_Characteristic_Payer-pattern-warnings">
    <sch:rule id="Patient_Characteristic_Payer-effectiveTime-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]/cda:effectiveTime">
      <sch:assert id="a-67-26935-warning" test="count(cda:high)=1">This effectiveTime SHOULD contain zero or one [0..1] high (CONF:67-26935).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Admission_Source-pattern-warnings">
    <sch:rule id="Admission_Source-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.151'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-29095-warning" test="count(cda:addr) &gt; 0">SHOULD contain zero or more [0..*] addr (CONF:3343-29095).</sch:assert>
      <sch:assert id="a-3343-29096-warning" test="count(cda:telecom) &gt; 0">SHOULD contain zero or more [0..*] telecom (CONF:3343-29096).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Priority-Preference-pattern-warnings">
    <sch:rule id="Priority-Preference-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]">
      <sch:assert id="a-1098-32327-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-32327).</sch:assert>
      <sch:assert id="a-1098-30958-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-30958).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="US_Realm-pattern-warnings">
    <sch:rule id="US_Realm-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-5579-warning" test="count(cda:legalAuthenticator)=1">SHOULD contain zero or one [0..1] legalAuthenticator (CONF:1198-5579).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-confidentialityCode-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:confidentialityCode">
      <sch:assert id="a-1198-5259-v-warning" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC (CONF:1198-5259).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:telecom">
      <sch:assert id="a-1198-5375-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-5375).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient">
      <sch:assert id="a-1198-5303-warning" test="count(cda:maritalStatusCode)=1">This patient SHOULD contain zero or one [0..1] maritalStatusCode, which SHALL be selected from ValueSet Marital Status urn:oid:2.16.840.1.113883.1.11.12212 DYNAMIC (CONF:1198-5303).</sch:assert>
      <sch:assert id="a-1198-5406-warning" test="count(cda:languageCommunication) &gt; 0">This patient SHOULD contain zero or more [0..*] languageCommunication (CONF:1198-5406).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthTime-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime">
      <sch:assert id="a-1198-5300-warning" test="string-length(@value) &gt;= 8">SHOULD be precise to day (CONF:1198-5300).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-guardian-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian">
      <sch:assert id="a-1198-5326-warning" test="count(cda:code)=1">The guardian, if present, SHOULD contain zero or one [0..1] code, which SHALL be selected from ValueSet Personal And Legal Relationship Role Type urn:oid:2.16.840.1.113883.11.20.12.1 DYNAMIC (CONF:1198-5326).</sch:assert>
      <sch:assert id="a-1198-5359-warning" test="count(cda:addr) &gt; 0">The guardian, if present, SHOULD contain zero or more [0..*] US Realm Address (AD.US.FIELDED) (identifier: urn:oid:2.16.840.1.113883.10.20.22.5.2) (CONF:1198-5359).</sch:assert>
      <sch:assert id="a-1198-5382-warning" test="count(cda:telecom) &gt; 0">The guardian, if present, SHOULD contain zero or more [0..*] telecom (CONF:1198-5382).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-guardian-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:guardian/cda:telecom">
      <sch:assert id="a-1198-7993-warning" test="@use">The telecom, if present, SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7993).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-birthplace-place-addr-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:birthplace/cda:place/cda:addr">
      <sch:assert id="a-1198-5404-warning" test="count(cda:country)=1">This addr SHOULD contain zero or one [0..1] country, which SHALL be selected from ValueSet Country urn:oid:2.16.840.1.113883.3.88.12.80.63 DYNAMIC (CONF:1198-5404).</sch:assert>
      <sch:assert id="a-1198-5402-warning" test="count(cda:state)=1 and (cda:country='US' or cda:country='USA')">If country is US, this addr SHALL contain exactly one [1..1] state, which SHALL be selected from ValueSet StateValueSet 2.16.840.1.113883.3.88.12.80.1 DYNAMIC (CONF:1198-5402).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-patient-languageCommunication-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:patient/cda:languageCommunication">
      <sch:assert id="a-1198-9965-warning" test="count(cda:proficiencyLevelCode)=1">The languageCommunication, if present, SHOULD contain zero or one [0..1] proficiencyLevelCode, which SHALL be selected from ValueSet LanguageAbilityProficiency urn:oid:2.16.840.1.113883.1.11.12199 DYNAMIC (CONF:1198-9965).</sch:assert>
      <sch:assert id="a-1198-5414-warning" test="count(cda:preferenceInd)=1">The languageCommunication, if present, SHOULD contain zero or one [0..1] preferenceInd (CONF:1198-5414).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-providerOrganization-id-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:id">
      <sch:assert id="a-1198-16820-warning" test="@root='2.16.840.1.113883.4.6'">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16820).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-recordTarget-patientRole-providerOrganization-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:telecom">
      <sch:assert id="a-1198-7994-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7994).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-author-assignedAuthor-assignedPerson-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:assignedPerson">
      <sch:assert id="a-1198-32882-warning" test="count(../cda:id[@root='2.16.840.1.113883.4.6'][@extension])=1">This assignedAuthor SHOULD contain zero or one [0..1] id (CONF:1198-32882) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-32884). SHOULD contain zero or one [0..1] @extension (CONF:1198-32885).</sch:assert>
      <sch:assert id="a-1198-16787-warning" test="count(../cda:code)=1">This assignedAuthor SHOULD contain zero or one [0..1] code (CONF:1198-16787).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-author-assignedAuthor-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:author/cda:assignedAuthor/cda:telecom">
      <sch:assert id="a-1198-7995-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7995).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-dataEnterer-assignedEntity-id-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer/cda:assignedEntity/cda:id">
      <sch:assert id="a-1198-16821-warning" test="@root='2.16.840.1.113883.4.6'">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16821).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-dataEnterer-assignedEntity-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:dataEnterer/cda:assignedEntity/cda:telecom">
      <sch:assert id="a-1198-7996-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7996).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-1198-16822-warning" test="count(cda:id[@root='2.16.840.1.113883.4.6'])=1">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-16822).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-custodian-assignedCustodian-representedCustodianOrganization-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:telecom">
      <sch:assert id="a-1198-7998-warning" test="@use">This telecom SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7998).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-legalAuthenticator-assignedEntity-telecom-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:legalAuthenticator/cda:assignedEntity/cda:telecom">
      <sch:assert id="a-1198-7999-warning" test="@use">Such telecoms SHOULD contain zero or one [0..1] @use, which SHALL be selected from ValueSet Telecom Use (US Realm Header) urn:oid:2.16.840.1.113883.11.20.9.20 DYNAMIC (CONF:1198-7999).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-serviceEvent-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent">
      <sch:assert id="a-1198-14839-warning" test="count(cda:performer) &gt; 0">This serviceEvent SHOULD contain zero or more [0..*] performer (CONF:1198-14839).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-functionCode-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:functionCode">
      <sch:assert id="a-1198-32889-warning" test="@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.10267']/voc:code/@value">The functionCode, if present, SHOULD contain zero or one [0..1] @code, which SHOULD be selected from ValueSet ParticipationFunction urn:oid:2.16.840.1.113883.1.11.10267 STATIC (CONF:1198-32889).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-assignedEntity-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1198-14842-warning" test="count(cda:code)=1">This assignedEntity SHOULD contain zero or one [0..1] code, which SHOULD be selected from ValueSet Healthcare Provider Taxonomy (HIPAA) urn:oid:2.16.840.1.114222.4.11.1066 DYNAMIC (CONF:1198-14842).</sch:assert>
    </sch:rule>
    <sch:rule id="US_Realm-documentationOf-serviceEvent-performer-assignedEntity-id-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1'][@extension='2015-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:id">
      <sch:assert id="a-1198-14847-warning" test="@root='2.16.840.1.113883.4.6'">Such ids SHOULD contain zero or one [0..1] @root="2.16.840.1.113883.4.6" National Provider Identifier (CONF:1198-14847).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Goal_Observation-pattern-warnings">
    <sch:rule id="Goal_Observation-codesystem-code-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]/cda:code">
      <sch:assert id="a-1098-30784-c-warning" test="@codeSystem='2.16.840.1.113883.6.1'">SHALL contain exactly one [1..1] code, which SHOULD be selected from CodeSystem LOINC (urn:oid:2.16.840.1.113883.6.1) (CONF:1098-30784).</sch:assert>
    </sch:rule>
    <sch:rule id="Goal_Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.121']]">
      <sch:assert id="a-1098-32335-warning" test="count(cda:effectiveTime) = 1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-32335).</sch:assert>
      <sch:assert id="a-1098-30995-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt;= 1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-30995).</sch:assert>
      <sch:assert id="a-1098-30785-warning" test="count(cda:entryRelationship[@typeCode='REFR'][cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.143']]]) = 1">SHOULD contain zero or one [0..1] entryRelationship (CONF:1098-30785) such that it SHALL contain exactly one [1..1] @typeCode="REFR" Refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:1098-30786). SHALL contain exactly one [1..1] Priority Preference (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.143) (CONF:1098-30787).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="eMeasure-Reference-QDM-pattern-warnings">
    <sch:rule id="eMeasure-Reference-QDM-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-67-12864-warning" test="count(cda:code)=1">This externalDocument SHOULD contain zero or one [0..1] code (CONF:67-12864).</sch:assert>
      <sch:assert id="a-67-12865-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:67-12865).</sch:assert>
      <sch:assert id="a-67-12867-warning" test="count(cda:setId)=1">This externalDocument SHOULD contain zero or one [0..1] setId (CONF:67-12867).</sch:assert>
      <sch:assert id="a-67-12869-warning" test="count(cda:versionNumber)=1">This externalDocument SHOULD contain zero or one [0..1] versionNumber (CONF:67-12869).</sch:assert>
    </sch:rule>
    <sch:rule id="eMeasure-Reference-QDM-reference-externalDocument-code-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.97']]/cda:reference/cda:externalDocument/cda:code">
      <sch:assert id="a-67-27015-warning" test="@code='57024-2'">The code, if present, SHOULD contain zero or one [0..1] @code="57024-2" Health Quality Measure Document (CONF:67-27015).</sch:assert>
      <sch:assert id="a-67-27016-warning" test="@codeSystem='2.16.840.1.113883.6.1'">The code, if present, SHOULD contain zero or one [0..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27016).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="External-Document-Reference-pattern-warnings">
    <sch:rule id="External-Document-Reference-warnings" context="cda:externalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.115'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-32752-warning" test="count(cda:setId)=1">SHOULD contain zero or one [0..1] setId (CONF:1098-32752).</sch:assert>
      <sch:assert id="a-1098-32753-warning" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:1098-32753).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Adverse_Event-pattern-warnings">
    <sch:rule id="Adverse_Event-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-28750-warning" test="count(cda:entryRelationship[@typeCode='MFST'][@inversionInd='true'][count(cda:observation/cda:templateId[@root='2.16.840.1.113883.10.20.22.4.9'][@extension='2014-06-09'])=1])=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:3343-28750) such that it SHALL contain exactly one [1..1] @typeCode="MFST" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:3343-28759). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:3343-28760). SHALL contain exactly one [1..1] Reaction Observation (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.9:2014-06-09) (CONF:3343-28758).</sch:assert>
    </sch:rule>
    <sch:rule id="Adverse_Event-effectiveTime-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.146'][@extension='2017-08-01']]/cda:effectiveTime">
      <sch:assert id="a-3343-28767-warning" test="count(cda:high)=1">This effectiveTime SHOULD contain zero or one [0..1] high (CONF:3343-28767).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Activity-Act-pattern-warnings">
    <sch:rule id="Procedure-Activity-Act-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-8301-warning" test="count(cda:performer)&gt;=1">SHOULD contain zero or more [0..*] performer (CONF:1098-8301).</sch:assert>
      <sch:assert id="a-1098-32477-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32477).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Act-code-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-19186-warning" test="count(cda:originalText)=1">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19186).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Act-performer-assignedEntity-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1098-8306-warning" test="count(cda:representedOrganization)=1">This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-8306).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Act-performer-assignedEntity-representedOrganization-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.12'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-1098-8307-warning" test="count(cda:id)&gt;=1">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-8307).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Service-Delivery-Location-pattern-warnings">
    <sch:rule id="Service-Delivery-Location-warnings" context="cda:participationRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']]">
      <sch:assert id="a-81-7760-warning" test="count(cda:addr)&gt;=1">SHOULD contain zero or more [0..*] addr (CONF:81-7760).</sch:assert>
      <sch:assert id="a-81-7761-warning" test="count(cda:telecom)=1">SHOULD contain zero or more [0..*] telecom (CONF:81-7761).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Performed-pattern-warnings">
    <sch:rule id="Procedure-Performed-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.64'][@extension='2017-08-01']]">
      <sch:assert id="a-3343-27312-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode (CONF:3343-27312).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Facility-Location-pattern-warnings">
    <sch:rule id="Facility-Location-participantRole-warnings" context="cda:participant[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.100']]/cda:participantRole">
      <sch:assert id="a-3343-13379-warning" test="count(cda:addr) &gt; 0">This participantRole SHOULD contain zero or more [0..*] addr (CONF:3343-13379).</sch:assert>
      <sch:assert id="a-3343-13380-warning" test="count(cda:telecom) &gt; 0">This participantRole SHOULD contain zero or more [0..*] telecom (CONF:3343-13380).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Procedure-Activity-Procedure-pattern-warnings">
    <sch:rule id="Procedure-Activity-Procedure-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7662-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7662).</sch:assert>
      <sch:assert id="a-1098-7683-warning" test="count(cda:targetSiteCode)&gt;=1">SHOULD contain zero or more [0..*] targetSiteCode, which SHALL be selected from ValueSet Body Site urn:oid:2.16.840.1.113883.3.88.12.3221.8.9 DYNAMIC (CONF:1098-7683).</sch:assert>
      <sch:assert id="a-1098-7718-warning" test="count(cda:performer[count(cda:assignedEntity[count(cda:id) &gt; 0][count(cda:addr) &gt; 0][count(cda:telecom) &gt; 0])=1]) &gt; 0">SHOULD contain zero or more [0..*] performer (CONF:1098-7718) such that it SHALL contain exactly one [1..1] assignedEntity (CONF:1098-7720). This assignedEntity SHALL contain at least one [1..*] id (CONF:1098-7722). This assignedEntity SHALL contain at least one [1..*] addr (CONF:1098-7731). This assignedEntity SHALL contain at least one [1..*] telecom (CONF:1098-7732).</sch:assert>
      <sch:assert id="a-1098-32479-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain at least one [1..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32479).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-code-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-19203-warning" test="count(cda:originalText)=1">This code SHOULD contain zero or one [0..1] originalText (CONF:1098-19203).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-code-originalText-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:code/cda:originalText">
      <sch:assert id="a-1098-19204-warning" test="count(cda:reference)=1">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1098-19204).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-code-originalText-reference-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:code/cda:originalText/cda:reference">
      <sch:assert id="a-1098-19205-warning" test="@value">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1098-19205).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-specimen-specimenRole-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:specimen/cda:specimenRole">
      <sch:assert id="a-1098-7716-warning" test="count(cda:id)&gt;=1">This specimenRole SHOULD contain zero or more [0..*] id (CONF:1098-7716).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-performer-assignedEntity-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity">
      <sch:assert id="a-1098-7733-warning" test="count(cda:representedOrganization)=1">This assignedEntity SHOULD contain zero or one [0..1] representedOrganization (CONF:1098-7733).</sch:assert>
    </sch:rule>
    <sch:rule id="Procedure-Activity-Procedure-performer-assignedEntity-representedOrganization-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.14'][@extension='2014-06-09']]/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-1098-7734-warning" test="count(cda:id)&gt;=1">The representedOrganization, if present, SHOULD contain zero or more [0..*] id (CONF:1098-7734).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned_Act-pattern-warnings">
    <sch:rule id="Planned_Act-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-32020-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) = 1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-32020).</sch:assert>
      <sch:assert id="a-1098-30433-warning" test="count(cda:effectiveTime) = 1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30433).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned_Act-code-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.39'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-32030-warning" test="@codeSystem = '2.16.840.1.113883.6.96' or @codeSystem = '2.16.840.1.113883.6.1'">This code in a Planned Act SHOULD be selected from LOINC (CodeSystem: 2.16.840.1.113883.6.1) OR SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96) (CONF:1098-32030).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Problem-Observation-pattern-warnings">
    <!-- Corrected cda:observation, was incorrectly prefixed with cda:act -->
    <sch:rule id="Problem-Observation-participant-participantRole-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-31147-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31147).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Medication_Activity-pattern-warnings">
    <sch:rule id="Medication_Activity-effectiveTime-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:effectiveTime">
      <sch:assert id="a-1098-7513-warning" test="parent::node()[count(cda:effectiveTime[@operator='A'][@xsi:type='PIVL_TS' or 'EIVL_TS'])=1]">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-7513) such that it SHALL contain exactly one [1..1] @operator="A" (CONF:1098-9106). SHALL contain exactly one [1..1] @xsi:type="PIVL_TS" or "EIVL_TS" (CONF:1098-28499).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Activity-doseQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]/cda:doseQuantity">
      <sch:assert id="a-1098-7526-warning" test="@unit">This doseQuantity SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-7526).</sch:assert>
    </sch:rule>
    <sch:rule id="Medication_Activity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.16'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-7514-warning" test="count(cda:routeCode) = 1">SHOULD contain zero or one [0..1] routeCode, which SHALL be selected from ValueSet Medication Route FDA urn:oid:2.16.840.1.113883.3.88.12.3221.8.7 DYNAMIC (CONF:1098-7514).</sch:assert>
      <sch:assert id="a-1098-31150-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']]) &gt; 0">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31150).</sch:assert>
      <sch:assert id="a-1098-30800-warning" test="(count(cda:doseQuantity) &gt; 0) or (count(cda:rateQuantity) &gt; 0)">Medication Activity SHOULD include doseQuantity OR rateQuantity (CONF:1098-30800).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Encounter-Activity-pattern-warnings">
    <sch:rule id="Encounter-Activity-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-8738-warning" test="count(cda:participant[@typeCode='LOC'][count(cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.32']])=1])&gt;=1">SHOULD contain zero or more [0..*] participant (CONF:1198-8738) such that it SHALL contain exactly one [1..1] @typeCode="LOC" Location (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-8740).  SHALL contain exactly one [1..1] Service Delivery Location (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.32) (CONF:1198-14903).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Activity-code-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:code">
      <sch:assert id="a-1198-8719-warning" test="count(cda:originalText)=1">This code SHOULD contain zero or one [0..1] originalText (CONF:1198-8719).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Activity-code-originalText-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:code/cda:originalText">
      <sch:assert id="a-1198-15970-warning" test="count(cda:reference)=1">The originalText, if present, SHOULD contain zero or one [0..1] reference (CONF:1198-15970).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Activity-code-originalText-reference-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/cda:code/cda:originalText/cda:reference">
      <sch:assert id="a-1198-15971-warning" test="@value">The reference, if present, SHOULD contain zero or one [0..1] @value (CONF:1198-15971).</sch:assert>
    </sch:rule>
    <sch:rule id="Encounter-Activity-dischargeDispositionCode-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.49'][@extension='2015-08-01']]/sdtc:dischargeDispositionCode">
      <sch:assert id="a-1198-32177-warning" test="count(cda:code)=1">This sdtc:dischargeDispositionCode SHOULD contain exactly [1..1] @code, which SHOULD be selected from ValueSet 2.16.840.1.113883.3.88.12.80.33 NUBC UB-04 FL17-Patient Status (code system 2.16.840.1.113883.6.301.5) DYNAMIC or, if access to NUBC is unavailable, from CodeSystem 2.16.840.1.113883.12.112 HL7 Discharge Disposition (CONF:1198-32177).</sch:assert>
      <sch:assert id="a-1198-32377-warning" test="count(cda:codeSystem)=1">This sdtc:dischargeDispositionCode SHOULD contain exactly [1..1] @codeSystem, which SHOULD be either CodeSystem: NUBC 2.16.840.1.113883.6.301.5 OR CodeSystem: HL7 Discharge Disposition 2.16.840.1.113883.12.112 (CONF:1198-32377).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Product-Instance-pattern-warnings">
    <sch:rule id="Product-Instance-playingDevice-warnings" context="cda:participantRole[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.37']]/cda:playingDevice">
      <sch:assert id="a-81-16837-warning" test="count(cda:code)=1">This playingDevice SHOULD contain zero or one [0..1] code (CONF:81-16837).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned_Immunization_Activity-pattern-warnings">
    <sch:rule id="Planned_Immunization_Activity-doseQuantity-warnings" context="cda:substanceAdministration[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.120']]/cda:doseQuantity">
      <sch:assert id="a-1098-32130-warning" test="@unit">The doseQuantity, if present, SHOULD contain zero or one [0..1] @unit, which SHALL be selected from ValueSet UnitsOfMeasureCaseSensitive urn:oid:2.16.840.1.113883.1.11.12839 DYNAMIC (CONF:1098-32130).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Result-Observation-pattern-warnings">
    <sch:rule id="Result-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.2'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-7147-warning" test="count(cda:interpretationCode)&gt;=1">SHOULD contain zero or more [0..*] interpretationCode (CONF:1198-7147).</sch:assert>
      <sch:assert id="a-1198-7149-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-7149).</sch:assert>
      <sch:assert id="a-1198-7150-warning" test="count(cda:referenceRange)&gt;=1">SHOULD contain zero or more [0..*] referenceRange (CONF:1198-7150).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Immunization_medication_information-pattern-warnings">
    <sch:rule id="Immunization_medication_information-warnings" context="cda:manufacturedProduct[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.54'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-9012-warning" test="count(cda:manufacturerOrganization)=1">SHOULD contain zero or one [0..1] manufacturerOrganization (CONF:1098-9012).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QDM_based_QRDA_V5-pattern-warnings">
    <sch:rule id="QDM_based_QRDA_V5-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.2'][@extension='2017-08-01']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-3343-16592-warning" test="count(cda:id[@root='2.16.840.1.113883.4.2'])=1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:3343-16592) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.2" Tax ID Number (CONF:3343-16593).</sch:assert>
      <sch:assert id="a-3343-16595-warning" test="count(cda:id[@root='2.16.840.1.113883.4.336'][@extension])=1">This representedOrganization SHOULD contain zero or one [0..1] id (CONF:3343-16595) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.336" Facility CMS Certification Number (CONF:3343-16596). SHALL contain exactly one [1..1] @extension (CONF:3343-16597).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Planned-Procedure-pattern-warnings">
    <sch:rule id="Planned-Procedure-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41'][@extension='2014-06-09']]">
      <sch:assert id="a-1098-30447-warning" test="count(cda:effectiveTime)=1">SHOULD contain zero or one [0..1] effectiveTime (CONF:1098-30447).</sch:assert>
      <sch:assert id="a1098-31979-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;=1">SHOULD contain zero or one [0..1] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1098-31979).</sch:assert>
    </sch:rule>
    <sch:rule id="Planned-Procedure-code-warnings" context="cda:procedure[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.41'][@extension='2014-06-09']]/cda:code">
      <sch:assert id="a-1098-31977-warning" test="@codeSystem='2.16.840.1.113883.6.1' or @codeSystem='2.16.840.1.113883.6.96' or @codeSystem='2.16.840.1.113883.6.12' or @codeSystem='2.16.840.1.113883.6.4'">The procedure/code in a planned procedure SHOULD be selected from LOINC (codeSystem 2.16.840.1.113883.6.1) *OR* SNOMED CT (CodeSystem: 2.16.840.1.113883.6.96), and *MAY* be selected from CPT-4 (CodeSystem: 2.16.840.1.113883.6.12) *OR* ICD10 PCS (CodeSystem: 2.16.840.1.113883.6.4) (CONF:1098-31977).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="US-Realm-Date-and-Time-pattern-warnings">
    <sch:rule id="US-Realm-Date-and-Time-effectiveTime-warnings" context="cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]]              | cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.24.1.3']]]             | cda:effectiveTime[parent::cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2016-09-01']]]">
      <sch:assert id="a-81-10128-e-warning" test="string-length(@value)&gt;=12">SHOULD be precise to the minute (CONF:81-10128).</sch:assert>
      <sch:assert id="a-81-10130-e-warning" test="string-length(@value)&lt;10 or ( string-length(@value)&gt;=10 and (contains(@value,'+') or contains(@value,'-')))">If more precise than day, SHOULD include time-zone offset (CONF:81-10130).</sch:assert>
    </sch:rule>
    <sch:rule id="US-Realm-Date-and-Time-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:author/cda:time                                                               | cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.22.1.1']]/cda:legalAuthenticator/cda:time">
      <sch:assert id="a-81-10128-t-warning" test="string-length(@value)&gt;=12">SHOULD be precise to the minute (CONF:81-10128).</sch:assert>
      <sch:assert id="a-81-10130-t-warning" test="string-length(@value)&lt;10 or ( string-length(@value)&gt;=10 and (contains(@value,'+') or contains(@value,'-')))">If more precise than day, SHOULD include time-zone offset (CONF:81-10130).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Problem-Concern-Act-pattern-warnings">
    <sch:rule id="Problem-Concern-Act-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.3'][@extension='2015-08-01']]">
      <sch:assert id="a-1198-31146-warning" test="count(cda:author[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.119']])&gt;= 1">SHOULD contain zero or more [0..*] Author Participation (identifier: urn:oid:2.16.840.1.113883.10.20.22.4.119) (CONF:1198-31146).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Deceased-Observation-pattern-warnings">
    <sch:rule id="Deceased-Observation-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.79']]">
      <sch:assert id="a-1198-14868-warning" test="count(cda:entryRelationship[@typeCode='CAUS'][@inversionInd='true'] [count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.22.4.4'][@extension='2015-08-01']])=1])&lt;=1">SHOULD contain zero or one [0..1] entryRelationship (CONF:1198-14868) such that it SHALL contain exactly one [1..1] @typeCode="CAUS" Is etiology for (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:1198-14875). SHALL contain exactly one [1..1] @inversionInd="true" True (CONF:1198-32900). SHALL contain exactly one [1..1] Problem Observation (V3) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.22.4.4:2015-08-01) (CONF:1198-14870).</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>