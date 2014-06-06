# ERROR #001
Element '{urn:hl7-org:v3}observationReference': This element is not expected. Expected is one of ( {urn:hl7-org:v3}criteriaReference, {urn:hl7-org:v3}actCriteria, {urn:hl7-org:v3}substanceAdministrationCriteria, {urn:hl7-org:v3}observationCriteria, {urn:hl7-org:v3}encounterCriteria, {urn:hl7-org:v3}procedureCriteria, {urn:hl7-org:v3}supplyCriteria, {urn:hl7-org:v3}grouperCriteria ).

## FIX
Replace `observationReference` with `criteriaReference` in templates.

As well as the fix to the specific templates, there are also generic reference-related templates that need
to be modified to always use `criteriaReference`.

## REPRESENTATIVE CHANGES
    -            <observationReference moodCode="EVN" classCode="OBS">
    +            <criteriaReference moodCode="EVN" classCode="OBS">
                   <id root="2.16.840.1.113883.3.100.1" extension="<%= section_name(
    -            </observationReference>
    +            </criteriaReference>

and

    -            <<%= reference_element_name(reference.id) %>Reference moodCode="EVN
    +            <criteriaReference moodCode="EVN" classCode="<%= reference_type_nam
                   <id root="2.16.840.1.113883.3.100.1" extension="<%= reference.id
    -            </<%= reference_element_name(reference.id) %>Reference>
    +            </criteriaReference>

## GIT STATUS:
    modified:   lib/hqmf-generator/characteristic_criteria.xml.erb
    modified:   lib/hqmf-generator/condition_criteria.xml.erb
    modified:   lib/hqmf-generator/observation_criteria.xml.erb
    modified:   lib/hqmf-generator/source.xml.erb
    modified:   lib/hqmf-generator/specific_occurrence.xml.erb

and

    modified:   lib/hqmf-generator/precondition.xml.erb
    modified:   lib/hqmf-generator/reference.xml.erb

-------------------------------------------------------------------------------

# ERROR #002
Element '{urn:hl7-org:v3}id': Character content is not allowed, because the content type is empty.

##FIX
Remove `item` child from `id` and put `item's` attributes into `id`

## REPRESENTATIVE CHANGE
    -          <id>
    -            <item root="2.16.840.1.113883.3.100.1" extension="<%= criteria.id %
    -          </id>
    +          <id root="2.16.840.1.113883.3.100.1" extension="<%= criteria.id %>"/>

## GIT STATUS
    modified:   lib/hqmf-generator/characteristic_criteria.xml.erb
    modified:   lib/hqmf-generator/condition_criteria.xml.erb
    modified:   lib/hqmf-generator/encounter_criteria.xml.erb
    modified:   lib/hqmf-generator/observation_criteria.xml.erb
    modified:   lib/hqmf-generator/procedure_criteria.xml.erb
    modified:   lib/hqmf-generator/substance_criteria.xml.erb
    modified:   lib/hqmf-generator/supply_criteria.xml.erb
    modified:   lib/hqmf-generator/variable_criteria.xml.erb

-------------------------------------------------------------------------------

# ERROR #003
Element '{urn:hl7-org:v3}encounterReference': This element is not expected. Expected is one of ( {urn:hl7-org:v3}realmCode, {urn:hl7-org:v3}typeId, {urn:hl7-org:v3}templateId, {urn:hl7-org:v3}criteriaReference ).

## FIX
Replace `encounterReference` with `criteriaReference`

## CHANGE
    -            <encounterReference moodCode="EVN" classCode="ENC">
    +            <criteriaReference moodCode="EVN" classCode="ENC">
                   <id root="2.16.840.1.113883.3.100.1" extension="<%= section_name(
    -            </encounterReference>
    +            </criteriaReference>

## GIT STATUS:
    modified:   lib/hqmf-generator/encounter_criteria.xml.erb

-------------------------------------------------------------------------------

# ERROR #004
Element '{urn:hl7-org:v3}pauseQuantity', attribute '{http://www.w3.org/2001/XMLSchema-instance}type': The type definition '{urn:hl7-org:v3}IVL_PQ', specified by xsi:type, is blocked or not validly derived from the type definition of the element declaration.

##FIX
Do not generate the `type` attribute on `pauseQuantity` elements.

## CHANGES
                 <%- if relationship.range -%>
    -            <%= xml_for_value(relationship.range, 'pauseQuantity') %>
    +            <%= xml_for_value(relationship.range, 'pauseQuantity', false) %>
                 <%- end -%>

