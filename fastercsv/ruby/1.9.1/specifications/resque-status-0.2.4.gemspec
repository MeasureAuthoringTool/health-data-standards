# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "resque-status"
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Quint"]
  s.date = "2011-08-10"
  s.description = "resque-status is an extension to the resque queue system that provides simple trackable jobs. It provides a Resque::Status class which can set/get the statuses of jobs and a Resque::JobWithStatus class that when subclassed provides easily trackable/killable jobs."
  s.email = "aaron@quirkey.com"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/quirkey/resque-status"
  s.require_paths = ["lib"]
  s.rubyforge_project = "quirkey"
  s.rubygems_version = "1.8.10"
  s.summary = "resque-status is an extension to the resque queue system that provides simple trackable jobs."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<uuid>, [">= 2.0.2"])
      s.add_runtime_dependency(%q<resque>, [">= 1.3.1"])
      s.add_runtime_dependency(%q<redisk>, [">= 0.2.1"])
      s.add_development_dependency(%q<shoulda>, [">= 2.10.2"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.8"])
    else
      s.add_dependency(%q<uuid>, [">= 2.0.2"])
      s.add_dependency(%q<resque>, [">= 1.3.1"])
      s.add_dependency(%q<redisk>, [">= 0.2.1"])
      s.add_dependency(%q<shoulda>, [">= 2.10.2"])
      s.add_dependency(%q<mocha>, [">= 0.9.8"])
    end
  else
    s.add_dependency(%q<uuid>, [">= 2.0.2"])
    s.add_dependency(%q<resque>, [">= 1.3.1"])
    s.add_dependency(%q<redisk>, [">= 0.2.1"])
    s.add_dependency(%q<shoulda>, [">= 2.10.2"])
    s.add_dependency(%q<mocha>, [">= 0.9.8"])
  end
end
