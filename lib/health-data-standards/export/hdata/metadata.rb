module HealthDataStandards
  module Export
    module Hdata
      class Metadata
        def initialize
          template_helper = TemplateHelper.new('hdata')
          @rendering_context = RenderingContext.new
          @rendering_context.template_helper = template_helper
        end

        def export(entry, metadata)
          @rendering_context.render(:template => 'metadata', :locals => {entry: entry, metadata: metadata})
        end
      end
    end
  end
end