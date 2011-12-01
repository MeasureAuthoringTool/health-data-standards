$LOAD_PATH.unshift(File.join(File.dirname(File.expand_path(__FILE__)), 'lib'))
require 'rubygems'
require 'rake'
require 'redisk'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "redisk"
    gem.version = Redisk::VERSION
    gem.summary = %Q{An interface to Redis that mimic's Ruby's IO classes}
    gem.description = %Q{Redisk includes Redisk::IO which is ~ Ruby's stdlib IO. It can be used with stdlib's Logger to log directly to redis}
    gem.email = "aaron@quirkey.com"
    gem.homepage = "http://github.com/quirkey/redis_log"
    gem.authors = ["Aaron Quint"]
    gem.add_dependency "redis", ">=0.1.1"
    gem.add_dependency "redis-namespace", ">=0.1.0"
    gem.add_development_dependency "rspec", ">= 1.2.9"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "redis-log #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end