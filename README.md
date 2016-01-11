This is a project to generate and consume HITSP C32, QRDA Category I, and QRDA Category III.

In addition this project also contains libraries for parsing HQMF documents and for dealing with NLM valuesets.

Environment
===========

This project currently uses Ruby 2.0.0, Ruby 2.1.1, Ruby 2.2.1, and JRuby 1.7.11 and is built using [Bundler](http://gembundler.com/). To get all of the dependencies for the project, first install bundler:

    gem install bundler

Then run bundler to grab all of the necessary gems:

    bundle install

The Quality Measure engine relies on a MongoDB [MongoDB](http://www.mongodb.org/) running a minimum of version 2.4.* or higher.  To get and install Mongo refer to:

    http://www.mongodb.org/display/DOCS/Quickstart

Project Practices
=================

Please try to follow the [GitHub Coding Style Guides](https://github.com/styleguide). Additionally, we are switching to the git workflow described in [Juan Batiz-Benet's Gist](https://gist.github.com/jbenet/ee6c9ac48068889b0912). If you are new to the project and would like to make changes, please fork and do your work in a feature branch. Submit a pull request and we'll check to see if it is suitable to be merged in.

Change Log
==========

4.0.0 - Not yet released

* Upgrading to mongoid 4

* 3.6.0

* Support for QRDA Cat I R3
* Additional validators for QRDA Cat I/III
* Removed GC32 & CCR code
* Support latest QDM changes
* Additional support for running in JRuby

3.5.3 - January 20, 2015

* Support for 2014 QRDA Errata Release

3.4.6 - May 15, 2014

* QRDA Cat I export now exports medical record number if present
* Measures can now generate prefilter queries to be passed to MongoDB before CQM MapReduce jobs
* BulkRecordImporter now handles JSON records and has better error handling
* Bug fix - QRDA Cat III export uses correct XML element name for representedCustodianOrganization
* Bug fix - QRDA Cat III export now properly represents CV measures
* Bug fix - QRDA Cat I import now properly stores procedure performed ordinality
* Bug fix - InsuranceProvider model included ThingsWithCodes twice

3.4.5 - April 4, 2014

* Performance improvements in all exports through template caching
* QRDA Cat I export now exports the record's actual address if present
* QRDA Cat I export - Bug fix - previously patients with a race but no ethnicity would cause exceptions
* QRDA Cat I import - performance improvements through more efficient XPath expressions

3.4.4 - March 25, 2014

* Updating the Measure model to deal with continuous variable and NQF and CMS ids through Measure.categories
* Bug fix - Filters were not properly handled by the QueryCache
* Bug fix - Fixed the order of populations in HQMF::PopulationCriteria::ALL_POPULATION_CODES so that DENEX is after denominator
* When importing measure bundles, you can now exclude patients and calculation results

3.4.3 - March 6, 2014

* Implemented support for providers in QRDA Cat III documents
* Now handles null value HQMF expression value types

3.4.2 - February 28, 2014

* Provider improvements
  * Providers are now exported in QRDA Cat I if they exist on the Record object
  * Provider identifiers are now represented with CDAIdentifiers
  * Provider import will now import any type of identifier
  * Providers can now be arranged in a hierarchy
  * When importing providers from a clinical document, matching to existing providers in MongoDB has been improved to matching on any type of identifier
* QRDA Cat I importer now imports procedure values regardless of whether the template has them at the root level or nested in an entryRelationship
* Bug fix - Result importer will no longer double import result values
* QRDA Cat I importer now imports encounter order end times
* Bug fix - QRDA Cat I importer now properly imports condition and procedure ordinaltiy

3.4.1 - January 24, 2014

* Fix for JRuby - Nokogiri is now fixed to version 1.6.0 exactly. Version 1.6.1 was breaking the CCR part of the test suite under JRuby. Nokogiri 1.6.0 works properly across Ruby 1.9.3, Ruby 2.0.0 and JRuby 1.7.9

3.4.0 - January 23, 2014

* _New Feature_ - BulkRecordImporter class now available that provides the ability to import QRDA Cat I, Consolidated CDA and HITSP C32
* TemplateHelper now properly accepts a different directory for templates
* QRDA Cat I importer now extracts negation on procedures
* Implemented support to encounter transfers in QRDA Cat I import and export
* Fixed bug where clinical trial participant would always return true on Record
* QRDA Cat I importer now extracts ordinality and values from procedures
* Better de-duplicating of data elements imported from QRDA Cat I
* CDA importers now handle removal time on medical equipment
* QRDA Cat I exporter now handles 38 week gestational period
* Stratification fixes for QRDA Cat III export
* QRDA Cat I importer now extracts incision date/time from procedure performed templates
* CDA importers set admit times on encounters
* QRDA Cat I diagnostic study order  and procedure order importer now better handles order time for CQM calculation

3.3.0 - November 7, 2013

* Removing hardcoded headers in QRDA documents and replacing them with templates populated by Ruby objects
* XML structural fixes in QRDA Category III generation
* QRDA Category I generation was previously dependent on a patient being associated with a bundle id, it will now use the latest bundle if one is not provided
* Specified a version in our dependency on rubyzip. API changes in rubyzip were breaking our code
* Fixed discrepancies between our Measure model and the JSON representation provided in measure bundles

3.2.11 - September 4, 2013

* Adding rake tasks for working with measure bundles
* Fixes for XPath expression execution when using JRuby
* OID fixes for ordinality in QRDA Category

3.2.8 - August 23, 2013

* Bug fixes for QRDA Category III generation
* Import for insurance providers from QRDA Category I documents
* Consolidated code for dealing with code system names

License
=======

Copyright 2014 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
