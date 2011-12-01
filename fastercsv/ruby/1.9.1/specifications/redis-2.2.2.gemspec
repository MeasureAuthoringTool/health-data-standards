# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "redis"
  s.version = "2.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ezra Zygmuntowicz", "Taylor Weibley", "Matthew Clark", "Brian McKinney", "Salvatore Sanfilippo", "Luca Guidi", "Michel Martens", "Damian Janowski", "Pieter Noordhuis"]
  s.autorequire = "redis"
  s.date = "2011-08-03"
  s.description = "Ruby client library for Redis, the key value storage server"
  s.email = "ez@engineyard.com"
  s.homepage = "http://github.com/ezmobius/redis-rb"
  s.require_paths = ["lib"]
  s.rubyforge_project = "redis-rb"
  s.rubygems_version = "1.8.10"
  s.summary = "Ruby client library for Redis, the key value storage server"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
