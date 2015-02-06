<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!-- Schematron generated from Trifolia on 12/23/2014 -->
<sch:schema xmlns:voc="http://www.lantanagroup.com/voc" xmlns:svs="urn:ihe:iti:svs:2008" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <sch:ns prefix="voc" uri="http://www.lantanagroup.com/voc" />
  <sch:ns prefix="svs" uri="urn:ihe:iti:svs:2008" />
  <sch:ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />
  <sch:ns prefix="sdtc" uri="urn:hl7-org:sdtc" />
  <sch:ns prefix="cda" uri="urn:hl7-org:v3" />
  <sch:phase id="errors">
    <sch:active pattern="document-errors" />
    <sch:active pattern="p-DOCUMENT-TEMPLATE" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.1.1-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.2.1-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.5-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.1-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.9-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.6-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors" />
  </sch:phase>
  <sch:phase id="warnings">
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.1.1-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.2.1-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.5-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.1-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.9-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.6-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings" />
    <sch:active pattern="p-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings" />
  </sch:phase>
  <sch:pattern id="document-errors">
    <sch:rule context="cda:ClinicalDocument">
      <sch:assert test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'])=1">This document SHALL conform to template "QRDA Category III Report" (templateId: 2.16.840.1.113883.10.20.27.1.1).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-DOCUMENT-TEMPLATE">
    <sch:rule id="r-errors-DOC-abstract" abstract="true">
      <sch:assert id="a-IG-77-DOC" test="cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']">The document must contain at least 1 of the document level templates for this schematron to be applicable.</sch:assert>
    </sch:rule>
    <sch:rule id="r-errors-DOC" context="cda:ClinicalDocument">
      <sch:extends rule="r-errors-DOC-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors-abstract" abstract="true">
      <sch:assert id="a-23-3269" test="@classCode='ACT'">SHALL contain exactly one [1..1] @classCode="ACT" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:3269).</sch:assert>
      <sch:assert id="a-23-3270" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:3270).</sch:assert>
      <sch:assert id="a-23-3272" test="count(cda:code[@code='252116004'][@codeSystem='2.16.840.1.113883.6.96' or @nullFlavor])=1">SHALL contain exactly one [1..1] code="252116004" Observation Parameters (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96 STATIC) (CONF:3272).</sch:assert>
      <sch:assert id="a-23-3273" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:3273).</sch:assert>
      <sch:assert id="a-23-3274" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:3274).</sch:assert>
      <sch:assert id="a-23-3275" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHALL contain exactly one [1..1] high (CONF:3275).</sch:assert>
      <sch:assert id="a-23-18098" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8'])=1">SHALL contain exactly one [1..1] templateId (CONF:18098) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.3.8" (CONF:18099).</sch:assert>
      <sch:assert id="a-23-26549" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:26549).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" abstract="true">
      <sch:assert id="a-23-3277" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:3277) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:3278). SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:17496).</sch:assert>
      <sch:assert id="a-23-4142" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='reporting parameters'])=1">SHALL contain exactly one [1..1] title="Reporting Parameters" (CONF:4142).</sch:assert>
      <sch:assert id="a-23-4143" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:4143).</sch:assert>
      <sch:assert id="a-23-14611" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1'])=1">SHALL contain exactly one [1..1] templateId (CONF:14611) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.17.2.1" (CONF:14612).</sch:assert>
      <sch:assert id="a-23-18191-c" test="count(cda:code[@code='55187-9'][@codeSystem='2.16.840.1.113883.6.1'])">SHALL contain exactly one [1..1] code (CONF:18191).</sch:assert>
      <sch:assert id="a-23-19229" test="cda:code[@code='55187-9' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="55187-9" Reporting Parameters (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:19229).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors-abstract" abstract="true">
      <sch:assert id="a-67-12561" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55'])=1">SHALL contain exactly one [1..1] templateId (CONF:12561) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.55" (CONF:12562).</sch:assert>
      <sch:assert id="a-67-12564" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:12564).</sch:assert>
      <sch:assert id="a-67-12565" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:12565).</sch:assert>
      <sch:assert id="a-67-14029" test="cda:code[@code='48768-6' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="48768-6" Payment source (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:14029).</sch:assert>
      <sch:assert id="a-67-14213" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:14213).</sch:assert>
      <sch:assert id="a-67-14214" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:14214).</sch:assert>
      <sch:assert id="a-67-16710" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Source of Payment Typology (PHDSC) 2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:16710).</sch:assert>
      <sch:assert id="a-67-26933" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:26933).</sch:assert>
      <sch:assert id="a-67-26934" test="cda:effectiveTime[count(cda:low)=1]">This effectiveTime SHALL contain exactly one [1..1] low (CONF:26934).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" abstract="true">
      <sch:assert id="a-67-12798" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:12798).</sch:assert>
      <sch:assert id="a-67-12799" test="count(cda:title[translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='measure section'])=1">SHALL contain exactly one [1..1] title="Measure Section" (CONF:12799).</sch:assert>
      <sch:assert id="a-67-12800" test="count(cda:text)=1">SHALL contain exactly one [1..1] text (CONF:12800).</sch:assert>
      <sch:assert id="a-67-12801" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:12801) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.2.2" (CONF:12802).</sch:assert>
      <sch:assert id="a-67-13003" test="count(cda:entry) &gt; 0">SHALL contain at least one [1..*] entry (CONF:13003).</sch:assert>
      <sch:assert id="a-67-19230" test="cda:code[@code='55186-1' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="55186-1" Measure Section (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:19230).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" abstract="true">
      <sch:assert id="a-67-12979" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" cluster (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:12979).</sch:assert>
      <sch:assert id="a-67-12980" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:12980).</sch:assert>
      <sch:assert id="a-67-12981" test="count(cda:statusCode[@code='completed'])=1">SHALL contain exactly one [1..1] statusCode="completed" completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:12981).</sch:assert>
      <sch:assert id="a-67-12982" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument)=1])=1">SHALL contain exactly one [1..1] reference (CONF:12982) such that it SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:12983). SHALL contain exactly one [1..1] externalDocument (CONF:12984).</sch:assert>
      <sch:assert id="a-67-26992" test="count(cda:id) &gt; 0">SHALL contain at least one [1..*] id (CONF:26992).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" />
      <sch:assert id="a-67-19532" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98'])=1">SHALL contain exactly one [1..1] templateId (CONF:19532) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.24.3.98" (CONF:19533).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors-abstract" abstract="true">
      <sch:assert id="a-67-12985-branch-12982" test="cda:externalDocument[count(cda:id[@root]) &gt; 0]">This externalDocument SHALL contain at least one [1..*] id (CONF:12985) such that it SHALL contain exactly one [1..1] @root (CONF:12986).</sch:assert>
      <sch:assert id="a-67-12998-branch-12982-c" test="not(testable)">This text is the title of the eMeasure (CONF:12998).</sch:assert>
      <sch:assert id="a-67-19534-branch-12982" test="cda:externalDocument[@classCode='DOC']">This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6) (CONF:19534).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors-abstract" abstract="true">
      <sch:assert id="a-67-27008-branch-12985-c" test=".">This ID references an ID of the Quality Measure (CONF:27008).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument][cda:id[@root]]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12985-branch-12985-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.1.1-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.1.1-errors-abstract" abstract="true">
      <sch:assert id="a-77-17208" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1'])=1">SHALL contain exactly one [1..1] templateId (CONF:17208) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.1.1" (CONF:17209).</sch:assert>
      <sch:assert id="a-77-17210" test="count(cda:code[@codeSystem='2.16.840.1.113883.6.1' or @nullFlavor])=1">SHALL contain exactly one [1..1] code (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:17210).</sch:assert>
      <sch:assert id="a-77-17211" test="count(cda:title)=1">SHALL contain exactly one [1..1] title (CONF:17211).</sch:assert>
      <sch:assert id="a-77-17212" test="count(cda:recordTarget)=1">QRDA III is an aggregate summary report. Therefore CDA's required recordTarget/id is nulled.  The recordTarget element is designed for single patient data and is required in all CDA documents. In this case, the document does not contain results for a single patient, but rather for groups of patients, and thus the recordTarget ID in QRDA Category III documents contains a nullFlavor attribute (is nulled).
