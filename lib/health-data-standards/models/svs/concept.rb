module HealthDataStandards
  module SVS

    class Concept
	
    	include Mongoid::Document
      include Mongoid::Attributes::Dynamic
    	field :code, type: String
    	field :code_system_name, type: String
    	field :code_system_version, type: String
    	field :display_name, type: String
      field :code_system, type: String
      scope :by_code_system_name,  ->(cs){where(code_system_name: cs)}
      scope :by_code_system,  ->(cs){where(code_system: cs)}
      
      def ==(comp)
        if (self.code != comp.code)
          return false
        end
        if (self.code_system_name != comp.code_system_name)
          return false
        end
        return true
      end
    end
  end
end