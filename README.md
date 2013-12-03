This is a project to generate and consume HITSP C32, ASTM CCR, QRDA Category I, QRDA Category III and PQRI.

In addition this project also contains libaries for parsing HQMF documents and for dealing with NLM valuesets.

Environment
===========

This project currently uses Ruby 1.9.3, Ruby 2.0.0 and JRuby 1.7.5 and is built using [Bundler](http://gembundler.com/). To get all of the dependencies for the project, first install bundler:

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

3.3.1 - Not yet released

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

Copyright 2013 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
