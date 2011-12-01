module QME
  module Importer
    # General helpers for working with codes and code systems
    class CodeSystemHelper
      CODE_SYSTEMS = {
        '2.16.840.1.113883.6.1' =>    'LOINC',
        '2.16.840.1.113883.6.96' =>   'SNOMED-CT',
        '2.16.840.1.113883.6.12' =>   'CPT',
        #'2.16.840.1.113883.3.88.12.80.32' => 'CPT',
        '2.16.840.1.113883.6.88' =>   'RxNorm',
        '2.16.840.1.113883.6.103' =>  'ICD-9-CM',
        '2.16.840.1.113883.6.104' =>  'ICD-9-CM',
        '2.16.840.1.113883.6.90' =>   'ICD-10-CM',
        '2.16.840.1.113883.6.14' =>   'HCPCS',
        '2.16.840.1.113883.6.59' =>   'CVX'
      }
      
      # Returns the name of a code system given an oid
      # @param [String] oid of a code system
      # @return [String] the name of the code system as described in the measure definition JSON
      def self.code_system_for(oid)
        CODE_SYSTEMS[oid] || "Unknown"
      end
      
      @@oid_map = nil
      
      # Returns the oid for a code system given a codesystem name
      # @param [String] the name of the code system
      # @return [String] the oid of the code system
      def self.oid_for_code_system(codesystem)
        if(!@@oid_map)
          @@oid_map = {}
          CODE_SYSTEMS.each_pair do |oid, codesystem|
 #            STDERR.puts "Adding #{oid}, #{codesystem}"
            @@oid_map[codesystem] = oid
          end
        end
#        STDERR.puts "@@oid_map[#{codesystem}] = #{@@oid_map[codesystem]}"
        return @@oid_map[codesystem]    
      end
      
    end
  end
end

