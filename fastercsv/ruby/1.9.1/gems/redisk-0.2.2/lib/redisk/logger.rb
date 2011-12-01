# Redisk::Log is a wrapper around logger, that uses Redisk::IO internally and provides some extra options
module Redisk
  class Logger
    extend Helper
    include Helper
    
    attr_reader :name, :logger, :io
    
    def initialize(name, options = {})
      @name     = name
      @io       = Redisk::IO.new(name)
      @truncate = options.delete(:truncate) || false
      @logger   = ::Logger.new(@io, options)
    end
   
    def length
      @io.length
    end
   
    def truncate!
      @io.truncate(@truncate) if @truncate && length > @truncate
    end
   
    # delegate to logger
    def method_missing(meth, *args)
      if @logger.respond_to?(meth)
        returned = @logger.send(meth, *args)
        truncate!
        returned
      else
        super
      end
    end
    
  end
end