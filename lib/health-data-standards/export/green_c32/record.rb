module HealthDataStandards
  module Export
    module GreenC32
      class Record
        def initialize
          template_helper = TemplateHelper.new('gc32', 'gc32')
          @rendering_context = RenderingContext.new
          @rendering_context.template_helper = template_helper
          @rendering_context.extensions = [HealthDataStandards::Export::Helper::GC32ViewHelper]
        end

        def export(patient)
          @rendering_context.render(:template => 'record', :locals => {:record => patient})
        end
      end
    end
  end
end