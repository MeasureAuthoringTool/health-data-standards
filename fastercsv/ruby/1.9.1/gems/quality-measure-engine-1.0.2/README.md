This project is a library designed to calculate clinical quality measures over a given population. Quality measures are described via JSON and provide the details on what information is needed from a patient record to calculate a quality measure. The logic of the measure is described in JavaScript using the MapReduce algorithmic framework.

Usage
=====

Extracting Measure Data from a HITSP C32
----------------------------------------

Each quality measure will need to extract specific information from a HITSP C32 for calculation. First, for each quality measure, a QME::Importer::GenericImporter should be created by passing in the JSON definition of the quality measure.

Next, an instance of QME::Importer::PatientImporter should be obtained by calling instance (it follows the singleton pattern). Add the GenericImporters for each desired measure with the add measure method. Finally, you can get a JSON representation of a patient record with the necessary information extracted by calling parse_c32.

Calculating Quality Measures
----------------------------

Results of quality measures are represented by QME::QualityReport. This class provides ways to determine if a report has been calculated for a population in the database as well as ways to create jobs to run the calculations.

Environment
===========

This project currently uses Ruby 1.9.2 and is built using [Bundler](http://gembundler.com/). To get all of the dependencies for the project, first install bundler:

    gem install bundler

Then run bundler to grab all of the necessary gems:

    bundle install

The Quality Measure engine relies on a MongoDB [MongoDB](http://www.mongodb.org/) running a minimum of version 1.8.* or higher.  To get and install Mongo refer to:

    http://www.mongodb.org/display/DOCS/Quickstart

It also relies on [Redis](http://redis.io/) for background jobs via [Resque](https://github.com/defunkt/resque). To install Redis, please refer to:

    http://redis.io/download

You can also find information on Redis at the [Resque homepage](https://github.com/defunkt/resque). Resque is used by this project to calculate quality measures in  background jobs. We also use [resque-status](https://github.com/quirkey/resque-status). Please consult the resque-status instructions for working with the resque-web application if you would like to use it to monitor status.

Running Resque Workers
----------------------

QME::QualityReport will kick off background jobs with Resque. For these jobs to to actually get performed, you need to be running resque workers. This can be done with the following:

    QUEUE=* bundle exec rake resque:work

Testing
=======

This project uses [RSpec](http://github.com/rspec/rspec-core) for testing. To run the suite, just enter the following:

    bundle exec rake spec

The coverage of the test suite is monitored with [cover_me](https://github.com/markbates/cover_me) and can be run with:

    bundle exec rake coverage

Map Reduce Testing
------------------

This project used the [MapReduce](http://www.mongodb.org/display/DOCS/MapReduce) functionality of MongoDB pretty heavily.
Debugging JavaScript that is to be run inside of MongoDB can be a bit of a chore, so there is a testing tool that can be run
in your browser to aid in troubleshooting.

The tool is a very small web application based on the [Sinatra](http://www.sinatrarb.com/) framework. It can be run
by executing the following command:

    bundle exec ruby map_test/map_test.rb

After running this command, you can open your browser to [http://localhost:4567](http://localhost:4567). This will show you a page
of measures to choose from. Once you have selected a measure, it will take you to a page where you can choose the map function you
want to test and the effective date you want to run the function with. Once that is selected, you will arrive at the map test page.
The map test page provides the ability to load test JSON records from within the project. Once they are loaded, they can be edited
in the textarea on the page. Finally, if you click the "run" button, it will execute the map function on the record in the text area
and output the results. Since this is executing in a web browser, you can use the JavaScript debugging utilities provided to set
breakpoints and inspect variables.

Source Code Analysis
--------------------

This project uses [metric_fu](http://metric-fu.rubyforge.org/) for source code analysis. Reports can be run with:

    bundle exec rake metrics:all

The project is currently configured to run Flay, Flog, Churn, Reek and Roodi

Project Practices
=================

Please try to follow our [Coding Style Guides](http://github.com/eedrummer/styleguide). Additionally, we will be using git in a pattern similar to [Vincent Driessen's workflow](http://nvie.com/posts/a-successful-git-branching-model/). While feature branches are encouraged, they are not required to work on the project.
