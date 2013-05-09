require 'rake/testtask'
require 'cane/rake_task'
require "simplecov"

import 'lib/tasks/hqmf.rake'

Rake::TestTask.new(:test_unit) do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end



task :test => [:test_unit] do

  system("open coverage/index.html")
end
