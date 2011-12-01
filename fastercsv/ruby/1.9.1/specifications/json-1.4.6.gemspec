# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "json"
  s.version = "1.4.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Florian Frank"]
  s.date = "2010-08-08"
  s.description = "This is a JSON implementation as a Ruby extension in C."
  s.email = "flori@ping.de"
  s.executables = ["edit_json.rb", "prettify_json.rb"]
  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
  s.extra_rdoc_files = ["README"]
  s.files = ["bin/edit_json.rb", "bin/prettify_json.rb", "README", "ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
  s.homepage = "http://flori.github.com/json"
  s.rdoc_options = ["--title", "JSON implemention for Ruby", "--main", "README"]
  s.require_paths = ["ext/json/ext", "ext", "lib"]
  s.rubyforge_project = "json"
  s.rubygems_version = "1.8.10"
  s.summary = "JSON Implementation for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
