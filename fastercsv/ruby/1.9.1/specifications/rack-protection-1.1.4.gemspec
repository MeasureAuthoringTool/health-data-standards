# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rack-protection"
  s.version = "1.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Konstantin Haase", "Corey Ward", "David Kellum", "Fojas"]
  s.date = "2011-10-04"
  s.description = "You should use protection!"
  s.email = ["konstantin.mailinglists@googlemail.com", "coreyward@me.com", "dek-oss@gravitext.com", "developer@fojasaur.us"]
  s.homepage = "http://github.com/rkh/rack-protection"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "You should use protection!"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
    else
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
  end
end
