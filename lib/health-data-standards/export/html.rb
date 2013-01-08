module HealthDataStandards
  module Export
    module HTML
      include TemplateHelper

      def export(patient, concept_map=nil, code_map=nil)
        self.template_format = "html"
        self.template_subdir = "html"

        self.generate_code_map

        render(:template => 'show', :locals => {:patient => patient, :concept_map=>concept_map, :code_map => @code_map})

      end
      
      def generate_code_map
        @code_map ||= self.build_code_map
      end

      def build_code_map
        super_code_map = {}
        val_set_array = HealthDataStandards::SVS::ValueSet.all.to_a
        val_set_array.each do |valset| 
          valset.concepts.each do |concept|
            code_group_name = HealthDataStandards::SVS::ValueSet.normalize_code_set_name(concept.code_system_name)
            super_code_map[code_group_name] ||= {}
            super_code_map[code_group_name][concept.code] = concept.display_name
          end
        end
        super_code_map
      end

      extend self
      
      
    end
  end
end