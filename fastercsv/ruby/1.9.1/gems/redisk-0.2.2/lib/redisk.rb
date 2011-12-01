require 'logger'
require 'redis/namespace'
require 'redisk/helper'
require 'redisk/stat'
require 'redisk/io'
require 'redisk/logger'

module Redisk
  VERSION = '0.2.2'
  
  extend self
  
  # straight up lifted from from @defunkt's resque
  # Accepts a 'hostname:port' string or a Redis server.
  def redis=(server)
    case server
    when String
      host, port = server.split(':')
      redis = Redis.new(:host => host, :port => port, :thread_safe => true)
      @redis = Redis::Namespace.new(:redisk, :redis => redis)
    when Redis::Namespace
      @redis = server
    when Redis
      @redis = Redis::Namespace.new(:redisk, :redis => server)
    else
      raise "I don't know what to do with #{server.inspect}"
    end
  end

  # Returns the current Redis connection. If none has been created, will
  # create a new one.
  def redis
    return @redis if @redis
    self.redis = 'localhost:6379'
    self.redis
  end
  
  def io(*args)
    Redisk::IO.new(*args)
  end
  
  def logger(*args)
    Redisk::Logger.new(*args)
  end
  
end

class String
  
  if !method_defined?(:ord)
    def ord
      self[0]
    end
  end
  
end