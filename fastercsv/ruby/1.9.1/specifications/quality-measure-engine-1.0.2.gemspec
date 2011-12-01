# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "quality-measure-engine"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marc Hadley", "Andy Gregorowicz", "Rob Dingwell"]
  s.date = "2011-09-29"
  s.description = "A library for extracting quality measure information from HITSP C32's and ASTM CCR's"
  s.email = "talk@projectpophealth.org"
  s.homepage = "http://github.com/pophealth/quality-measure-engine"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A library for extracting quality measure information from HITSP C32's and ASTM CCR's"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongo>, ["~> 1.3"])
      s.add_runtime_dependency(%q<rubyzip>, ["~> 0.9.4"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.4.4"])
      s.add_runtime_dependency(%q<resque>, ["~> 1.15.0"])
      s.add_runtime_dependency(%q<resque-status>, ["~> 0.2.3"])
      s.add_development_dependency(%q<jsonschema>, ["~> 2.0.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<awesome_print>, ["~> 0.3"])
      s.add_development_dependency(%q<roo>, ["~> 1.9.3"])
      s.add_development_dependency(%q<builder>, ["~> 3.0.0"])
      s.add_development_dependency(%q<spreadsheet>, ["~> 0.6.5.2"])
      s.add_development_dependency(%q<google-spreadsheet-ruby>, ["~> 0.1.2"])
    else
      s.add_dependency(%q<mongo>, ["~> 1.3"])
      s.add_dependency(%q<rubyzip>, ["~> 0.9.4"])
      s.add_dependency(%q<nokogiri>, ["~> 1.4.4"])
      s.add_dependency(%q<resque>, ["~> 1.15.0"])
      s.add_dependency(%q<resque-status>, ["~> 0.2.3"])
      s.add_dependency(%q<jsonschema>, ["~> 2.0.0"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<awesome_print>, ["~> 0.3"])
      s.add_dependency(%q<roo>, ["~> 1.9.3"])
      s.add_dependency(%q<builder>, ["~> 3.0.0"])
      s.add_dependency(%q<spreadsheet>, ["~> 0.6.5.2"])
      s.add_dependency(%q<google-spreadsheet-ruby>, ["~> 0.1.2"])
    end
  else
    s.add_dependency(%q<mongo>, ["~> 1.3"])
    s.add_dependency(%q<rubyzip>, ["~> 0.9.4"])
    s.add_dependency(%q<nokogiri>, ["~> 1.4.4"])
    s.add_dependency(%q<resque>, ["~> 1.15.0"])
    s.add_dependency(%q<resque-status>, ["~> 0.2.3"])
    s.add_dependency(%q<jsonschema>, ["~> 2.0.0"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<awesome_print>, ["~> 0.3"])
    s.add_dependency(%q<roo>, ["~> 1.9.3"])
    s.add_dependency(%q<builder>, ["~> 3.0.0"])
    s.add_dependency(%q<spreadsheet>, ["~> 0.6.5.2"])
    s.add_dependency(%q<google-spreadsheet-ruby>, ["~> 0.1.2"])
  end
end
