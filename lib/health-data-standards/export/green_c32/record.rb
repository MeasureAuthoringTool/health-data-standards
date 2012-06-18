module HealthDataStandards
  module Export
    module GreenC32
      module Record
        include TemplateHelper
        
        def export(object)
          self.template_format = "gc32"
          render(template: "record", locals: {record: object})
        end
        extend self
      end
    end
  end
end