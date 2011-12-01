# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "redis-namespace"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Wanstrath"]
  s.date = "2011-08-15"
  s.description = "Adds a Redis::Namespace class which can be used to namespace calls\nto Redis. This is useful when using a single instance of Redis with\nmultiple, different applications.\n"
  s.email = "chris@ozmm.org"
  s.homepage = "http://github.com/defunkt/redis-namespace"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Namespaces Redis commands."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redis>, ["< 3.0.0"])
    else
      s.add_dependency(%q<redis>, ["< 3.0.0"])
    end
  else
    s.add_dependency(%q<redis>, ["< 3.0.0"])
  end
end
