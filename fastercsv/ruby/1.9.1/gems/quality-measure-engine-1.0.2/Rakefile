require 'rspec/core/rake_task'
require 'yard'
require 'metric_fu'
require 'resque/tasks'

ENV['MEASURE_DIR'] = ENV['MEASURE_DIR'] || File.join('fixtures', 'measure_defs')
ENV['MEASURE_PROPS'] = ENV['MEASURE_PROPS'] || File.join('fixtures', 'measure_props')

Dir['lib/tasks/*.rake'].sort.each do |ext|
  load ext
end

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-c", "-f progress", "-r ./spec/spec_helper.rb"]
  t.pattern = 'spec/**/*_spec.rb'
end

YARD::Rake::YardocTask.new

namespace :cover_me do
  
  task :report do
    require 'cover_me'
    CoverMe.complete!
  end
  
end

task :coverage do
  Rake::Task['spec'].invoke
  Rake::Task['cover_me:report'].invoke
end

MetricFu::Configuration.run do |config|
    #define which metrics you want to use
    config.metrics  = [:roodi, :reek, :churn, :flog, :flay]
    config.graphs   = [:flog, :flay]
    config.flay ={:dirs_to_flay => []} #Flay doesn't seem to be handling CLI arguments well... so this config squashes them
end