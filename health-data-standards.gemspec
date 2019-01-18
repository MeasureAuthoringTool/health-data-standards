# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "health-data-standards"
  s.summary = "A library for generating and consuming various healthcare related formats."
  s.description = "A library for generating and consuming various healthcare related formats. These include HITSP C32, QRDA Category I, and QRDA Category III."
  s.email = "tacoma-list@lists.mitre.org"
  s.homepage = "https://github.com/projectcypress/health-data-standards"
  s.authors = ["The MITRE Corporation"]
  s.license = 'Apache-2.0'

  s.version = '4.2.0'

  s.add_dependency 'rest-client', '~> 2.0.1'
  s.add_dependency 'erubis', '~> 2.7.0'
  s.add_dependency 'mongoid', '~> 5.0.0'
  s.add_dependency 'mongoid-tree', '~> 2.0.0'
  s.add_dependency 'activesupport', '~> 4.2.0'

  s.add_dependency 'protected_attributes', '~> 1.0.5'
  s.add_dependency 'uuid', '~> 2.3.7'
  s.add_dependency 'builder', '~> 3.1'
  s.add_dependency 'nokogiri', '~> 1.8.5'
  s.add_dependency 'mongo', '~> 2.4.3'
  s.add_dependency 'highline', "~> 1.7.0"

  s.add_dependency 'rubyzip', '~> 1.2.1'
  s.add_dependency 'zip-zip', '~> 0.3'

  s.add_dependency 'log4r', '~> 1.1.10'
  s.add_dependency 'memoist', '~> 0.9.1'

  s.files = Dir.glob('lib/**/*.rb') + Dir.glob('templates/**/*.erb') + Dir.glob('lib/**/*.json') + Dir.glob('lib/**/*.erb') + Dir.glob('lib/health-data-standards/tasks/*.rake') +
            ["Gemfile", "README.md", "Rakefile"] + Dir.glob('resources/schema/**/*') + Dir.glob('resources/schematron/**/*')
end
