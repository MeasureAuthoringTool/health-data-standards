require 'rubygems'
require 'yajl'
require 'redisk'

hash = {'something' => 'for nothing', 'and_the_rest' => 'for free', 'i' => {'want' => {'my' => 'mtv'}}}

io_name = 'test.json'
Redisk::IO.unlink(io_name)

puts 'The hash:'
puts hash.inspect

puts 'write the hash as json to redis'
io = Redisk::IO.new(io_name)
Yajl::Encoder.encode(hash, io)

puts 'read it back out'
io.rewind
puts io.read.inspect

io.rewind

puts 'parse it back to ruby'
puts Yajl::Parser.parse(io).inspect