and

     <%- if value.class==HQMF::Range -%>
    -  <<%= name %> xsi:type="<%= value.type %>">
    +  <<%= name %> <%= "xsi:type=\"#{value.type}\"" if include_type %>>
         <%= xml_for_value(value.low, 'low', false) if value.low -%>
         <%= xml_for_value(value.high, 'high', false) if value.high -%>
       </<%= name %>>

## GIT STATUS
    modified:   lib/hqmf-generator/temporal_relationship.xml.erb
    modified:   lib/hqmf-generator/value.xml.erb

-------------------------------------------------------------------------------

# ERROR #005
Element '{urn:hl7-org:v3}procedureReference': This element is not expected. Expected is one of ( {urn:hl7-org:v3}realmCode, {urn:hl7-org:v3}typeId, {urn:hl7-org:v3}templateId, {urn:hl7-org:v3}criteriaReference ).

##FIX
Replace `procedureReference` with `criteriaReference`

## CHANGE
    -            <procedureReference moodCode="EVN" classCode="PROC">
    +            <criteriaReference moodCode="EVN" classCode="PROC">
                   <id root="2.16.840.1.113883.3.100.1" extension="<%= section_name(
    -            </procedureReference>
    +            </criteriaReference>

## GIT STATUS
    modified:   lib/hqmf-generator/procedure_criteria.xml.erb

-------------------------------------------------------------------------------

# ERROR #006
Element '{urn:hl7-org:v3}high': This element is not expected. Expected is one of ( {urn:hl7-org:v3}expression, {urn:hl7-org:v3}originalText, {urn:hl7-org:v3}uncertainty, {urn:hl7-org:v3}uncertainRange, {urn:hl7-org:v3}translation ).

##FIX
Modify generation of `pauseQuantity` to have a child `uncertainRange` element containing the range information.

## CHANGE
_WARNING: We should probably not be using the element name as a condition, but there was nothing much else to go off in the model._
_This needs to be revisited._

     <%- if value.class==HQMF::Range -%>
       <<%= name %> <%= "xsi:type=\"#{value.type}\"" if include_type %>>
    -    <%= xml_for_value(value.low, 'low', false) if value.low -%>
    -    <%= xml_for_value(value.high, 'high', false) if value.high -%>
    +    <%- # WARNING: Hacky Fix That Must Be Looked At Again! -%>
    +    <%- if name == 'pauseQuantity' -%>
    +      <uncertainRange <%= "lowClosed=\"true\"" if value.low && value.low.inclus
    +        <%= xml_for_value(value.low, 'low') if value.low -%>
    +        <%= xml_for_value(value.high, 'high') if value.high -%>
    +      </uncertainRange>
    +    <%- else -%>
    +      <%= xml_for_value(value.low, 'low', false) if value.low -%>
    +      <%= xml_for_value(value.high, 'high', false) if value.high -%>
    +    <%- end -%>
       </<%= name %>>

## GIT STATUS
    modified:   lib/hqmf-generator/value.xml.erb

-------------------------------------------------------------------------------

# ERROR #007
Element '{urn:hl7-org:v3}substanceAdministrationReference': This element is not expected. Expected is one of ( {urn:hl7-org:v3}realmCode, {urn:hl7-org:v3}typeId, {urn:hl7-org:v3}templateId, {urn:hl7-org:v3}criteriaReference ).

##FIX
Replace `substanceAdministrationReference` with `criteriaReference`.

## CHANGE
    -            <substanceAdministrationReference moodCode="EVN" classCode="SBADM">
    +            <criteriaReference moodCode="EVN" classCode="SBADM">
                   <id root="2.16.840.1.113883.3.100.1" extension="<%= section_name(
    -            </substanceAdministrationReference>
    +            </criteriaReference>

## GIT STATUS
    modified:   lib/hqmf-generator/substance_criteria.xml.erb

-------------------------------------------------------------------------------

# ERROR #008
Element '{urn:hl7-org:v3}supplyReference': This element is not expected. Expected is one of ( {urn:hl7-org:v3}realmCode, {urn:hl7-org:v3}typeId, {urn:hl7-org:v3}templateId, {urn:hl7-org:v3}criteriaReference ).

##FIX
Replace `supplyReference` with `criteriaReference`

