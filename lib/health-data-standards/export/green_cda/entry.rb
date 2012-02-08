module HealthDataStandards
  module Export
    module GreenCda
      module Entry
        include TemplateHelper
        
        def export(object, object_type)
          self.template_format = "greencda"
          render(partial: object_type, locals: {object_type => object})
        end
        extend self
      end
    end
  end
end