SHALL contain exactly one [1..1] recordTarget (CONF:17212).</sch:assert>
      <sch:assert id="a-77-17213" test="count(cda:custodian)=1">SHALL contain exactly one [1..1] custodian (CONF:17213).</sch:assert>
      <sch:assert id="a-77-17214" test="cda:custodian[count(cda:assignedCustodian)=1]">This custodian SHALL contain exactly one [1..1] assignedCustodian (CONF:17214).</sch:assert>
      <sch:assert id="a-77-17215" test="cda:custodian/cda:assignedCustodian[count(cda:representedCustodianOrganization)=1]">This assignedCustodian SHALL contain exactly one [1..1] representedCustodianOrganization (CONF:17215).</sch:assert>
      <sch:assert id="a-77-17217" test="count(cda:component)=1">A QRDA Category III document contains a Reporting Parameters Section and a Measure section.
SHALL contain exactly one [1..1] component (CONF:17217).</sch:assert>
      <sch:assert id="a-77-17225" test="count(cda:legalAuthenticator)=1">SHALL contain exactly one [1..1] legalAuthenticator (CONF:17225).</sch:assert>
      <sch:assert id="a-77-17226" test="count(cda:realmCode)=1">SHALL contain exactly one [1..1] realmCode (CONF:17226).</sch:assert>
      <sch:assert id="a-77-17227" test="cda:realmCode[@code='US']">This realmCode SHALL contain exactly one [1..1] @code="US" (CONF:17227).</sch:assert>
      <sch:assert id="a-77-17232" test="cda:recordTarget[count(cda:patientRole[count(cda:id[@nullFlavor='NA'])=1])=1]">This recordTarget SHALL contain exactly one [1..1] patientRole (CONF:17232) such that it SHALL contain exactly one [1..1] id (CONF:17233). This id SHALL contain exactly one [1..1] @nullFlavor="NA" (CONF:17234).</sch:assert>
      <sch:assert id="a-77-17235" test="cda:component[count(cda:structuredBody)=1]">This component SHALL contain exactly one [1..1] structuredBody (CONF:17235).</sch:assert>
      <sch:assert id="a-77-17236" test="count(cda:id)=1">SHALL contain exactly one [1..1] id (CONF:17236).</sch:assert>
      <sch:assert id="a-77-17237" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:17237).</sch:assert>
      <sch:assert id="a-77-17238" test="count(cda:confidentialityCode)=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind 2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:17238).</sch:assert>
      <sch:assert id="a-77-17239" test="count(cda:languageCode)=1">SHALL contain exactly one [1..1] languageCode (CONF:17239).</sch:assert>
      <sch:assert id="a-77-17281" test="cda:component/cda:structuredBody[count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:17281) such that it SHALL contain exactly one [1..1] QRDA Category III Reporting Parameters Section (identifier: urn:oid:2.16.840.1.113883.10.20.27.2.2) (CONF:17282).</sch:assert>
      <sch:assert id="a-77-17283" test="cda:component/cda:structuredBody[count(cda:component[count(cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']])=1])=1]">This structuredBody SHALL contain exactly one [1..1] component (CONF:17283) such that it SHALL contain exactly one [1..1] QRDA Category III Measure Section (identifier: urn:oid:2.16.840.1.113883.10.20.27.2.1) (CONF:17301).</sch:assert>
      <sch:assert id="a-77-18156" test="count(cda:author[count(cda:assignedAuthor[count(cda:representedOrganization[count(cda:name) &gt; 0])=1])=1][count(cda:time)=1]) &gt; 0">The CDA standard requires an author with an identifier. In addition, the QRDA Category III document type requires that the author be declared as a person or a device. The document can be authored solely by a person or by a device, or the document could be authored by a combination of one or more devices and/or one or more people. 
