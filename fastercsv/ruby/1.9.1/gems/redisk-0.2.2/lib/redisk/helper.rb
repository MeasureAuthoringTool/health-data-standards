module Redisk
  module Helper
   
    def redis
      Redisk.redis
    end
    
    def redis=(server)
      Redisk.redis=(server)
    end
    
  end
end