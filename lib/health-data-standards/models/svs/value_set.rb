module HealthDataStandards
  module SVS
    class ValueSet

      include Mongoid::Document
      field :oid, type: String
      field :display_name, type: String
      field :version, type: String

      index({oid: 1})
      index({display_name: 1})
      embeds_many :concepts
      index "concepts.code" => 1
      index "concepts.code_system" => 1
      index "concepts.code_system_name" => 1
      index "concepts.display_name" => 1
      index "bundle_id" => 1
      scope :by_oid, ->(oid){where(:oid => oid)}

      # Provides an Array of Hashes. Each code system gets its own Hash
      # The hash has a key of "set" for the code system name and "values"
      # for the actual code list
      def code_set_map
        codes = []
        self.concepts.inject({}) do |memo, concept|
          memo[concept.code_system_name] ||= []
          memo[concept.code_system_name] << concept.code
          memo
        end.each_pair do |code_set, code_list|
          codes << {"set" => code_set, "values" => code_list}
        end

        codes
      end

      def self.load_from_xml(doc)
        doc.root.add_namespace_definition("vs","urn:ihe:iti:svs:2008")
        vs_element = doc.at_xpath("/vs:RetrieveValueSetResponse/vs:ValueSet")
        if vs_element
          vs = ValueSet.new(oid: vs_element["ID"], display_name: vs_element["displayName"], version: vs_element["version"])
          concepts = vs_element.xpath("//vs:Concept").collect do |con|
            code_system_name = HealthDataStandards::Util::CodeSystemHelper::CODE_SYSTEMS[con["codeSystem"]] || con["codeSystemName"]
            Concept.new(code: con["code"], 
                        code_system_name: code_system_name,
                        code_system_version: con["code_system_version"],
                        display_name: con["displayName"], code_system: con["codeSystem"])
          end
          vs.concepts = concepts
          return vs
        end
      end
    end
  end
end