SHALL contain at least one [1..*] author (CONF:18156) such that it SHALL contain exactly one [1..1] assignedAuthor (CONF:18157). This assignedAuthor SHALL contain exactly one [1..1] representedOrganization (CONF:18163). This representedOrganization SHALL contain at least one [1..*] name (CONF:18265). SHALL contain exactly one [1..1] time (CONF:18158).</sch:assert>
      <sch:assert id="a-77-18165" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:id) &gt; 0]">This representedCustodianOrganization SHALL contain at least one [1..*] id (CONF:18165).</sch:assert>
      <sch:assert id="a-77-18167" test="cda:legalAuthenticator[count(cda:time)=1]">This legalAuthenticator SHALL contain exactly one [1..1] time (CONF:18167).</sch:assert>
      <sch:assert id="a-77-18168" test="cda:legalAuthenticator[count(cda:signatureCode)=1]">This legalAuthenticator SHALL contain exactly one [1..1] signatureCode (CONF:18168).</sch:assert>
      <sch:assert id="a-77-18169" test="cda:legalAuthenticator/cda:signatureCode[@code='S']">This signatureCode SHALL contain exactly one [1..1] @code="S" (CONF:18169).</sch:assert>
      <sch:assert id="a-77-18171" test="not(cda:documentationOf) or cda:documentationOf[count(cda:serviceEvent)=1]">The documentationOf, if present, SHALL contain exactly one [1..1] serviceEvent (CONF:18171).</sch:assert>
      <sch:assert id="a-77-18172" test="not(cda:documentationOf/cda:serviceEvent) or cda:documentationOf/cda:serviceEvent[@classCode='PCPR']">This serviceEvent SHALL contain exactly one [1..1] @classCode="PCPR" Care Provision (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:18172).</sch:assert>
      <sch:assert id="a-77-18173" test="not(cda:documentationOf/cda:serviceEvent) or cda:documentationOf/cda:serviceEvent[count(cda:performer) &gt; 0]">This serviceEvent SHALL contain at least one [1..*] performer (CONF:18173).</sch:assert>
      <sch:assert id="a-77-18174" test="not(cda:documentationOf/cda:serviceEvent/cda:performer) or cda:documentationOf/cda:serviceEvent/cda:performer[@typeCode='PRF']">Such performers SHALL contain exactly one [1..1] @typeCode="PRF" Performer (CodeSystem: HL7ParticipationType 2.16.840.1.113883.5.90 STATIC) (CONF:18174).</sch:assert>
      <sch:assert id="a-77-18176" test="not(cda:documentationOf/cda:serviceEvent/cda:performer) or cda:documentationOf/cda:serviceEvent/cda:performer[count(cda:assignedEntity)=1]">Such performers SHALL contain exactly one [1..1] assignedEntity (CONF:18176).</sch:assert>
      <sch:assert id="a-77-18177" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:id)=1]">This assignedEntity id/@root coupled with the id/@extension can be used to represent the individual provider's National Provider Identification number (NPI). Other assignedEntity ids may be present.
This assignedEntity SHALL contain exactly one [1..1] id (CONF:18177) such that it</sch:assert>
      <sch:assert id="a-77-18180" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:representedOrganization)=1]">This assignedEntity SHALL contain exactly one [1..1] representedOrganization (CONF:18180).</sch:assert>
      <sch:assert id="a-77-18186" test="count(cda:typeId)=1">SHALL contain exactly one [1..1] typeId (CONF:18186).</sch:assert>
      <sch:assert id="a-77-18187" test="cda:typeId[@root='2.16.840.1.113883.1.3']">This typeId SHALL contain exactly one [1..1] @root="2.16.840.1.113883.1.3" (CONF:18187).</sch:assert>
      <sch:assert id="a-77-18188" test="cda:typeId[@extension='POCD_HD000040']">This typeId SHALL contain exactly one [1..1] @extension="POCD_HD000040" (CONF:18188).</sch:assert>
      <sch:assert id="a-77-18189-c" test="cda:effectiveTime[string-length(@value)&gt;=8]">The content SHALL be a conformant US Realm Date and Time (DTM.US.FIELDED) (2.16.840.1.113883.10.20.22.5.4) (CONF:18189).</sch:assert>
      <sch:assert id="a-77-18265-c" test="cda:author/cda:assignedAuthor/cda:representedOrganization[count(cda:name) &lt; 2]">This representedOrganization SHALL contain at least one [1..*] name (CONF:18265).</sch:assert>
      <sch:assert id="a-77-18360" test="not(cda:authorization) or cda:authorization[count(cda:consent)=1]">The authorization, if present, SHALL contain exactly one [1..1] consent (CONF:18360).</sch:assert>
      <sch:assert id="a-77-18361" test="not(cda:authorization/cda:consent) or cda:authorization/cda:consent[count(cda:id)=1]">The consent/id is the identifier of the consent given by the eligible provider. 
