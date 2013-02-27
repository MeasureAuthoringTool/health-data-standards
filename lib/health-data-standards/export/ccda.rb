module HealthDataStandards
  module Export
    class CCDA
      def initialize
        template_helper = TemplateHelper.new('ccda', 'ccda')
        @rendering_context = RenderingContext.new
        @rendering_context.template_helper = template_helper
      end

      def export(patient)
        @rendering_context.render(:template => 'show', :locals => {:patient => patient})
      end      
    end
  end
end