## REPRESENTATIVE CHANGE
    -            <supplyReference moodCode="EVN" classCode="SPLY">
    +            <criteriaReference moodCode="EVN" classCode="SPLY">
                   <id root="2.16.840.1.113883.3.100.1" extension="<%= section_name(
    -            </supplyReference>
    +            </criteriaReference>

## GIT STATUS
    modified:   lib/hqmf-generator/supply_criteria.xml.erb

-------------------------------------------------------------------------------

# ERROR #009
Element '{urn:hl7-org:v3}isCriterionInd': This element is not expected. Expected is ( {urn:hl7-org:v3}precondition ).

##FIX
Move `isCriterionInd` from child element to attribute.

## REPRESENTATIVE CHANGE
    @@ -1,5 +1,5 @@
           <component typeCode="COMP">
    -        <<%= population_element_prefix(criteria_id) %>Criteria  classCode="OBS" moodCode="EVN">
    +        <<%= population_element_prefix(criteria_id) %>Criteria  classCode="OBS" moodCode="EVN" isCriterionInd="true">
               <id root="c75181d0-73eb-11de-8a39-0800200c9a66"
                 extension="<%= population_criteria.hqmf_id %>"/>
               <code codeSystem="2.16.840.1.113883.5.1063"
    @@ -7,7 +7,6 @@
                   code="<%= population_criteria.type %>">
                 <displayName value="<%= population_criteria.title %>"/>
               </code>
    -          <isCriterionInd value="true"/>
               <%- if population_criteria.preconditions.present? && population_criteria.preconditions.length > 0 -%>
                 <%- population_criteria.preconditions.each do |precondition| -%>
               <%= xml_for_precondition(precondition) %>

## GIT STATUS
    modified:   lib/hqmf-generator/population_criteria.xml.erb

-------------------------------------------------------------------------------

# ERROR #010
Element '{urn:hl7-org:v3}text': Character content other than whitespace is not allowed because the content type is 'element-only'.

##FIX
Move inner text of `text` elements to the `value` attribute.

## REPRESENTATIVE CHANGE
    -      <text>This section describes the data criteria.</text>
    +      <text value="This section describes the data criteria."/>

## GIT STATUS
    modified:   lib/hqmf-generator/document.xml.erb

-------------------------------------------------------------------------------

# ERROR #011
Element '{urn:hl7-org:v3}measureAttribute': Missing child element(s). Expected is ( {urn:hl7-org:v3}value ).

##FIX
Add id_obj, code_obj, and value_obj to the model to represent full representations of each concept.  Enhance 1.0
and 2.0 parsers to parse out the full objects too, while keeping 1.0 backwards compatible.  Since `value` can be
any type, try to determine type programmatically (also required introduction of `Identifier`, `ED`, and 
`GenericValueContainer` types).  Update generator to use id_obj, code_obj, and value_obj from the model.

## REPRESENTATIVE CHANGE
Too many to choose just one representative change.

## GIT STATUS
    modified   lib/hqmf-generator/attribute.xml.erb
    modified   lib/hqmf-generator/code.xml.erb
    modified   lib/hqmf-generator/value.xml.erb
    modified   lib/hqmf-model/attribute.rb
    modified   lib/hqmf-model/types.rb
    modified   lib/hqmf-parser/1.0/attribute.rb
    modified   lib/hqmf-parser/1.0/document.rb
    modified   lib/hqmf-parser/2.0/document.rb
    modified   lib/hqmf-parser/converter/pass1/document_converter.rb
    modified   test/unit/hqmf/2.0/document_v2_test.rb
    modified   test/unit/hqmf/generator/hqmf_generator_test.rb

-------------------------------------------------------------------------------

# ERROR #012
Element '{urn:hl7-org:v3}criteriaReference': This element is not expected. Expected is one of ( {urn:hl7-org:v3}actCriteria, {urn:hl7-org:v3}substanceAdministrationCriteria, {urn:hl7-org:v3}actDefinition, {urn:hl7-org:v3}observationCriteria, {urn:hl7-org:v3}encounterCriteria, {urn:hl7-org:v3}procedureCriteria, {urn:hl7-org:v3}supplyCriteria, {urn:hl7-org:v3}grouperCriteria ).

##FIX
Use GrouperCriteria instead of ObservationCriteria when the criteria definition is derived (and its not one of the other criteria types).
Some subset operators (COUNT, SUM, MIN, MAX, MEAN, MEDIAN) however cannot be represented in a GrouperCriteria, so default to
ObservationCriteria in those cases.