This consent SHALL contain exactly one [1..1] id (CONF:18361).</sch:assert>
      <sch:assert id="a-77-18363" test="not(cda:authorization/cda:consent) or cda:authorization/cda:consent[count(cda:code[@codeSystem='2.16.840.1.113883.6.96' or @nullFlavor])=1]">This consent SHALL contain exactly one [1..1] code (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96 STATIC) (CONF:18363).</sch:assert>
      <sch:assert id="a-77-18364" test="not(cda:authorization/cda:consent) or cda:authorization/cda:consent[count(cda:statusCode)=1]">This consent SHALL contain exactly one [1..1] statusCode (CONF:18364).</sch:assert>
      <sch:assert id="a-77-19474" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity[count(cda:id) &gt; 0]">This assignedEntity SHALL contain at least one [1..*] id (CONF:19474).</sch:assert>
      <sch:assert id="a-77-19549" test="cda:code[@code='55184-6' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="55184-6" " Quality Reporting Document Architecture Calculated Summary Report (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:19549).</sch:assert>
      <sch:assert id="a-77-19550" test="not(cda:authorization/cda:consent/cda:code) or cda:authorization/cda:consent/cda:code[@code='425691002' and @codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @code="425691002" Consent given for electronic record sharing (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96) (CONF:19550).</sch:assert>
      <sch:assert id="a-77-19551" test="not(cda:authorization/cda:consent/cda:statusCode) or cda:authorization/cda:consent/cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14) (CONF:19551).</sch:assert>
      <sch:assert id="a-77-19667-c" test="cda:author/cda:assignedAuthor[count(cda:assignedPerson)=1 or count(cda:assignedAuthoringDevice)=1]">There SHALL be exactly one assignedAuthor/assignedPerson or exactly one assignedAuthor/assignedAuthoringDevice (CONF:19667).</sch:assert>
      <sch:assert id="a-77-19669" test="cda:languageCode[@code]">This languageCode SHALL contain exactly one [1..1] @code, which SHALL be selected from ValueSet Language 2.16.840.1.113883.1.11.11526 DYNAMIC (CONF:19669).</sch:assert>
      <sch:assert id="a-77-19670" test="cda:legalAuthenticator[count(cda:assignedEntity)=1]">This legalAuthenticator SHALL contain exactly one [1..1] assignedEntity (CONF:19670).</sch:assert>
      <sch:assert id="a-77-19672" test="not(cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization) or cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization[count(cda:id) &gt; 0]">The representedOrganization, if present, SHALL contain at least one [1..*] id (CONF:19672).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.1.1-errors" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.1.1-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.2.1-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.1-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-errors-abstract" />
      <sch:assert id="a-77-17284" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1'])=1">SHALL contain exactly one [1..1] templateId (CONF:17284) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.1" (CONF:17285).</sch:assert>
      <sch:assert id="a-77-17906" test="count(cda:entry[count(cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']])=1]) &gt; 0">SHALL contain at least one [1..*] entry (CONF:17906) such that it SHALL contain exactly one [1..1] Measure Reference and Results (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.1) (CONF:17907).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.1-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.2.1-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors-abstract" abstract="true">
      <sch:assert id="a-77-17563" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:17563).</sch:assert>
      <sch:assert id="a-77-17564" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:17564).</sch:assert>
      <sch:assert id="a-77-17565" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3'])=1">SHALL contain exactly one [1..1] templateId (CONF:17565) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.3" (CONF:18095).</sch:assert>
      <sch:assert id="a-77-17566" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:17566).</sch:assert>
      <sch:assert id="a-77-17567" test="count(cda:value[@xsi:type='INT'])=1">SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:17567).</sch:assert>
      <sch:assert id="a-77-17568" test="cda:value[@xsi:type='INT'][@value]">This value SHALL contain exactly one [1..1] @value (CONF:17568).</sch:assert>
      <sch:assert id="a-77-18393" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:18393).</sch:assert>
      <sch:assert id="a-77-18394" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value[@xsi:type='INT'])=1]">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="INT" (CONF:18394).</sch:assert>
      <sch:assert id="a-77-19508" test="cda:code[@code='MSRAGG' and @codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @code="MSRAGG" rate aggregation (CodeSystem: ActCode 2.16.840.1.113883.5.4) (CONF:19508).</sch:assert>
      <sch:assert id="a-77-19509" test="count(cda:methodCode)=1">SHALL contain exactly one [1..1] methodCode (CONF:19509).</sch:assert>
      <sch:assert id="a-77-19510" test="cda:methodCode[@code='COUNT']">This methodCode SHALL contain exactly one [1..1] @code="COUNT" Count (CodeSystem: ObservationMethod 2.16.840.1.113883.5.84) (CONF:19510).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors-abstract" abstract="true">
      <sch:assert id="a-77-17569" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:17569).</sch:assert>
      <sch:assert id="a-77-17570" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:17570).</sch:assert>
      <sch:assert id="a-77-17571" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:17571).</sch:assert>
      <sch:assert id="a-77-17572" test="count(cda:value)=1">SHALL contain exactly one [1..1] value (CONF:17572).</sch:assert>
      <sch:assert id="a-77-18096" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:18096) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.2" (CONF:18097).</sch:assert>
      <sch:assert id="a-77-18242" test="count(cda:methodCode[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.20450']/voc:code/@value])=1">SHALL contain exactly one [1..1] methodCode, which SHALL be selected from ValueSet ObservationMethodAggregate 2.16.840.1.113883.1.11.20450 STATIC (CONF:18242).</sch:assert>
      <sch:assert id="a-77-18243" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:18243).</sch:assert>
      <sch:assert id="a-77-18244" test="cda:reference[count(cda:externalObservation)=1]">This reference SHALL contain exactly one [1..1] externalObservation (CONF:18244).</sch:assert>
      <sch:assert id="a-77-18245" test="cda:reference/cda:externalObservation[count(cda:id)=1]">This externalObservation SHALL contain exactly one [1..1] id (CONF:18245).</sch:assert>
      <sch:assert id="a-77-18390" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:18390).</sch:assert>
      <sch:assert id="a-77-18391" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value)=1]">This observationRange SHALL contain exactly one [1..1] value (CONF:18391).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors-abstract" abstract="true">
      <sch:assert id="a-77-17575" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:17575).</sch:assert>
      <sch:assert id="a-77-17576" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:17576).</sch:assert>
      <sch:assert id="a-77-17577" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:17577).</sch:assert>
      <sch:assert id="a-77-17578" test="cda:code[@code='ASSERTION' and @codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CodeSystem: ActCode 2.16.840.1.113883.5.4 STATIC) (CONF:17578).</sch:assert>
      <sch:assert id="a-77-17579" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:17579).</sch:assert>
      <sch:assert id="a-77-17581" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:17581) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:17582). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:17583). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:17584).</sch:assert>
      <sch:assert id="a-77-18093" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4'])=1">SHALL contain exactly one [1..1] templateId (CONF:18093) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.4" (CONF:18094).</sch:assert>
      <sch:assert id="a-77-18201" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18201).</sch:assert>
      <sch:assert id="a-77-18204" test="count(cda:reference)=1">SHALL contain exactly one [1..1] reference (CONF:18204).</sch:assert>
      <sch:assert id="a-77-18205" test="cda:reference[@typeCode='REFR']">This reference SHALL contain exactly one [1..1] @typeCode="REFR" (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18205).</sch:assert>
      <sch:assert id="a-77-18206" test="cda:reference[count(cda:externalObservation)=1]">This reference SHALL contain exactly one [1..1] externalObservation (CONF:18206).</sch:assert>
      <sch:assert id="a-77-18207" test="cda:reference/cda:externalObservation[count(cda:id)=1]">If this reference is to an eMeasure, this id equals the referenced stratification id defined in the eMeasure.
