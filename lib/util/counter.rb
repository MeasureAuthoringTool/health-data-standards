module HQMF
  # Simple class to issue monotonically increasing integer identifiers
  class InstanceCounter
    def initialize
      @count=0
    end

    def reset
      @count=0
    end

    def next
      @count+=1
    end
  end

  class Counter < InstanceCounter
    include Singleton
  end
end    
