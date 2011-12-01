dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift(dir)
$LOAD_PATH.unshift(File.join(dir, '..', 'lib'))
require 'fileutils'
require 'rubygems'
require 'redisk'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end

## Redis test bootsrapping 
## Stolen with love from @defunkt's resque
## github.com/defunkt/resque

#
# make sure we can run redis
#

if !system("which redis-server")
  puts '', "** can't find `redis-server` in your path"
  puts "** try running `sudo rake install`"
  abort ''
end


#
# start our own redis when the tests start,
# kill it when they end
#

at_exit do
  exit_with = $!
  next unless exit_with.is_a?(SystemExit)
  pid = `ps -e -o pid,command | grep [r]edis-test`.split(" ")[0]
  puts "Killing test redis server..."
  `rm -f #{dir}/dump.rdb`
  Process.kill("KILL", pid.to_i)
  exit exit_with.status
end

FileUtils.mkdir_p(File.join(dir, 'tmp'))
puts "Starting redis for testing at localhost:9736..."
puts `redis-server #{dir}/redis-test.conf`
Redisk.redis = 'localhost:9736'
