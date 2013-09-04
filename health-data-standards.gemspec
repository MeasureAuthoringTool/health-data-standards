# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "health-data-standards"
  s.summary = "A library for generating and consuming various healthcare related formats."
  s.description = "A library for generating and consuming various healthcare related formats. This includes HITSP C32, ASTM CCR and PQRI."
  s.email = "talk@projectpophealth.org"
  s.homepage = "https://github.com/projectcypress/health-data-standards"
  s.authors = ["Andy Gregorowicz", "Sam Sayer", "Marc Hadley", "Rob Dingwell", "Andre Quina"]
  s.license = 'APL 2.0'
  
  s.version = '3.2.11'

  s.add_dependency 'rest-client', '~>1.6.7'
  s.add_dependency 'erubis', '~> 2.7.0'
  s.add_dependency 'mongoid', '~> 3.1.4'
  s.add_dependency 'activesupport', '~> 3.2.14'
  s.add_dependency 'uuid', '~> 2.3.7'
  s.add_dependency 'builder', '~> 3.0.0'
  s.add_dependency 'nokogiri', '~> 1.6.0'

  s.add_dependency 'rubyzip'

  s.add_dependency 'log4r', '~> 1.1.10'
  s.add_dependency 'memoist', '~> 0.9.1'

  s.files = Dir.glob('lib/**/*.rb') + Dir.glob('templates/**/*.erb') + Dir.glob('lib/**/*.json') + Dir.glob('lib/**/*.erb') + Dir.glob('lib/health-data-standards/tasks/*.rake') +
            ["Gemfile", "README.md", "Rakefile", "VERSION"]
end
