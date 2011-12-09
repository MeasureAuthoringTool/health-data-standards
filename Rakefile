require 'rake/testtask'

Rake::TestTask.new(:test_unit) do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task :test, :test_unit do
  require 'cover_me'
  CoverMe.complete!
end