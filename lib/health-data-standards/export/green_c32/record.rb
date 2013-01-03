module HealthDataStandards
  module Export
    module GreenC32
      class Record
        def initialize
          template_helper = TemplateHelper.new('gc32')
          @rendering_context = RenderingContext.new
          @rendering_context.template_helper = template_helper
        end

        def export(patient)
          @rendering_context.render(:template => 'record', :locals => {:record => patient})
        end
      end
    end
  end
end