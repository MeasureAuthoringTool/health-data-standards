module HealthDataStandards
  module Export
    module GreenC32
      module Entry
        include TemplateHelper
        
        def export(object, object_type)
          self.template_format = "gc32"
          render(partial: object_type, locals: {object_type => object, type: object_type})
        end
        extend self
      end
    end
  end
end