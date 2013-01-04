module HealthDataStandards
  module Export
    class C32
      def initialize
        template_helper = TemplateHelper.new('c32', 'c32')
        @rendering_context = RenderingContext.new
        @rendering_context.template_helper = template_helper
      end

      def export(patient)
        @rendering_context.render(:template => 'show', :locals => {:patient => patient})
      end
    end
  end
end