This externalObservation SHALL contain exactly one [1..1] id (CONF:18207).</sch:assert>
      <sch:assert id="a-77-18259-c" test="not(testable)">If this Reporting Stratum references an eMeasure, and the value of externalObservation/id equals the reference stratification id defined in the eMeasure, then this value SHALL be the same as the contents of the observation/code element in the eMeasure that is defined along with the observation/id element (CONF:18259).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.5-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-errors-abstract" abstract="true">
      <sch:assert id="a-77-17615" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:17615).</sch:assert>
      <sch:assert id="a-77-17616" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:17616).</sch:assert>
      <sch:assert id="a-77-17617" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:17617).</sch:assert>
      <sch:assert id="a-77-17618" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet ObservationPopulationInclusion 2.16.840.1.113883.1.11.20369 DYNAMIC (CONF:17618).</sch:assert>
      <sch:assert id="a-77-17619" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:17619) such that it SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:17620). SHALL contain exactly one [1..1] @typeCode="SUBJ" (CONF:17910). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:17911).</sch:assert>
      <sch:assert id="a-77-17912" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5'])=1">SHALL contain exactly one [1..1] templateId (CONF:17912) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.5" (CONF:17913).</sch:assert>
      <sch:assert id="a-77-18198" test="cda:code[@code='ASSERTION' and @codeSystem='2.16.840.1.113883.5.4']">This code SHALL contain exactly one [1..1] @code="ASSERTION" Assertion (CodeSystem: ActCode 2.16.840.1.113883.5.4 STATIC) (CONF:18198).</sch:assert>
      <sch:assert id="a-77-18199" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18199).</sch:assert>
      <sch:assert id="a-77-18239" test="count(cda:reference[count(cda:externalObservation[count(cda:id)=1])=1])=1">SHALL contain exactly one [1..1] reference (CONF:18239) such that it SHALL contain exactly one [1..1] externalObservation (CONF:18240). This externalObservation SHALL contain exactly one [1..1] id (CONF:18241).</sch:assert>
      <sch:assert id="a-77-19555" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14) (CONF:19555).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.1-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-errors-abstract" />
      <sch:assert id="a-77-17887" test="@classCode='CLUSTER'">SHALL contain exactly one [1..1] @classCode="CLUSTER" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:17887).</sch:assert>
      <sch:assert id="a-77-17888" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:17888).</sch:assert>
      <sch:assert id="a-77-17889" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:17889).</sch:assert>
      <sch:assert id="a-77-17890" test="count(cda:reference[@typeCode='REFR'][count(cda:externalDocument[@classCode='DOC'])=1])=1">SHALL contain exactly one [1..1] reference (CONF:17890) such that it SHALL contain exactly one [1..1] @typeCode="REFR" (CONF:17891). SHALL contain exactly one [1..1] externalDocument (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:17892). This externalDocument SHALL contain exactly one [1..1] @classCode="DOC" Document (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6) (CONF:19548).</sch:assert>
      <sch:assert id="a-77-17908" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1'])=1">SHALL contain exactly one [1..1] templateId (CONF:17908) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.1" (CONF:17909).</sch:assert>
      <sch:assert id="a-77-18354-c" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation">SHALL contain exactly one [1..1] externalObservation (CONF:18354). This externalObservation SHALL contain at least one [1..*] id (CONF:18355). This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:19554). This externalObservation SHALL contain exactly one [1..1] text (CONF:18358).</sch:assert>
      <sch:assert id="a-77-18355-c" test="count(cda:reference/cda:externalObservation) = count(cda:reference/cda:externalObservation[cda:id])">This externalObservation SHALL contain at least one [1..*] id (CONF:18355).</sch:assert>
      <sch:assert id="a-77-18356-c" test="not(testable)">This id SHALL equal the id of the corresponding measure set definition within the eMeasure (CONF:18356).</sch:assert>
      <sch:assert id="a-77-18357-c" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation[cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1']]">This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:19554).</sch:assert>
      <sch:assert id="a-77-18358-c" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation[count(cda:text)=1]">This externalObservation SHALL contain exactly one [1..1] text (CONF:18358).</sch:assert>
      <sch:assert id="a-77-18425" test="count(cda:component[count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']])=1]) &gt; 0">SHALL contain at least one [1..*] component (CONF:18425) such that it SHALL contain exactly one [1..1] Measure Data (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.5) (CONF:18426).</sch:assert>
      <sch:assert id="a-77-19552" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14) (CONF:19552).</sch:assert>
      <sch:assert id="a-77-19554-c" test="not(tested)">This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:19554).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-errors-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-17890-branch-17890-errors-abstract" abstract="true">
      <sch:assert id="a-77-18192-branch-17890" test="cda:externalDocument[count(cda:id[@root='2.16.840.1.113883.4.738'][@extension])=1]">This externalDocument SHALL contain exactly one [1..1] id (CONF:18192) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.4.738" (CONF:18193).
