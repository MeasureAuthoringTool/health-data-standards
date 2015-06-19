# HQMF R2.1 Parsing #

## Workflow ##
An HQMF R2.1 XML file is parsed via the [HQMF::Parser::V2Parser](../parser.rb), which initializes an [HQMF2::Document](document.rb) and then uses the parsed info to initialize an [HQMF::Document](../../hqmf-model/document.rb).

Every ```to_model``` method on an HQMF2 component will map itself to the equivalent base [hqmf_model](../../hqmf_model) component (e.g., [DataCriteria](data_criteria.rb#L376), [Precondition](precondition.rb#L51)).

The [HQMF2::Document](document.rb) completes the following during initialization:
1. extracts measure metadata from measure attributes
2. extracts data criteria from the data criteria section
3. generates source data criteria from all extracted data criteria
4. patches all data criteria and source data criteria (for descriptions, specific occurrences, etc.)
5. extracts measure observations
6. extracts sorted measure population criteria and stratifications

## Caveats ##

### V2Parser ###
- [HQMF::Parser::V2Parser](../parser.rb) requires a [specific document identifier](../parser.rb#L37)

### Document ###
- [HQMF2::Document](document.rb#L17) removes [population criteria references from preconditions](document.rb#L320)
- Measure Period derivation is [hardcoded](document.rb#L29) to 1 year from 2012 to 2013 (it is overwritten during calculation)
- If [data criteria references are refactored](document.rb#L120), it would be ideal to use a verbose reference for lookups (extension + root)
- We [generate source data criteria](document.rb#L128) from all the data criteria
- [Description patching](document.rb#L131) should be backed out if ID extensions are no longer just guids
- [HQMF2::Document](document.rb#L135) clones source data criteria and fills them with [missing specific occurrences](document.rb#L400)
- [HQMF2::Document](document.rb#L146) parsing of Measure Observations needs refactoring for population criteria hqmf IDs and calculation expressions
- [HQMF2::Document](document.rb#L124) wraps variable data criteria with [groupers](document.rb#L293)
- Groupers with one child and are of type derived are [patched](document.rb#L302) with ```update_copy```

### DataCriteria ###
- [HQMF2::DataCriteria](data_criteria.rb#L5) contains a map from template oids to entry-specific value set and result xpaths
- ID reference errors might arise from [strip_tokens](utilities.rb#L30), [verbose_reference](data_criteria.rb#L160), or regex issues
- Specific occurrence issues would arise from [extract_specific_or_source](data_criteria.rb#L608); there are commented ```puts``` statements that are useful for debugging
- Verbose references were used to identify data criteria that shared ID extensions with distinct ID roots
- Data criteria descriptions are configured in [to_model](data_criteria.rb#L401)
- ```extract_``` [methods](data_criteria.rb#L419) are used to clone DataCriteria instances with specific attributes
- ```patch_``` [methods](data_criteria.rb#L466) are post-processing methods used to correct titles, missing fields, etc.

### FieldValueHelper ###
- most of the field value parsing and extraction happens [here](field_value_helper.rb); typos are the most common error case

### PopulationCriteria ###
- Measure observation updates will require changes to the [precondition parsing](precondition.rb#L37)

## References ##
- [Specification](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=97) - [HL7_V3_QM_DSTUR2.1_2014AUG.zip](http://www.hl7.org/documentcenter/public/standards/dstu/HL7_V3_QM_DSTUR2.1_2014AUG.zip)
- [QDM IG](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=346) - [V3_IG_HQMF_R1_DSTU_R1.1_2015FEB.zip](http://www.hl7.org/documentcenter/public/standards/dstu/V3_IG_HQMF_R1_DSTU_R1.1_2015FEB.zip)
- [eQCMS](https://ecqi.healthit.gov/ecqm) - [EH bundle](https://ecqi.healthit.gov/system/files/ecqm/2015/EH/2014_eCQM_EligibleHospital_May2015.zip) - [EP bundle](https://ecqi.healthit.gov/system/files/ecqm/2015/EP/2014_eCQM_Eligible%20Professional_May2015.zip)
