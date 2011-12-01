# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "macaddr"
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ara T. Howard"]
  s.date = "2011-11-02"
  s.description = "description: macaddr kicks the ass"
  s.email = "ara.t.howard@gmail.com"
  s.homepage = "https://github.com/ahoward/macaddr"
  s.require_paths = ["lib"]
  s.rubyforge_project = "codeforpeople"
  s.rubygems_version = "1.8.10"
  s.summary = "macaddr"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<systemu>, [">= 2.4.0"])
    else
      s.add_dependency(%q<systemu>, [">= 2.4.0"])
    end
  else
    s.add_dependency(%q<systemu>, [">= 2.4.0"])
  end
end
