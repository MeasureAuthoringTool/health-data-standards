# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "coderay"
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["murphy"]
  s.date = "2011-05-01"
  s.description = "Fast and easy syntax highlighting for selected languages, written in Ruby.\nComes with RedCloth integration and LOC counter.\n"
  s.email = "murphy@rubychan.de"
  s.executables = ["coderay", "coderay_stylesheet"]
  s.extra_rdoc_files = ["lib/README", "FOLDERS"]
  s.files = ["bin/coderay", "bin/coderay_stylesheet", "lib/README", "FOLDERS"]
  s.homepage = "http://coderay.rubychan.de"
  s.rdoc_options = ["-SNw2", "-mlib/README", "-t CodeRay Documentation"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.2")
  s.rubyforge_project = "coderay"
  s.rubygems_version = "1.8.10"
  s.summary = "Fast syntax highlighting for selected languages."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