Note: This OID indicates that the @extension contains the version specific  identifier for the eMeasure SHALL contain exactly one [1..1] @extension (CONF:21159).
Note: This @extension SHALL equal the version specific identifier for eMeasure (i.e. QualityMeasureDocument/id)</sch:assert>
      <sch:assert id="a-77-19553-branch-17890" test="not(cda:externalDocument/cda:code) or cda:externalDocument/cda:code[@code='57024-2' and @codeSystem='2.16.840.1.113883.6.1']">The code, if present, SHALL contain exactly one [1..1] @code="57024-2" Health Quality Measure Document (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:19553).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-17890-branch-17890-errors" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference[@typeCode='REFR'][cda:externalDocument[@classCode='DOC']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-17890-branch-17890-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors-abstract" abstract="true">
      <sch:assert id="a-77-18100" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:18100).</sch:assert>
      <sch:assert id="a-77-18101" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18101).</sch:assert>
      <sch:assert id="a-77-18102" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18102) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18103). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18104). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:18105).</sch:assert>
      <sch:assert id="a-77-18209" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:18209).</sch:assert>
      <sch:assert id="a-77-18210" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:18210).</sch:assert>
      <sch:assert id="a-77-18211" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10'])=1">SHALL contain exactly one [1..1] templateId (CONF:18211) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.10" (CONF:18212).</sch:assert>
      <sch:assert id="a-77-18213" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:18213).</sch:assert>
      <sch:assert id="a-77-18214" test="cda:code[@code='184102003' and @codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @code="184102003" Patient postal code (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96 STATIC) (CONF:18214).</sch:assert>
      <sch:assert id="a-77-18215" test="count(cda:value[@xsi:type='ST'])=1">SHALL contain exactly one [1..1] value with @xsi:type="ST" (CONF:18215).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.9-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.9-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-errors-abstract" />
      <sch:assert id="a-77-18106" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:18106).</sch:assert>
      <sch:assert id="a-77-18107" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18107).</sch:assert>
      <sch:assert id="a-77-18108" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18108) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18109). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18110). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:18111).</sch:assert>
      <sch:assert id="a-77-18237" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9'])=1">SHALL contain exactly one [1..1] templateId (CONF:18237) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.9" (CONF:18238).</sch:assert>
      <sch:assert id="a-77-18250" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Source of Payment Typology (PHDSC) 2.16.840.1.114222.4.11.3591 DYNAMIC (CONF:18250).</sch:assert>
      <sch:assert id="a-77-21155" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:21155).</sch:assert>
      <sch:assert id="a-77-21156" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:21156).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.9-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.9-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors-abstract" abstract="true">
      <sch:assert id="a-77-18112" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:18112).</sch:assert>
      <sch:assert id="a-77-18113" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18113).</sch:assert>
      <sch:assert id="a-77-18114" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18114) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18115). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18116). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:18117).</sch:assert>
      <sch:assert id="a-77-18223" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:18223).</sch:assert>
      <sch:assert id="a-77-18224" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:18224).</sch:assert>
      <sch:assert id="a-77-18225" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8'])=1">SHALL contain exactly one [1..1] templateId (CONF:18225) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.8" (CONF:18226).</sch:assert>
      <sch:assert id="a-77-18227" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:18227).</sch:assert>
      <sch:assert id="a-77-18228" test="cda:code[@code='103579009' and @codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @code="103579009" Race (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96) (CONF:18228).</sch:assert>
      <sch:assert id="a-77-18229" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet RaceCategory 2.16.840.1.114222.4.11.836 DYNAMIC (CONF:18229).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors-abstract" abstract="true">
      <sch:assert id="a-77-18118" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:18118).</sch:assert>
      <sch:assert id="a-77-18119" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18119).</sch:assert>
      <sch:assert id="a-77-18120" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18120) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18121). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18122). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:18123).</sch:assert>
      <sch:assert id="a-77-18216" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:18216).</sch:assert>
      <sch:assert id="a-77-18217" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:18217).</sch:assert>
      <sch:assert id="a-77-18220" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:18220).</sch:assert>
      <sch:assert id="a-77-18221" test="cda:code[@code='364699009' and @codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @code="364699009" Ethnic Group (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96) (CONF:18221).</sch:assert>
      <sch:assert id="a-77-18222" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet EthnicityGroup 2.16.840.1.114222.4.11.837 DYNAMIC (CONF:18222).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-errors-abstract" />
      <sch:assert id="a-77-18218" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7'])=1">SHALL contain exactly one [1..1] templateId (CONF:18218) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.7" (CONF:18219).</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.6-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.6-errors-abstract" abstract="true">
      <sch:assert id="a-77-18124" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:18124).</sch:assert>
      <sch:assert id="a-77-18125" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" Completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18125).</sch:assert>
      <sch:assert id="a-77-18126" test="count(cda:entryRelationship[@typeCode='SUBJ'][@inversionInd='true'][count(cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']])=1])=1">SHALL contain exactly one [1..1] entryRelationship (CONF:18126) such that it SHALL contain exactly one [1..1] @typeCode="SUBJ" Has Subject (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18127). SHALL contain exactly one [1..1] @inversionInd="true" (CONF:18128). SHALL contain exactly one [1..1] Aggregate Count (identifier: urn:oid:2.16.840.1.113883.10.20.27.3.3) (CONF:18129).</sch:assert>
      <sch:assert id="a-77-18230" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:18230).</sch:assert>
      <sch:assert id="a-77-18231" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:18231).</sch:assert>
      <sch:assert id="a-77-18232" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6'])=1">SHALL contain exactly one [1..1] templateId (CONF:18232) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.6" (CONF:18233).</sch:assert>
      <sch:assert id="a-77-18234" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:18234).</sch:assert>
      <sch:assert id="a-77-18235" test="cda:code[@code='184100006' and @codeSystem='2.16.840.1.113883.6.96']">This code SHALL contain exactly one [1..1] @code="184100006" Patient sex (CodeSystem: SNOMED CT 2.16.840.1.113883.6.96 STATIC) (CONF:18235).</sch:assert>
      <sch:assert id="a-77-18236" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHALL be selected from ValueSet Administrative Gender (HL7 V3) 2.16.840.1.113883.1.11.1 DYNAMIC (CONF:18236).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.6-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.6-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors-abstract" abstract="true">
      <sch:assert id="a-77-18312" test="@classCode='ENC'">SHALL contain exactly one [1..1] @classCode="ENC" (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:18312).</sch:assert>
      <sch:assert id="a-77-18314" test="count(cda:effectiveTime)=1">SHALL contain exactly one [1..1] effectiveTime (CONF:18314).</sch:assert>
      <sch:assert id="a-77-18369" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11'])=1">SHALL contain exactly one [1..1] templateId (CONF:18369) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.11" (CONF:18370).</sch:assert>
      <sch:assert id="a-77-21154" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:21154).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-errors-abstract" />
      <sch:assert id="a-77-18323" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2'])=1">SHALL contain exactly one [1..1] templateId (CONF:18323) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.2.2" (CONF:18324).</sch:assert>
      <sch:assert id="a-77-18325" test="count(cda:entry[@typeCode='DRIV'][count(cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']])=1])=1">SHALL contain exactly one [1..1] entry (CONF:18325) such that it SHALL contain exactly one [1..1] @typeCode="DRIV" Is derived from (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002 STATIC) (CONF:18427). SHALL contain exactly one [1..1] Reporting Parameters Act (identifier: urn:oid:2.16.840.1.113883.10.20.17.3.8) (CONF:18428).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors-abstract" abstract="true">
      <sch:assert id="a-77-18395" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:18395).</sch:assert>
      <sch:assert id="a-77-18396" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:18396).</sch:assert>
      <sch:assert id="a-77-18397" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:18397).</sch:assert>
      <sch:assert id="a-77-18398" test="cda:code[@code='72510-1' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="72510-1" Performance Rate (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:18398).</sch:assert>
      <sch:assert id="a-77-18399" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:18399).</sch:assert>
      <sch:assert id="a-77-18401" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:18401).</sch:assert>
      <sch:assert id="a-77-18402" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value[@xsi:type='REAL'])=1]">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:18402).</sch:assert>
      <sch:assert id="a-77-18421" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:18421).</sch:assert>
      <sch:assert id="a-77-18422" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18422).</sch:assert>
      <sch:assert id="a-77-19649" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14'])=1">SHALL contain exactly one [1..1] templateId (CONF:19649) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.14" (CONF:19650).</sch:assert>
      <sch:assert id="a-77-19652" test="not(cda:reference) or cda:reference[@typeCode='REFR']">The reference, if present, SHALL contain exactly one [1..1] @typeCode="REFR" refers to (CodeSystem: HL7ActRelationshipType 2.16.840.1.113883.5.1002) (CONF:19652).</sch:assert>
      <sch:assert id="a-77-19653" test="not(cda:reference) or cda:reference[count(cda:externalObservation)=1]">The reference, if present, SHALL contain exactly one [1..1] externalObservation (CONF:19653).</sch:assert>
      <sch:assert id="a-77-19654" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation[@classCode]">This externalObservation SHALL contain exactly one [1..1] @classCode (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6) (CONF:19654).</sch:assert>
      <sch:assert id="a-77-19655-c" test="not(tested)">The externalObservationID contains the ID of the numerator in the referenced eMeasure.
