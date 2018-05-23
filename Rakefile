require 'rake/testtask'
require 'cane/rake_task'

import 'lib/tasks/hqmf.rake'

Rake::TestTask.new(:test_unit) do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = false
  t.warning = false
end



task :test => [:test_unit] do

  system("open coverage/index.html")
end
