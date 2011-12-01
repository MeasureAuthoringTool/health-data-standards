# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pry"
  s.version = "0.9.7.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Mair (banisterfiend)"]
  s.date = "2011-11-05"
  s.description = "An IRB alternative and runtime developer console"
  s.email = "jrmair@gmail.com"
  s.executables = ["pry"]
  s.files = ["bin/pry"]
  s.homepage = "http://pry.github.com"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "An IRB alternative and runtime developer console"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby_parser>, [">= 2.3.1"])
      s.add_runtime_dependency(%q<coderay>, ["~> 0.9.8"])
      s.add_runtime_dependency(%q<slop>, ["~> 2.1.0"])
      s.add_runtime_dependency(%q<method_source>, ["~> 0.6.7"])
      s.add_development_dependency(%q<bacon>, ["~> 1.1.0"])
      s.add_development_dependency(%q<open4>, ["~> 1.0.1"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
    else
      s.add_dependency(%q<ruby_parser>, [">= 2.3.1"])
      s.add_dependency(%q<coderay>, ["~> 0.9.8"])
      s.add_dependency(%q<slop>, ["~> 2.1.0"])
      s.add_dependency(%q<method_source>, ["~> 0.6.7"])
      s.add_dependency(%q<bacon>, ["~> 1.1.0"])
      s.add_dependency(%q<open4>, ["~> 1.0.1"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<ruby_parser>, [">= 2.3.1"])
    s.add_dependency(%q<coderay>, ["~> 0.9.8"])
    s.add_dependency(%q<slop>, ["~> 2.1.0"])
    s.add_dependency(%q<method_source>, ["~> 0.6.7"])
    s.add_dependency(%q<bacon>, ["~> 1.1.0"])
    s.add_dependency(%q<open4>, ["~> 1.0.1"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
  end
end
