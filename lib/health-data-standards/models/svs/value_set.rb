module HealthDataStandards
  module SVS
    class ValueSet
      include Mongoid::Document
      field :oid, type: String
      field :display_name, type: String
      field :version, type: String
      field :user_id, type: String # Eventually we need to delete this from bundles when exporting
      field :categories, type: Hash

      belongs_to :bundle, class_name: "HealthDataStandards::CQM::Bundle", inverse_of: :value_sets

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
        vs_element = doc.at_xpath("/vs:RetrieveValueSetResponse/vs:ValueSet|/vs:RetrieveMultipleValueSetsResponse/vs:DescribedValueSet")
        if vs_element
          vs = ValueSet.new(oid: vs_element["ID"], display_name: vs_element["displayName"], version: vs_element["version"])
          vs.concepts = extract_concepts(vs_element)
          vs.categories = extract_categories(vs_element)
          return vs
        end
      end

      def self.extract_concepts(vs_element)
        concepts = vs_element.xpath("//vs:Concept").collect do |con|
        code_system_name = HealthDataStandards::Util::CodeSystemHelper::CODE_SYSTEMS[con["codeSystem"]] || con["codeSystemName"]
        Concept.new(code: con["code"], 
                    code_system_name: code_system_name,
                    code_system_version: con["codeSystemVersion"],
                    display_name: con["displayName"], code_system: con["codeSystem"])
        end
      end

      def self.extract_categories(vs_element)
        category_hash = Hash.new {|h,k| h[k]=[]}
        groups_with_categories = vs_element.xpath("//vs:Group/@ID[../@displayName='CATEGORY']")
        groups_with_categories.each do |group_number|
          measure = vs_element.xpath("//vs:Group[@displayName='CMS eMeasure ID' and @ID='#{group_number}']/vs:Keyword").text
          categories_for_group = vs_element.xpath("//vs:Group[@displayName='CATEGORY' and @ID='#{group_number}']/vs:Keyword")
          categories_for_group.each do |category|
            category_hash[measure] << category.text
          end
        end
        category_hash.size > 0 ? category_hash : nil
      end
    end
  end
end
