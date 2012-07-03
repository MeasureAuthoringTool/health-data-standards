# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "health-data-standards"
  s.summary = "A library for generating and consuming various healthcare related formats."
  s.description = "A library for generating and consuming various healthcare related formats. This includes HITSP C32, ASTM CCR and PQRI."
  s.email = "talk@projectpophealth.org"
  s.homepage = "http://barrel.mitre.org/health-data-standards"
  s.authors = ["Andy Gregorowicz"]
  s.version = '1.0.1'
  
  s.add_dependency 'erubis', '~> 2.6'
  s.add_dependency 'mongoid', '~> 2.4.2'
  s.add_dependency 'uuid', '~> 2.3.4'
  s.add_dependency 'builder', '~> 3.0.0'
  s.add_dependency 'nokogiri', '>= 1.4.4'

  s.files = Dir.glob('lib/**/*.rb') + Dir.glob('templates/*.erb') +
            ["Gemfile", "README.md", "Rakefile", "VERSION"]
end
