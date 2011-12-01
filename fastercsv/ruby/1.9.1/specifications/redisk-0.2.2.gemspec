# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "redisk"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Quint"]
  s.date = "2010-08-15"
  s.description = "Redisk includes Redisk::IO which is ~ Ruby's stdlib IO. It can be used with stdlib's Logger to log directly to redis"
  s.email = "aaron@quirkey.com"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/quirkey/redis_log"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "An interface to Redis that mimic's Ruby's IO classes"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redis>, [">= 0.1.1"])
      s.add_runtime_dependency(%q<redis-namespace>, [">= 0.1.0"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<redis>, [">= 0.1.1"])
      s.add_dependency(%q<redis-namespace>, [">= 0.1.0"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<redis>, [">= 0.1.1"])
    s.add_dependency(%q<redis-namespace>, [">= 0.1.0"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end
