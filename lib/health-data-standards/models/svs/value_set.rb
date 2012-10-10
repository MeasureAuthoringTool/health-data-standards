module HealthDataStandards
  module SVS
    class ValueSet

    	include Mongoid::Document
      field :oid, type: String
      field :display_name, type: String
      field :version, type: String

      embeds_many :concepts
      scope :by_oid, ->(oid){where(:oid => oid)}

      def self.load_from_xml(doc)
      	  doc.root.add_namespace_definition("vs","urn:ihe:iti:svs:2008")
      	 	vs_element = doc.at_xpath("/vs:RetrieveValueSetResponse/vs:ValueSet")
      	 	if vs_element
      	 		vs = ValueSet.new(oid: vs_element["ID"], display_name: vs_element["displayName"], version: vs_element["version"])
      	 		concepts = vs_element.xpath("//vs:Concept").collect do |con|
      	 				Concept.new(code: con["code"], 
      	 					code_system_name: con["codeSystemName"], 
      	 					code_system_version: con["code_system_version"],
      	 				  display_name: con["displayName"])
      	 		   end
                vs.concepts = concepts
      	 		return vs
      	 	end
      end
    end
  end
end