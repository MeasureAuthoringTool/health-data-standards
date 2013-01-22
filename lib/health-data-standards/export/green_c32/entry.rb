module HealthDataStandards
  module Export
    module GreenC32
      class Entry
        def initialize
          template_helper = TemplateHelper.new('gc32', 'gc32')
          @rendering_context = RenderingContext.new
          @rendering_context.template_helper = template_helper
          @rendering_context.extensions = [HealthDataStandards::Export::Helper::GC32ViewHelper]
        end
        
        def export(object, object_type)
          @rendering_context.render(partial: object_type, locals: {object_type => object, type: object_type})
        end
      end
    end
  end
end