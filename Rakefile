require 'rake/testtask'
require 'cane/rake_task'
require "simplecov"

Rake::TestTask.new(:test_unit) do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

Cane::RakeTask.new(:quality) do |cane|
  cane.abc_max = 45
  # cane.add_threshold 'coverage/covered_percent', :>=, 97
  cane.style_measure = 120
  cane.no_style = true
  cane.no_doc = true
end

task :test => [:test_unit, :quality] do

  system("open coverage/index.html")
end
