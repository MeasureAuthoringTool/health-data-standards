<?xml version="1.0" encoding="UTF-8"?>

<!--  
THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL ESAC INC., OR ANY OF THEIR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Schematron file generated July 6, 2016
Version 1.0   
-->

<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:voc="http://www.lantanagroup.com/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
  <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
  <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
  <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
  <sch:phase id="errors">
    <sch:active pattern="Aggregate_count-pattern-errors" />
    <sch:active pattern="Continuous_variable_measure_value-pattern-errors" />
    <sch:active pattern="Ethnicity_supp_data_element-pattern-errors" />
    <sch:active pattern="Measure_data-pattern-errors" />
    <sch:active pattern="Measure_Reference-pattern-errors" />
    <sch:active pattern="Measure_Reference_and_Results-pattern-errors" />
    <sch:active pattern="Payer_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Performance_Rate_for_Proportion_Measure-pattern-errors" />
    <sch:active pattern="Postal_Code_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Measure-pattern-errors" />
    <sch:active pattern="QRDA_Category_III-pattern-errors" />
    <sch:active pattern="QRDA_Category_III_Reporting_Parameters-pattern-errors" />
    <sch:active pattern="Race_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Reporting_Rate_for_Proportion_Measure-pattern-errors" />
    <sch:active pattern="Reporting_Stratum-pattern-errors" />
    <sch:active pattern="Service_Encounter-pattern-errors" />
    <sch:active pattern="Sex_Supplemental_Data_Element-pattern-errors" />
    <sch:active pattern="Measure-section-pattern-errors" />
    <sch:active pattern="Reporting-parameters-section-pattern-errors" />
    <sch:active pattern="Reporting-Parameters-Act-pattern-errors" />
  </sch:phase>
  <sch:phase id="warnings">
    <sch:active pattern="Measure_Reference-pattern-warnings" />
    <sch:active pattern="Measure_Reference_and_Results-pattern-warnings" />
    <sch:active pattern="QRDA_Category_III-pattern-warnings" />
    <sch:active pattern="Reporting_Stratum-pattern-warnings" />
  </sch:phase>
  <sch:pattern id="Aggregate_count-pattern-errors">
    <sch:rule id="Aggregate_count-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]">
      <sch:assert id="a-77-17563-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17563).</sch:assert>
      <sch:assert id="a-77-17564-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17564).</sch:assert>
      <sch:assert id="a-77-17565-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-17565) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.3" (CONF:77-18095).</sch:assert>
      <sch:assert id="a-77-17566-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17566).</sch:assert>
      <sch:assert id="a-77-17567-error" test="count(cda:value[@xsi:type='INT'])=1">SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-17567).</sch:assert>
      <sch:assert id="a-77-19509-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode (CONF:77-19509).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:code">
      <sch:assert id="a-77-19508-error" test="@code='MSRAGG'">This code SHALL contain exactly one [1..1] @code="MSRAGG" rate aggregation (CONF:77-19508).</sch:assert>
      <sch:assert id="a-77-21160-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21160).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:value[@xsi:type='INT']">
      <sch:assert id="a-77-17568-error" test="@value">This value SHALL contain exactly one [1..1] @value (CONF:77-17568).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-methodCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:methodCode">
      <sch:assert id="a-77-19510-error" test="@code='COUNT'">This methodCode SHALL contain exactly one [1..1] @code="COUNT" Count (CONF:77-19510).</sch:assert>
      <sch:assert id="a-77-21161-error" test="@codeSystem='2.16.840.1.113883.5.84'">This methodCode SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.84" (CodeSystem: ObservationMethod urn:oid:2.16.840.1.113883.5.84) (CONF:77-21161).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:referenceRange">
      <sch:assert id="a-77-18393-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18393).</sch:assert>
    </sch:rule>
    <sch:rule id="Aggregate_count-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18394-error" test="count(cda:value[@xsi:type='INT'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:77-18394).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Continuous_variable_measure_value-pattern-errors">
    <sch:rule id="Continuous_variable_measure_value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]">
      <sch:assert id="a-77-17569-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17569).</sch:assert>
      <sch:assert id="a-77-17570-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17570).</sch:assert>
      <sch:assert id="a-77-18096-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18096) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.2" (CONF:77-18097).</sch:assert>
      <sch:assert id="a-77-17571-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17571).</sch:assert>
      <sch:assert id="a-77-17572-error" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:77-17572).</sch:assert>
      <sch:assert id="a-77-18242-error" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode, which SHALL be selected from ValueSet ObservationMethodAggregate urn:oid:2.16.840.1.113883.1.11.20450 DYNAMIC (CONF:77-18242).</sch:assert>
      <sch:assert id="a-77-18243-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18243).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:reference">
      <sch:assert id="a-77-18244-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18244).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-77-18245-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18245).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:referenceRange">
      <sch:assert id="a-77-18390-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18390).</sch:assert>
    </sch:rule>
    <sch:rule id="Continuous_variable_measure_value-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18391-error" test="count(cda:value)=1">This observationRange SHALL contain exactly one [1..1] value (CONF:77-18391).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Ethnicity_supp_data_element-pattern-errors">
    <sch:rule id="Ethnicity_supp_data_element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]">
      <sch:assert id="a-77-18216-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18216).</sch:assert>
      <sch:assert id="a-77-18217-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18217).</sch:assert>
      <sch:assert id="a-77-18218-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18218) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.7" (CONF:77-18219).</sch:assert>
      <sch:assert id="a-77-18220-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18220).</sch:assert>
      <sch:assert id="a-77-18118-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18118).</sch:assert>
      <sch:assert id="a-77-18222-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Ethnicity urn:oid:2.16.840.1.114222.4.11.837 DYNAMIC (CONF:77-18222).</sch:assert>
      <sch:assert id="a-77-18120-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18120) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18121). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18122). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18123).</sch:assert>
    </sch:rule>
    <sch:rule id="Ethnicity_supp_data_element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]/cda:code">
      <sch:assert id="a-77-18221-error" test="@code='364699009'">This code SHALL contain exactly one [1..1] @code="364699009" Ethnic Group (CONF:77-18221).</sch:assert>
      <sch:assert id="a-77-21164-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21164).</sch:assert>
    </sch:rule>
    <sch:rule id="Ethnicity_supp_data_element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]/cda:statusCode">
      <sch:assert id="a-77-18119-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18119).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_data-pattern-errors">
    <sch:rule id="Measure_data-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]">
      <sch:assert id="a-2226-17615-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17615).</sch:assert>
      <sch:assert id="a-2226-17616-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-17616).</sch:assert>
      <sch:assert id="a-2226-17912-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:2226-17913). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21161).</sch:assert>
      <sch:assert id="a-2226-17617-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-17617).</sch:assert>
      <sch:assert id="a-2226-18199-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18199).</sch:assert>
      <sch:assert id="a-2226-17618-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD" (CONF:2226-17618).</sch:assert>
      <sch:assert id="a-2226-17619-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-17619) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:2226-17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-17911). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-17620).</sch:assert>
      <sch:assert id="a-2226-18239-error" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2226-18239) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2226-18240). This externalObservation SHALL contain exactly one [1..1] id (CONF:2226-18241).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:code">
      <sch:assert id="a-2226-18198-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:2226-18198).</sch:assert>
      <sch:assert id="a-2226-21164-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:2226-21164).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:statusCode">
      <sch:assert id="a-2226-19555-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19555).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_data-value-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:value[@xsi:type='CD']">
      <sch:assert id="a-2226-21162-error" test="@code">This value SHALL contain exactly one [1..1] @code, which SHOULD be selected from ValueSet PopulationInclusionObservationType urn:oid:2.16.840.1.113883.1.11.20476 DYNAMIC (CONF:2226-21162).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference-pattern-warnings">
    <sch:rule id="Measure_Reference-reference-externalDocument-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-67-12997-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:12997).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference-pattern-errors">
    <sch:rule id="Measure_Reference-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:assert id="a-67-12979-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:67-12979).</sch:assert>
      <sch:assert id="a-67-12980-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:67-12980).</sch:assert>
      <sch:assert id="a-67-19532-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'])=1">SHALL contain exactly one [1..1] templateId (CONF:19532) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:19533).</sch:assert>
      <sch:assert id="a-67-26992-error" test="count(cda:id)&gt;=1">SHALL contain at least one [1..*] id (CONF:67-26992).</sch:assert>
      <sch:assert id="a-67-12981-error" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:67-12981).</sch:assert>
      <sch:assert id="a-67-12982-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'] [count(cda:id[@root])&gt;=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:12982) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:12983).  SHALL contain exactly one [1..1] externalDocument (CONF:12984).  This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:19534).  This externalDocument SHALL contain at least one [1..*] id (CONF:12985) such that it  SHALL contain exactly one [1..1] @root (CONF:12986).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference_and_Results-pattern-warnings">
    <sch:rule id="Measure_Reference_and_Results-warnings" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
      <sch:assert id="a-2226-18353-warning" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1][count(cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1'])=1][count(cda:text)=1])=1])=1">SHOULD contain exactly one [1..1] reference (CONF:2226-18353) such that it SHALL contain exactly one [1..1] externalObservation (CONF:2226-18354). This externalObservation SHALL contain at least one [1..*] id (CONF:2226-18355). This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19554). This externalObservation SHALL contain exactly one [1..1] text (CONF:2226-18358).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-warnings" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference/cda:externalDocument">
      <sch:assert id="a-2226-17896-warning" test="count(cda:code)=1">This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1 STATIC) (CONF:2226-17896).</sch:assert>
      <sch:assert id="a-2226-17897-warning" test="count(cda:text)=1">This externalDocument SHOULD contain zero or one [0..1] text (CONF:2226-17897).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure_Reference_and_Results-pattern-errors">
    <sch:rule id="Measure_Reference_and_Results-errors" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
      <sch:assert id="a-2226-17887-error" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17887).</sch:assert>
      <sch:assert id="a-2226-17888-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-17888).</sch:assert>
      <sch:assert id="a-2226-17908-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17908) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:2226-17909). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21170).</sch:assert>
      <sch:assert id="a-2226-17889-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-17889).</sch:assert>
      <sch:assert id="a-2226-17890-error" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'][count(cda:id [@root='2.16.840.1.113883.4.738'] [@extension])=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:2226-17890) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:2226-17891). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-17892). This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:2226-19548). This externalDocument SHALL contain exactly one [1..1] id (CONF:2226-18192) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:2226-18193).  SHALL contain exactly one [1..1] @extension (CONF:2226-21169).</sch:assert>
      <sch:assert id="a-2226-18425-error" test="count(cda:component[count(cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5' and @extension = '2016-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:2226-18425) such that it SHALL contain exactly one [1..1] Measure Data (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.5:2016-02-01) (CONF:2226-18426).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-statusCode-errors" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:statusCode">
      <sch:assert id="a-2226-19552-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19552).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure_Reference_and_Results-reference-externalDocument-code-errors" context="cda:ogranizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference/cda:externalDocument/cda:code">
      <sch:assert id="a-2226-19553-error" test="@code='57024-2'">The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-19553).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Payer_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Payer_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]">
      <sch:assert id="a-2226-21155-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-21155).</sch:assert>
      <sch:assert id="a-2226-21156-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-21156).</sch:assert>
      <sch:assert id="a-2226-18237-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-18237) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.9" (CONF:2226-18238). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21157).</sch:assert>
      <sch:assert id="a-2226-21158-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-21158).</sch:assert>
      <sch:assert id="a-2226-18106-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-18106).</sch:assert>
      <sch:assert id="a-2226-18250-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet Payer urn:oid:2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:2226-18250).</sch:assert>
      <sch:assert id="a-2226-18108-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-18108) such that it SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-18111). SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2226-18109). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-18110).</sch:assert>
    </sch:rule>
    <sch:rule id="Payer_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]/cda:code">
      <sch:assert id="a-2226-21159-error" test="@code='48768-6'">This code SHALL contain exactly one [1..1] @code="48768-6" Payment source  (CONF:2226-21159).</sch:assert>
      <sch:assert id="a-2226-21165-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-21165).</sch:assert>
    </sch:rule>
    <sch:rule id="Payer_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]/cda:statusCode">
      <sch:assert id="a-2226-18107-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18107).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Performance_Rate_for_Proportion_Measure-pattern-errors">
    <sch:rule id="Performance_Rate_for_Proportion_Measure-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]">
      <sch:assert id="a-77-18395-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18395).</sch:assert>
      <sch:assert id="a-77-18396-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18396).</sch:assert>
      <sch:assert id="a-77-19649-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-19649) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:77-19650).</sch:assert>
      <sch:assert id="a-77-18397-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18397).</sch:assert>
      <sch:assert id="a-77-18421-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18421).</sch:assert>
      <sch:assert id="a-77-18399-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18399).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:code">
      <sch:assert id="a-77-18398-error" test="@code='72510-1'">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CONF:77-18398).</sch:assert>
      <sch:assert id="a-77-21170-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:77-21170).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:statusCode">
      <sch:assert id="a-77-18422-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18422).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference">
      <sch:assert id="a-77-19652-error" test="@typeCode='REFR'">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002) (CONF:77-19652).</sch:assert>
      <sch:assert id="a-77-19653-error" test="count(cda:externalObservation)=1">The reference, if present, SHALL contain exactly one [1..1] externalObservation (CONF:77-19653).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-77-19654-error" test="@classCode">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6) (CONF:77-19654).</sch:assert>
      <sch:assert id="a-77-19657-error" test="count(cda:code)=1">This externalObservation SHALL contain exactly one [1..1] code (CONF:77-19657).</sch:assert>
      <sch:assert id="a-77-19655-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-19655).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-id-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation/cda:id">
      <sch:assert id="a-77-19656-error" test="@root">This id SHALL contain exactly one [1..1] @root (CONF:77-19656).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-reference-externalObservation-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:reference/cda:externalObservation/cda:code">
      <sch:assert id="a-77-19658-error" test="@code='NUMER'">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CONF:77-19658).</sch:assert>
      <sch:assert id="a-77-21165-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21165).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:referenceRange">
      <sch:assert id="a-77-18401-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18401).</sch:assert>
    </sch:rule>
    <sch:rule id="Performance_Rate_for_Proportion_Measure-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18402-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18402).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Postal_Code_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Postal_Code_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]">
      <sch:assert id="a-77-18209-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18209).</sch:assert>
      <sch:assert id="a-77-18210-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18210).</sch:assert>
      <sch:assert id="a-77-18211-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18211) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.10" (CONF:77-18212).</sch:assert>
      <sch:assert id="a-77-18213-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18213).</sch:assert>
      <sch:assert id="a-77-18100-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18100).</sch:assert>
      <sch:assert id="a-77-18215-error" test="count(cda:value[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] value with @xsi:type="ST" (CONF:77-18215).</sch:assert>
      <sch:assert id="a-77-18102-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18102) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18103). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18104). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18105).</sch:assert>
    </sch:rule>
    <sch:rule id="Postal_Code_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]/cda:code">
      <sch:assert id="a-77-18214-error" test="@code='184102003'">This code SHALL contain exactly one [1..1] @code="184102003" Patient postal code (CONF:77-18214).</sch:assert>
      <sch:assert id="a-77-21166-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21166).</sch:assert>
    </sch:rule>
    <sch:rule id="Postal_Code_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]/cda:statusCode">
      <sch:assert id="a-77-18101-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18101).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Measure-pattern-errors">
    <sch:rule id="QRDA_Category_III_Measure-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']]">
      <sch:assert id="a-2226-17284-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:2226-17285). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21171).</sch:assert>
      <sch:assert id="a-2226-17906-error" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'][@extension='2016-02-01']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:2226-17906) such that it SHALL contain exactly one [1..1] Measure Reference and Results (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.3.1:2016-02-01) (CONF:2226-17907)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III-pattern-errors">
    <sch:rule id="QRDA_Category_III-errors" context="cda:ClinicalDocument">
      <sch:assert id="a-2226-17226-error" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:2226-17226).</sch:assert>
      <sch:assert id="a-2226-18186-error" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:2226-18186).</sch:assert>
      <sch:assert id="a-2226-17208-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'][@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:2226-17209). SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21168).</sch:assert>
      <sch:assert id="a-2226-17236-error" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:2226-17236).</sch:assert>
      <sch:assert id="a-2226-17210-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-17210).</sch:assert>
      <sch:assert id="a-2226-17211-error" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:2226-17211).</sch:assert>
      <sch:assert id="a-2226-17237-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:2226-17237).</sch:assert>
      <sch:assert id="a-2226-17238-error" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:2226-17238).</sch:assert>
      <sch:assert id="a-2226-17239-error" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:2226-17239).</sch:assert>
      <sch:assert id="a-2226-17212-error" test="count(cda:recordTarget)=1">SHALL contain exactly one [1..1] recordTarget (CONF:2226-17212).</sch:assert>
      <sch:assert id="a-2226-18156-error" test="count(cda:author[count(cda:time)=1][count(cda:assignedAuthor)=1]) &gt; 0">SHALL contain at least one [1..*] author (CONF:2226-18156) such that it SHALL contain exactly one [1..1] time (CONF:2226-18158). SHALL contain exactly one [1..1] assignedAuthor (CONF:2226-18157).</sch:assert>
      <sch:assert id="a-2226-17213-error" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:2226-17213).</sch:assert>
      <sch:assert id="a-2226-17225-error" test="count(cda:legalAuthenticator)=1">SHALL contain exactly one [1..1] legalAuthenticator (CONF:2226-17225).</sch:assert>
      <sch:assert id="a-2226-17217-error" test="count(cda:component)=1">SHALL contain exactly one [1..1] component (CONF:2226-17217).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-typeId-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:typeId">
      <sch:assert id="a-2226-18187-error" test="@root='2.16.840.1.113883.1.3'">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:2226-18187).</sch:assert>
      <sch:assert id="a-2226-18188-error" test="@extension='POCD_HD000040'">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:2226-18188).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-realmCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:realmCode">
      <sch:assert id="a-2226-17227-error" test="@code='US'">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:2226-17227).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:code">
      <sch:assert id="a-2226-19549-error" test="@code='55184-6'">This code SHALL contain exactly one [1..1] @code="55184-6" Quality Reporting Document Architecture Calculated Summary Report (CONF:2226-19549).</sch:assert>
      <sch:assert id="a-2226-21166-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:2226-21166).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-languageCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:languageCode">
      <sch:assert id="a-2226-19669-error" test="@code">This languageCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Language urn:oid:2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:2226-19669).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-recordTarget-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:recordTarget">
      <sch:assert id="a-2226-17232-error" test="count(cda:patientRole[count(cda:id[@nullFlavor='NA'])=1])=1" />
    </sch:rule>
    <sch:rule id="QRDA_Category_III-author-assignedAuthor-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:author/cda:assignedAuthor">
      <sch:assert id="a-2226-18163-error" test="count(cda:representedOrganization)=1">This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:2226-18163).</sch:assert>
      <sch:assert id="a-2226-19667-error" test="count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:2226-19667).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-author-assignedAuthor-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:author/cda:assignedAuthor/cda:representedOrganization">
      <sch:assert id="a-2226-18265-error" test="count(cda:name) &gt; 0">This representedOrganization SHALL contain at least one [1..*] name (CONF:2226-18265).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-author-assignedAuthor-assignedAuthoringDevice-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:author/cda:assignedAuthor/cda:assignedAuthoringDevice">
      <sch:assert id="a-2226-18262-error" test="count(cda:softwareName)=1">The assignedAuthoringDevice, if present, SHALL contain exactly one [1..1] softwareName (CONF:2226-18262).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-custodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:custodian">
      <sch:assert id="a-2226-17214-error" test="count(cda:assignedCustodian)=1">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:2226-17214).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-custodian-assignedCustodian-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:custodian/cda:assignedCustodian">
      <sch:assert id="a-2226-17215-error" test="count(cda:representedCustodianOrganization)=1">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:2226-17215).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-custodian-assignedCustodian-representedCustodianOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-2226-18165-error" test="count(cda:id) &gt; 0">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:2226-18165).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-legalAuthenticator-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:legalAuthenticator">
      <sch:assert id="a-2226-18167-error" test="count(cda:time)=1">This legalAuthenticator SHALL contain exactly one [1..1] time (CONF:2226-18167).</sch:assert>
      <sch:assert id="a-2226-18168-error" test="count(cda:signatureCode)=1">This legalAuthenticator SHALL contain exactly one [1..1] signatureCode (CONF:2226-18168).</sch:assert>
      <sch:assert id="a-2226-19670-error" test="count(cda:assignedEntity)=1">This legalAuthenticator SHALL contain exactly one [1..1] assignedEntity (CONF:2226-19670).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-legalAuthenticator-signatureCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:legalAuthenticator/cda:signatureCode">
      <sch:assert id="a-2226-18169-error" test="@code='S'">This signatureCode SHALL contain exactly one [1..1] @code="S" (CONF:2226-18169).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-legalAuthenticator-assignedEntity-representedOrganization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2226-19672-error" test="count(cda:id) &gt; 0">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:2226-19672).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf">
      <sch:assert id="a-2226-18171-error" test="count(cda:serviceEvent)=1">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:2226-18171).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-serviceEvent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf/cda:serviceEvent">
      <sch:assert id="a-2226-18172-error" test="@classCode='PCPR'">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-18172).</sch:assert>
      <sch:assert id="a-2226-18173-error" test="count(cda:performer) &gt; 0">This serviceEvent SHALL contain at least one [1..*] performer (CONF:2226-18173).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-serviceEvent-performer-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf/cda:serviceEvent/cda:performer">
      <sch:assert id="a-2226-18174-error" test="@typeCode='PRF'">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CodeSystem: HL7ParticipationType urn:oid:2.16.840.1.113883.5.90 STATIC) (CONF:2226-18174).</sch:assert>
      <sch:assert id="a-2226-18176-error" test="count(cda:assignedEntity)=1">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:2226-18176).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-serviceEvent-performer-assignedEntity-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity">
      <sch:assert id="a-2226-19474-error" test="count(cda:id) &gt; 0">This assignedEntity SHALL contain at least one [1..*] id (CONF:2226-19474).</sch:assert>
      <sch:assert id="a-2226-18180-error" test="count(cda:representedOrganization)=1">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:2226-18180).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-authorization-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:authorization">
      <sch:assert id="a-2226-18360-error" test="count(cda:consent)=1">The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:2226-18360).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-authorization-consent-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:authorization/cda:consent">
      <sch:assert id="a-2226-18361-error" test="count(cda:id)=1">This consent SHALL contain exactly one [1..1] id (CONF:2226-18361).</sch:assert>
      <sch:assert id="a-2226-18363-error" test="count(cda:code)=1">This consent SHALL contain exactly one [1..1] code (CONF:2226-18363).</sch:assert>
      <sch:assert id="a-2226-18364-error" test="count(cda:statusCode)=1">This consent SHALL contain exactly one [1..1] statusCode (CONF:2226-18364).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-authorization-consent-code-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:authorization/cda:consent/cda:code">
      <sch:assert id="a-2226-19550-error" test="@code='425691002'">This code SHALL contain exactly one [1..1] @code="425691002" Consent given for electronic record sharing (CONF:2226-19550).</sch:assert>
      <sch:assert id="a-2226-21172-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:2226-21172).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-authorization-consent-statusCode-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:authorization/cda:consent/cda:statusCode">
      <sch:assert id="a-2226-19551-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14) (CONF:2226-19551).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-component-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:component">
      <sch:assert id="a-2226-17235-error" test="count(cda:structuredBody)=1">This component SHALL contain exactly one [1..1] structuredBody (CONF:2226-17235).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-component-structuredBody-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:component/cda:structuredBody">
      <sch:assert id="a-2226-17281-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2226-17281) such that it SHALL contain exactly one [1..1] QRDA Category III Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.27.2.2) (CONF:2226-17282).</sch:assert>
      <sch:assert id="a-2226-17283-error" test="count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'][@extension='2016-02-01']])=1])=1">This structuredBody SHALL contain exactly one [1..1] component (CONF:2226-17283) such that it SHALL contain exactly one [1..1] QRDA Category III Measure Section (V2) (identifier: urn:hl7ii:2.16.840.1.113883.10.20.27.2.1:2016-02-01) (CONF:2226-17301).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III-pattern-warnings">
    <sch:rule id="QRDA_Category_III-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]">
      <sch:assert id="a-2226-17238-v-warning" test="count(cda:confidentialityCode[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value])=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind urn:oid:2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:2226-17238).</sch:assert>
      <sch:assert id="a-2226-18260-warning" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:2226-18260).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-custodian-assignedCustodian-representedCustodianOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
      <sch:assert id="a-2226-18166-warning" test="count(cda:name)=1">This representedCustodianOrganization SHOULD contain zero or one [0..1] name (CONF:2226-18166).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-legalAuthenticator-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2226-19673-warning" test="count(cda:name)=1">The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:2226-19673).</sch:assert>
    </sch:rule>
    <sch:rule id="QRDA_Category_III-documentationOf-serviceEvent-performer-assignedEntity-representedOrganization-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]/cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization">
      <sch:assert id="a-2226-19659-warning" test="count(cda:name) &gt; 0">This representedOrganization SHOULD contain zero or more [0..*] name (CONF:2226-19659).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="QRDA_Category_III_Reporting_Parameters-pattern-errors">
    <sch:rule id="QRDA_Category_III_Reporting_Parameters-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']]">
      <sch:assert id="a-1109-18323-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:18323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.2" (CONF:18324).</sch:assert>
      <sch:assert id="a-1109-18325-error" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1]) &gt; 0" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Race_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Race_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]">
      <sch:assert id="a-77-18223-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18223).</sch:assert>
      <sch:assert id="a-77-18224-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18224).</sch:assert>
      <sch:assert id="a-77-18225-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18225) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.8" (CONF:77-18226).</sch:assert>
      <sch:assert id="a-77-18227-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18227).</sch:assert>
      <sch:assert id="a-77-18112-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18112).</sch:assert>
      <sch:assert id="a-77-18114-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-18114) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18115). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-18116). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-18117).</sch:assert>
      <sch:assert id="a-77-18229-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Race urn:oid:2.16.840.1.114222.4.11.836 DYNAMIC (CONF:77-18229).</sch:assert>
    </sch:rule>
    <sch:rule id="Race_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]/cda:code">
      <sch:assert id="a-77-18228-error" test="@code='103579009'">This code SHALL contain exactly one [1..1] @code="103579009" Race (CONF:77-18228).</sch:assert>
      <sch:assert id="a-77-21167-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96) (CONF:77-21167).</sch:assert>
    </sch:rule>
    <sch:rule id="Race_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]/cda:statusCode">
      <sch:assert id="a-77-18113-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18113).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Rate_for_Proportion_Measure-pattern-errors">
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]">
      <sch:assert id="a-77-18411-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18411).</sch:assert>
      <sch:assert id="a-77-18412-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-18412).</sch:assert>
      <sch:assert id="a-77-21157-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-21157) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.15" (CONF:77-21158).</sch:assert>
      <sch:assert id="a-77-18413-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-18413).</sch:assert>
      <sch:assert id="a-77-18419-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-18419).</sch:assert>
      <sch:assert id="a-77-18415-error" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18415).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:code">
      <sch:assert id="a-77-18414-error" test="@code='72509-3'">This code SHALL contain exactly one [1..1] @code="72509-3" Reporting Rate (CONF:77-18414).</sch:assert>
      <sch:assert id="a-77-21168-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:77-21168).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:statusCode">
      <sch:assert id="a-77-18420-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18420).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-referenceRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:referenceRange">
      <sch:assert id="a-77-18417-error" test="count(cda:observationRange)=1">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:77-18417).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Rate_for_Proportion_Measure-referenceRange-observationRange-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]/cda:referenceRange/cda:observationRange">
      <sch:assert id="a-77-18418-error" test="count(cda:value[@xsi:type='REAL'])=1">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:77-18418).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Stratum-pattern-warnings">
    <sch:rule id="Reporting_Stratum-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:assert id="a-77-17580-warning" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:17580).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Reporting_Stratum-pattern-errors">
    <sch:rule id="Reporting_Stratum-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:assert id="a-77-17575-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-17575).</sch:assert>
      <sch:assert id="a-77-17576-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-17576).</sch:assert>
      <sch:assert id="a-77-18093-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18093) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.4" (CONF:77-18094).</sch:assert>
      <sch:assert id="a-77-17577-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:77-17577).</sch:assert>
      <sch:assert id="a-77-17579-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:77-17579).</sch:assert>
      <sch:assert id="a-77-17581-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:77-17581) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:77-17582). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:77-17583). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:77-17584).</sch:assert>
      <sch:assert id="a-77-18204-error" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:77-18204).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:code">
      <sch:assert id="a-77-17578-error" test="@code='ASSERTION'">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CONF:77-17578).</sch:assert>
      <sch:assert id="a-77-21169-error" test="@codeSystem='2.16.840.1.113883.5.4'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.5.4" (CodeSystem: ActCode urn:oid:2.16.840.1.113883.5.4) (CONF:77-21169).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:statusCode">
      <sch:assert id="a-77-18201-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:77-18201).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-reference-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:reference">
      <sch:assert id="a-77-18205-error" test="@typeCode='REFR'">This reference SHALL contain exactly one [1..1] @typeCode="REFR" (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:77-18205).</sch:assert>
      <sch:assert id="a-77-18206-error" test="count(cda:externalObservation)=1">This reference SHALL contain exactly one [1..1] externalObservation (CONF:77-18206).</sch:assert>
    </sch:rule>
    <sch:rule id="Reporting_Stratum-reference-externalObservation-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]/cda:reference/cda:externalObservation">
      <sch:assert id="a-77-18207-error" test="count(cda:id)=1">This externalObservation SHALL contain exactly one [1..1] id (CONF:77-18207).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Service_Encounter-pattern-errors">
    <sch:rule id="Service_Encounter-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11']]">
      <sch:assert id="a-77-18312-error" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:77-18312).</sch:assert>
      <sch:assert id="a-77-21154-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:77-21154).</sch:assert>
      <sch:assert id="a-77-18369-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11'])=1">SHALL contain exactly one [1..1] templateId (CONF:77-18369) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.11" (CONF:77-18370).</sch:assert>
      <sch:assert id="a-77-18314-error" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:77-18314).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Sex_Supplemental_Data_Element-pattern-errors">
    <sch:rule id="Sex_Supplemental_Data_Element-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]">
      <sch:assert id="a-2226-18230-error" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass urn:oid:2.16.840.1.113883.5.6 STATIC) (CONF:2226-18230).</sch:assert>
      <sch:assert id="a-2226-18231-error" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood urn:oid:2.16.840.1.113883.5.1001 STATIC) (CONF:2226-18231).</sch:assert>
      <sch:assert id="a-2226-18232-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'] [@extension='2016-02-01'])=1">SHALL contain exactly one [1..1] templateId (CONF:2226-18232) such that it  SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.6" (CONF:2226-18233).  SHALL contain exactly one [1..1] @extension="2016-02-01" (CONF:2226-21160).</sch:assert>
      <sch:assert id="a-2226-18234-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:2226-18234).</sch:assert>
      <sch:assert id="a-2226-18124-error" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:2226-18124).</sch:assert>
      <sch:assert id="a-2226-18236-error" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet ONC Administrative Sex urn:oid:2.16.840.1.113762.1.4.1 DYNAMIC (CONF:2226-18236).</sch:assert>
      <sch:assert id="a-2226-18126-error" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:2226-18126) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType urn:oid:2.16.840.1.113883.5.1002 STATIC) (CONF:2226-18127). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:2226-18128). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:2226-18129).</sch:assert>
    </sch:rule>
    <sch:rule id="Sex_Supplemental_Data_Element-code-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]/cda:code">
      <sch:assert id="a-2226-18235-error" test="@code='184100006'">This code SHALL contain exactly one [1..1] @code="184100006" Patient sex (CONF:2226-18235).</sch:assert>
      <sch:assert id="a-2226-21163-error" test="@codeSystem='2.16.840.1.113883.6.96'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.96" (CodeSystem: SNOMED CT urn:oid:2.16.840.1.113883.6.96 STATIC) (CONF:2226-21163).</sch:assert>
    </sch:rule>
    <sch:rule id="Sex_Supplemental_Data_Element-statusCode-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]/cda:statusCode">
      <sch:assert id="a-2226-18125-error" test="@code='completed'">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus urn:oid:2.16.840.1.113883.5.14 STATIC) (CONF:2226-18125).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="Measure-section-pattern-errors">
    <sch:rule id="Measure-section-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:assert id="a-67-12801-error" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:67-12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:67-12802).</sch:assert>
      <sch:assert id="a-67-12798-error" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:67-12798).</sch:assert>
      <sch:assert id="a-67-12799-error" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:67-12799).</sch:assert>
      <sch:assert id="a-67-12800-error" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:67-12800).</sch:assert>
      <sch:assert id="a-67-13003-error" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:67-13003).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure-section-code-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]/cda:code">
      <sch:assert id="a-67-19230-error" test="@code='55186-1'">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CONF:67-19230).</sch:assert>
      <sch:assert id="a-67-27012-error" test="@codeSystem='2.16.840.1.113883.6.1'">This code SHALL contain exactly one [1..1] @codeSystem="2.16.840.1.113883.6.1" (CodeSystem: LOINC urn:oid:2.16.840.1.113883.6.1) (CONF:67-27012).</sch:assert>
    </sch:rule>
    <sch:rule id="Measure-section-entry-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]/cda:entry">
      <sch:assert id="a-67-16677-error" test="count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']])=1">Such entries SHALL contain exactly one [1..1] Measure Reference (identifier: urn:oid:2.16.840.1.113883.10.20.24.3.98) (CONF:67-16677).</sch:assert>
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
</sch:schema>