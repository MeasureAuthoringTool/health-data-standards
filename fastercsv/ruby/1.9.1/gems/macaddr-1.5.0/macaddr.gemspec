## macaddr.gemspec
#

Gem::Specification::new do |spec|
  spec.name = "macaddr"
  spec.version = "1.5.0"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "macaddr"
  spec.description = "description: macaddr kicks the ass"

  spec.files =
["Gemfile",
 "LICENSE",
 "README",
 "Rakefile",
 "lib",
 "lib/macaddr.rb",
 "macaddr.gemspec",
 "rvmrc.example",
 "test",
 "test/data",
 "test/data/osx",
 "test/mac_test.rb",
 "test/testing.rb"]

  spec.executables = []
  
  spec.require_path = "lib"

  spec.test_files = nil

  
    spec.add_dependency(*["systemu", ">= 2.4.0"])
  

  spec.extensions.push(*[])

  spec.rubyforge_project = "codeforpeople"
  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "https://github.com/ahoward/macaddr"
end