This externalObservation SHALL contain exactly one [1..1] id (CONF:19655).</sch:assert>
      <sch:assert id="a-77-19656" test="not(cda:reference/cda:externalObservation/cda:id) or cda:reference/cda:externalObservation/cda:id[@root]">This id SHALL contain exactly one [1..1] @root (CONF:19656).</sch:assert>
      <sch:assert id="a-77-19657" test="not(cda:reference/cda:externalObservation) or cda:reference/cda:externalObservation[count(cda:code)=1]">This externalObservation SHALL contain exactly one [1..1] code (CONF:19657).</sch:assert>
      <sch:assert id="a-77-19658" test="not(cda:reference/cda:externalObservation/cda:code) or cda:reference/cda:externalObservation/cda:code[@code='NUMER' and @codeSystem='2.16.840.1.113883.5.1063']">This code SHALL contain exactly one [1..1] @code="NUMER" Numerator (CodeSystem: ObservationValue 2.16.840.1.113883.5.1063) (CONF:19658).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors-abstract" abstract="true">
      <sch:assert id="a-77-18411" test="@classCode='OBS'">SHALL contain exactly one [1..1] @classCode="OBS" Observation (CodeSystem: HL7ActClass 2.16.840.1.113883.5.6 STATIC) (CONF:18411).</sch:assert>
      <sch:assert id="a-77-18412" test="@moodCode='EVN'">SHALL contain exactly one [1..1] @moodCode="EVN" Event (CodeSystem: ActMood 2.16.840.1.113883.5.1001 STATIC) (CONF:18412).</sch:assert>
      <sch:assert id="a-77-18413" test="count(cda:code)=1">SHALL contain exactly one [1..1] code (CONF:18413).</sch:assert>
      <sch:assert id="a-77-18414" test="cda:code[@code='72509-3' and @codeSystem='2.16.840.1.113883.6.1']">This code SHALL contain exactly one [1..1] @code="72509-3" Reporting Rate (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:18414).</sch:assert>
      <sch:assert id="a-77-18415" test="count(cda:value[@xsi:type='REAL'])=1">SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:18415).</sch:assert>
      <sch:assert id="a-77-18417" test="not(cda:referenceRange) or cda:referenceRange[count(cda:observationRange)=1]">The referenceRange, if present, SHALL contain exactly one [1..1] observationRange (CONF:18417).</sch:assert>
      <sch:assert id="a-77-18418" test="not(cda:referenceRange/cda:observationRange) or cda:referenceRange/cda:observationRange[count(cda:value[@xsi:type='REAL'])=1]">This observationRange SHALL contain exactly one [1..1] value with @xsi:type="REAL" (CONF:18418).</sch:assert>
      <sch:assert id="a-77-18419" test="count(cda:statusCode)=1">SHALL contain exactly one [1..1] statusCode (CONF:18419).</sch:assert>
      <sch:assert id="a-77-18420" test="cda:statusCode[@code='completed']">This statusCode SHALL contain exactly one [1..1] @code="completed" completed (CodeSystem: ActStatus 2.16.840.1.113883.5.14 STATIC) (CONF:18420).</sch:assert>
      <sch:assert id="a-77-21157" test="count(cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15'])=1">SHALL contain exactly one [1..1] templateId (CONF:21157) such that it SHALL contain exactly one [1..1] @root="2.16.840.1.113883.10.20.27.3.15" (CONF:21158).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-errors-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings" context="cda:act[cda:templateId[@root='2.16.840.1.113883.10.20.17.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.3.8-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.17.2.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings-abstract" abstract="true">
      <sch:assert id="a-67-26935" test="cda:effectiveTime[count(cda:high)=1]">This effectiveTime SHOULD contain zero or one [0..1] high (CONF:26935).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.55']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.24.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings-abstract" abstract="true">
      <sch:assert id="a-67-12997-branch-12982" test="cda:externalDocument[count(cda:text)=1]">This externalDocument SHOULD contain zero or one [0..1] text (CONF:12997).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.24.3.98']]/cda:reference[@typeCode='REFR'][cda:externalDocument]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-12982-branch-12982-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.1.1-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.1.1-warnings-abstract" abstract="true">
      <sch:assert id="a-77-18166" test="cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization[count(cda:name)=1]">This representedCustodianOrganization SHOULD contain zero or one [0..1] name (CONF:18166).</sch:assert>
      <sch:assert id="a-77-18260" test="count(cda:versionNumber)=1">SHOULD contain zero or one [0..1] versionNumber (CONF:18260).</sch:assert>
      <sch:assert id="a-77-19659" test="not(cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization) or cda:documentationOf/cda:serviceEvent/cda:performer/cda:assignedEntity/cda:representedOrganization[count(cda:name) &gt; 0]">This representedOrganization SHOULD contain zero or more [0..*] name (CONF:19659).</sch:assert>
      <sch:assert id="a-77-19673" test="not(cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization) or cda:legalAuthenticator/cda:assignedEntity/cda:representedOrganization[count(cda:name)=1]">The representedOrganization, if present, SHOULD contain zero or one [0..1] name (CONF:19673).</sch:assert>
      <sch:assert id="a-77-17238-v" test="count(cda:confidentialityCode[@code=document('voc.xml')/voc:systems/voc:system[@valueSetOid='2.16.840.1.113883.1.11.16926']/voc:code/@value])=1">SHALL contain exactly one [1..1] confidentialityCode, which SHOULD be selected from ValueSet HL7 BasicConfidentialityKind 2.16.840.1.113883.1.11.16926 STATIC 2010-04-21 (CONF:X).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.1.1-warnings" context="cda:ClinicalDocument[cda:templateId[@root='2.16.840.1.113883.10.20.27.1.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.1.1-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.2.1-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.1-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.2.2-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.1-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.2.1-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.3']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.3-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.2-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings-abstract" abstract="true">
      <sch:assert id="a-77-17580" test="count(cda:value)=1">SHOULD contain zero or one [0..1] value (CONF:17580).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.4']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.4-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.5-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-warnings-abstract" abstract="true">
      <sch:assert id="a-77-17618-v" test="count(cda:value[@xsi:type='CD'])=1">SHALL contain exactly one [1..1] value with @xsi:type="CD", where the code SHOULD be selected from ValueSet ObservationPopulationInclusion 2.16.840.1.113883.1.11.20369 DYNAMIC (CONF:X).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-18239-branch-18239-warnings-abstract" abstract="true">
      <sch:assert id="a-77-18258-branch-18239-c" test="not(testable)">If this reference is to an eMeasure, this id SHALL equal the id defined in the corresponding eMeasure population criteria section (CONF:18258).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-18239-branch-18239-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.5']]/cda:reference[cda:externalObservation[cda:id]]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.5-18239-branch-18239-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.1-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.98-warnings-abstract" />
      <sch:assert id="a-77-18353-c" test="not(cda:reference[cda:externalObservation[cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1']]]) or (count(cda:reference[cda:externalObservation[cda:id][cda:code[@code='55185-3'][@codeSystem='2.16.840.1.113883.6.1']][cda:text]])=1)">In the case that an eMeasure is part of a measure set or group, the following reference is used to identify that set or group. If the eMeasure is not part of a measure set, the following reference element should not be defined.
SHOULD contain exactly one [1..1] reference (CONF:18353) such that it SHALL contain exactly one [1..1] externalObservation (CONF:18354). This externalObservation SHALL contain at least one [1..*] id (CONF:18355). This externalObservation SHALL contain exactly one [1..1] code (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:18357). This code SHALL contain exactly one [1..1] @code="55185-3" measure set (CodeSystem: LOINC 2.16.840.1.113883.6.1) (CONF:19554). This externalObservation SHALL contain exactly one [1..1] text (CONF:18358).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-17890-branch-17890-warnings-abstract" abstract="true">
      <sch:assert id="a-77-17896-branch-17890" test="cda:externalDocument[count(cda:code[@codeSystem='2.16.840.1.113883.6.1' or @nullFlavor])=1]">This externalDocument SHOULD contain zero or one [0..1] code (CodeSystem: LOINC 2.16.840.1.113883.6.1 STATIC) (CONF:17896).</sch:assert>
      <sch:assert id="a-77-17897-branch-17890" test="cda:externalDocument[count(cda:text)=1]">This text is the title and optionally a brief description of the Quality Measure.
This externalDocument SHOULD contain zero or one [0..1] text (CONF:17897).</sch:assert>
      <sch:assert id="a-77-17900-branch-17890-c" test="not(testable)">If this reference is to an eMeasure, this setId SHALL equal the QualityMeasureDocument/setId which is the eMeasure version neutral id (CONF:17900).</sch:assert>
      <sch:assert id="a-77-17902-branch-17890-c" test="not(testable)">If this reference is to an eMeasure this version number SHALL equal the sequential eMeasure Version number (CONF:17902).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-17890-branch-17890-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference[@typeCode='REFR'][cda:externalDocument[@classCode='DOC']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-17890-branch-17890-warnings-abstract" />
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-18353-branch-18353-warnings-abstract" abstract="true">
      <sch:assert id="a-77-18359-branch-18353-c" test="not(testable)">This text SHOULD be the title of the corresponding measure set (CONF:18359).</sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-18353-branch-18353-warnings" context="cda:organizer[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.1']]/cda:reference[cda:externalObservation[cda:id][cda:code[@code='55185-3']][cda:text]]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.1-18353-branch-18353-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.10']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.10-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.9-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.9-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.24.3.55-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.9-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.9']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.9-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.8']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.8-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.7']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.7-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.6-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.6-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.6-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.6']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.6-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings" context="cda:encounter[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.11']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.11-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings-abstract" abstract="true">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.17.2.1-warnings-abstract" />
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings" context="cda:section[cda:templateId[@root='2.16.840.1.113883.10.20.27.2.2']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.2.2-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.14']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.14-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="p-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings">
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings-abstract" abstract="true">
      <sch:assert test="."></sch:assert>
    </sch:rule>
    <sch:rule id="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings" context="cda:observation[cda:templateId[@root='2.16.840.1.113883.10.20.27.3.15']]">
      <sch:extends rule="r-urn-oid-2.16.840.1.113883.10.20.27.3.15-warnings-abstract" />
    </sch:rule>
  </sch:pattern>
</sch:schema>