## REPRESENTATIVE CHANGE
Too many to choose one representative change.

## GIT STATUS
    modified:   lib/hqmf-generator/derivation.xml.erb
    new file:   lib/hqmf-generator/grouper_criteria.xml.erb
    modified:   lib/hqmf-generator/hqmf-generator.rb
    modified:   lib/hqmf-generator/subset.xml.erb
    modified:   lib/hqmf-model/types.rb


-------------------------------------------------------------------------------

# ERROR #013
Element '{urn:hl7-org:v3}patientPopulationCriteria': This element is not expected. Expected is one of ( {urn:hl7-org:v3}realmCode, {urn:hl7-org:v3}typeId, {urn:hl7-org:v3}templateId, {urn:hl7-org:v3}localVariableName, {urn:hl7-org:v3}stratifierCriteria, {urn:hl7-org:v3}denominatorExceptionCriteria, {urn:hl7-org:v3}denominatorExclusionCriteria, {urn:hl7-org:v3}numeratorExclusionCriteria, {urn:hl7-org:v3}measurePopulationExclusionCriteria, {urn:hl7-org:v3}initialPopulationCriteria ).

##FIX
Rename `patientPopulation` to `initialPopulation` in the generator.

## CHANGE
           def population_element_prefix(population_criteria_code)
             case population_criteria_code
             when HQMF::PopulationCriteria::IPP
    -          'patientPopulation'
    +          'initialPopulation'
             when HQMF::PopulationCriteria::DENOM
               'denominator'

## GIT STATUS
    modified:   lib/hqmf-generator/hqmf-generator.rb

-------------------------------------------------------------------------------

# ERROR #014
Element '{urn:hl7-org:v3}author', attribute 'contextControlCode': The attribute 'contextControlCode' is not allowed.

##FIX
Remove `contextControlCode` since it is no longer used.

## CHANGE
    -  <author typeCode="AUT" contextControlCode="OP">
    +  <author typeCode="AUT">

## GIT STATUS
    modified:   lib/hqmf-generator/document.xml.erb

-------------------------------------------------------------------------------

# ERROR #015
Element '{urn:hl7-org:v3}QualityMeasureDocument': Character content other than whitespace is not allowed because the content type is 'element-only'.

##FIX
This was caused buy unescaped `<`,`>`, and `"` in the various XML attributes.  Special characters need to be escaped in XML attributes.

*QUESTION:* Do we need to comb through all of the generator code to fix all cases where free text is accepted in attribute values?

## REPRESENTATIVE CHANGE
    -                       <value xsi:type="ED" value="<%= attribute.value %>"/>
    +                       <value xsi:type="ED" value="<%=ERB::Util::h attribute.value %>"/>

## GIT STATUS
    modified:   lib/hqmf-generator/attribute.xml.erb
    modified:   lib/hqmf-generator/code.xml.erb
    modified:   lib/hqmf-generator/description.xml.erb
    modified:   lib/hqmf-generator/document.xml.erb
    modified:   lib/hqmf-generator/field.xml.erb
    modified:   lib/hqmf-generator/hqmf_r2.1_generator_changes.md
    modified:   lib/hqmf-generator/population_criteria.xml.erb
    modified:   lib/hqmf-generator/value.xml.erb

-------------------------------------------------------------------------------

# ERROR #016
Element '{urn:hl7-org:v3}repeatNumber', attribute '{http://www.w3.org/2001/XMLSchema-instance}type': The type definition '{urn:hl7-org:v3}IVL_PQ', specified by xsi:type, is blocked or not validly derived from the type definition of the element declaration.

##FIX
HQMF R2.1 defines `repeatNumber` as having type `IVL_INT`, so we can't redefine as type `IVL_PQ`.  As best I can tell, the `repeatNumber` element only
makes sense when the subset type is `Count`.  Since it doesn't support `unit` on the embedded `high` and `low` elements, use `repeatNumber` only on
counts and use `value` on everything else.

## CHANGE
    -              <%= xml_for_value(subset.value, 'value') %>
    +              <%- if subset.type == 'COUNT' -%>
    +                <%= xml_for_value(subset.value, 'repeatNumber', false) %>
    +              <%- else -%>
    +                <%= xml_for_value(subset.value, 'value') %>
    +              <%- end -%>

## GIT STATUS
    modified:   lib/hqmf-generator/subset.xml.erb

-------------------------------------------------------------------------------