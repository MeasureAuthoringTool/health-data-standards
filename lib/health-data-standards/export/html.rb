module HealthDataStandards
  module Export
    class HTML
      def initialize
        template_helper = TemplateHelper.new('html', 'html')
        @rendering_context = RenderingContext.new
        @rendering_context.template_helper = template_helper
      end

      def export(patient, concept_map=nil)
        @rendering_context.render(:template => 'show', :locals => {:patient => patient, :concept_map=>concept_map})
      end
    end
  end
end