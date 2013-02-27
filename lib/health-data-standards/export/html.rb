module HealthDataStandards
  module Export
    class HTML
      def initialize
        template_helper = TemplateHelper.new('html', 'html')
        @rendering_context = RenderingContext.new
        @rendering_context.template_helper = template_helper
        @rendering_context.extensions = [HealthDataStandards::Export::Helper::HTMLViewHelper]
        @code_map ||= self.build_code_map
      end

      def export(patient)
        @rendering_context.render(:template => 'show', :locals => {:patient => patient, :code_map => @code_map})
      end
      
      def build_code_map
        super_code_map = {}
        val_set_array = HealthDataStandards::SVS::ValueSet.all.to_a
        val_set_array.each do |valset| 
          valset.concepts.each do |concept|
            super_code_map[concept.code_system_name] ||= {}
            super_code_map[concept.code_system_name][concept.code] = concept.display_name unless super_code_map[concept.code_system_name][concept.code]
          end
        end
        super_code_map
      end
    end
  end
end
