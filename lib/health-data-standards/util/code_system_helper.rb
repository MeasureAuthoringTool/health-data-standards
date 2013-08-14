module HealthDataStandards
  module Util
    # General helpers for working with codes and code systems
    class CodeSystemHelper
      CODE_SYSTEMS = {
        '2.16.840.1.113883.6.1' =>    'LOINC',
        '2.16.840.1.113883.6.96' =>   'SNOMED-CT',
        '2.16.840.1.113883.6.12' =>   'CPT',
        #'2.16.840.1.113883.3.88.12.80.32' => 'CPT', # Encounter Type from C32, a subset of CPT
        '2.16.840.1.113883.6.88' =>   'RxNorm',
        '2.16.840.1.113883.6.103' =>  'ICD-9-CM',
        '2.16.840.1.113883.6.104' =>  'ICD-9-PCS',
        '2.16.840.1.113883.6.4' =>   'ICD-10-PCS',
        '2.16.840.1.113883.6.90' =>   'ICD-10-CM',
        '2.16.840.1.113883.6.14' =>   'HCP',
        '2.16.840.1.113883.6.285' =>   'HCPCS',
        '2.16.840.1.113883.5.2' => "HL7 Marital Status",
        '2.16.840.1.113883.12.292' => 'CVX',
        '2.16.840.1.113883.5.83' => 'HITSP C80 Observation Status',
        '2.16.840.1.113883.3.26.1.1' => 'NCI Thesaurus',
        '2.16.840.1.113883.3.88.12.80.20' => 'FDA',
        "2.16.840.1.113883.4.9" => "UNII",
        "2.16.840.1.113883.6.69" => "NDC",
        '2.16.840.1.113883.5.14' => 'HL7 ActStatus',
        '2.16.840.1.113883.6.259' => 'HL7 Healthcare Service Location',
        '2.16.840.1.113883.12.112' => 'DischargeDisposition',
        '2.16.840.1.113883.5.4' => 'HL7 Act Code',
        '2.16.840.1.113883.1.11.18877' => 'HL7 Relationship Code',
        '2.16.840.1.113883.6.238' => 'CDC Race',
        '2.16.840.1.113883.6.177' => 'NLM MeSH',
        '2.16.840.1.113883.5.1076' => "Religious Affiliation",
        '2.16.840.1.113883.1.11.19717' => "HL7 ActNoImmunicationReason",
        '2.16.840.1.113883.3.88.12.80.33' => "NUBC",
        '2.16.840.1.113883.1.11.78' => "HL7 Observation Interpretation",
        '2.16.840.1.113883.3.221.5' => "Source of Payment Typology",
        '2.16.840.1.113883.6.13' => 'CDT',
        '2.16.840.1.113883.18.2' => 'AdministrativeSex'
      }
      
      CODE_SYSTEM_ALIASES = {
        'FDA SPL' => 'NCI Thesaurus',
        'HSLOC' => 'HL7 Healthcare Service Location',
        'SOP' => "Source of Payment Typology"
      }
      
      # Some old OID are still around in data, this hash maps retired OID values to 
      # the new value
      OID_ALIASES = {
        '2.16.840.1.113883.6.59' => '2.16.840.1.113883.12.292' # CVX
      }
      
      # Returns the name of a code system given an oid
      # @param [String] oid of a code system
      # @return [String] the name of the code system as described in the measure definition JSON
      def self.code_system_for(oid)
        oid = OID_ALIASES[oid] if OID_ALIASES[oid]
        CODE_SYSTEMS[oid] || "Unknown"
      end
      
      # Returns the oid for a code system given a codesystem name
      # @param [String] the name of the code system
      # @return [String] the oid of the code system
      def self.oid_for_code_system(code_system)
        code_system = CODE_SYSTEM_ALIASES[code_system] if CODE_SYSTEM_ALIASES[code_system]
        CODE_SYSTEMS.invert[code_system]
      end
      
      # Returns the whole map of OIDs to code systems
      # @terurn [Hash] oids as keys, code system names as values
      def self.code_systems
        CODE_SYSTEMS
      end
    end
  end
end

