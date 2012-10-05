# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "health-data-standards"
  s.summary = "A library for generating and consuming various healthcare related formats."
  s.description = "A library for generating and consuming various healthcare related formats. This includes HITSP C32, ASTM CCR and PQRI."
  s.email = "talk@projectpophealth.org"
  s.homepage = "https://github.com/projectcypress/health-data-standards"
  s.authors = ["Andy Gregorowicz", "Sam Sayer", "Marc Hadley", "Rob Dingwell"]
  s.version = '2.1.0'
  
  s.add_dependency 'rest-client', '~>1.6.7'
  s.add_dependency 'erubis', '~> 2.7.0'
  s.add_dependency 'mongoid', '~> 3.0.6'
  s.add_dependency 'uuid', '~> 2.3.5'
  s.add_dependency 'builder', '~> 3.0.0'
  s.add_dependency 'nokogiri', '~> 1.5.5'

  s.files = Dir.glob('lib/**/*.rb') + Dir.glob('templates/*.erb') +
            ["Gemfile", "README.md", "Rakefile", "VERSION"]
end
